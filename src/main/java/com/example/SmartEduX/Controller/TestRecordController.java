package com.example.SmartEduX.Controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.example.SmartEduX.Mapper.*;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.*;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.ibatis.jdbc.Null;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Api(tags = "API接口")
@RestController
@RequestMapping("testrecord")
@CrossOrigin(origins = "*", maxAge = 3600)
public class TestRecordController {
    @Autowired
    @Resource
    private TestRecordMapper testRecordMapper;

    @Autowired
    @Resource
    private UserMapper userMapper;

    @Autowired
    @Resource
    private TestRecord_QuestionMapper testRecord_questionMapper;

    @Autowired
    @Resource
    private QuestionKnowledgeMapper questionKnowledgeMapper;

    @Autowired
    @Resource
    private TestAnalyseKnowledgeMapper testAnalyseKnowledgeMapper;

    @Autowired
    @Resource
    private TestAnalyseMapper testAnalyseMapper;

    @Autowired
    @Resource
    private KnowledgeMapper knowledgeMapper;

    @ApiOperation("添加一条新的记录")
    @CrossOrigin
    @PostMapping("/addrecord")
    public Result<?> addrecord(@RequestBody Map<String, Integer> requestData) {
//        在testrecord插入一行
        TestRecord testRecord = new TestRecord();
        Integer paperid = requestData.get("paperid");
        Integer userid = requestData.get("userid");
        // 检查数据库中是否已存在相同用户名的用户
        User res1 = userMapper.selectOne(Wrappers.<User>lambdaQuery().eq(User::getUserid, userid));
        if(res1 != null){
//            新建一个testrecord
            testRecord.setUserid(userid);
            testRecord.setFinishstate(0);
            Date currentDate = new Date();
//            System.out.println(currentDate);
            testRecord.setStarttime(currentDate);
            testRecord.setTestpaperid(paperid);
            testRecord.setTestscore(0.000F);
//            刚开始考试没有考试分析
//            testRecord.setTestanalyseid();

            testRecordMapper.insert(testRecord);
            return Result.success(testRecord.getTestrecordid(),"成功");
        }else{
            return Result.error("-1","新建考试记录：未查找到用户！");
        }
    }

    @ApiOperation("完成记录")
    @CrossOrigin
    @GetMapping("/endrecord")
    public Result<?> endrecord(@RequestParam Integer rid, @RequestParam Float score) {
        TestRecord testRecordFromDB = testRecordMapper.selectById(rid);
        if(testRecordFromDB != null){
            testRecordFromDB.setFinishstate(1);
            testRecordFromDB.setTestscore(score);
            Date currentDate = new Date();
//            System.out.println(currentDate);
            testRecordFromDB.setFinishtime(currentDate);
            testRecordMapper.updateById(testRecordFromDB);
        }
        return Result.success(testRecordFromDB,"成功");
    }

    @ApiOperation("获取用户某个卷子的所有记录")
    @CrossOrigin
    @GetMapping("/getrecordbyid")
    public Result<?> getRecordByID(@RequestParam Integer pid, @RequestParam Integer userid) {
        List<TestRecord> testRecords = testRecordMapper.selectList(
                new LambdaQueryWrapper<TestRecord>()
                        .eq(TestRecord::getTestpaperid, pid)
                        .and(wrapper -> wrapper.eq(TestRecord::getUserid, userid)));
            return Result.success(testRecords,"成功");
    }

    @ApiOperation("获取用户某张卷子的某个记录")
    @CrossOrigin
    @GetMapping("/getrecordinfobyid")
    public Result<?> getRecordInfoByID(@RequestParam Integer rid) {
        TestRecord testRecordFromDB = testRecordMapper.selectById(rid);
        return Result.success(testRecordFromDB,"成功");
    }



    @ApiOperation("记录正确情况")
    @CrossOrigin
    @PostMapping ("/recordcorrection")
    public Result<?> recordCorrection(@RequestBody String list) {
        // 1. Create Gson object
        Gson gson = new Gson();
        // 2. Define the type for the List inside the "list" key
        Type listType = new TypeToken<List<TestRecord_Question>>() {}.getType();

        // 3. Get the "list" element from the JSON string
        JsonObject jsonObject = new JsonParser().parse(list).getAsJsonObject();
        JsonArray jsonArray = jsonObject.getAsJsonArray("list");

        // 4. Use Gson to parse the "list" array
        List<TestRecord_Question> testRecord_questions = gson.fromJson(jsonArray, listType);


        for (TestRecord_Question question : testRecord_questions){
            TestRecord_Question question1 = testRecord_questionMapper.selectOne(new LambdaQueryWrapper<TestRecord_Question>()
                    .eq(TestRecord_Question::getTestquestionid, question.getTestquestionid())
                    .and(wrapper -> wrapper.eq(TestRecord_Question::getTestrecordid, question.getTestrecordid())));

            if(question1 != null){
                question1.setIscorrect(question.getIscorrect());
                testRecord_questionMapper.update(question1,new LambdaQueryWrapper<TestRecord_Question>()
                        .eq(TestRecord_Question::getTestquestionid, question1.getTestquestionid())
                        .and(wrapper -> wrapper.eq(TestRecord_Question::getTestrecordid, question1.getTestrecordid())));
            }else{
                testRecord_questionMapper.insert(question);
            }
        }

//        开始处理考试分析
//        先查找是否已经有考试分析，根据TestRecordID
        TestRecord testRecord = testRecordMapper.selectById(testRecord_questions.get(0).getTestrecordid());
        TestAnalyse testAnalyse = testAnalyseMapper.selectById(testRecord_questions.get(0).getTestrecordid());
        if(testAnalyse == null) {
            testAnalyse = new TestAnalyse();
            testAnalyse.setTestrecordid(testRecord.getTestrecordid());
            testAnalyse.setQuestionnumber(testRecord_questions.size());
            testAnalyse.setCorrectquantity(getCorrectQuantity(testRecord_questions));
            testAnalyse.setUserid(testRecord.getUserid());
            testAnalyse.setAccuracy((float) testAnalyse.getCorrectquantity() / testAnalyse.getQuestionnumber());
            testAnalyse.setAccuracyproposal(getAccuracyProposal(testAnalyse.getAccuracy()));
            testAnalyseMapper.insert(testAnalyse);

//            处理testanalyse_knowledge
            for (TestRecord_Question question : testRecord_questions){
                List<QuestionKnowledge> questionKnowledges = getKnowledgeList(question.getTestquestionid());
                for (QuestionKnowledge questionKnowledge : questionKnowledges){
                    TestAnalyseKnowledge testAnalyseKnowledge = new TestAnalyseKnowledge();
                    testAnalyseKnowledge.setTestanalyseid(testAnalyse.getTestanalyseid());
                    testAnalyseKnowledge.setKnowledgeid(questionKnowledge.getKnowledgeid());
//                    先查找testanalyseid和knowledgeid是否已经存在
                    TestAnalyseKnowledge testAnalyseKnowledge1 = testAnalyseKnowledgeMapper.selectOne(new LambdaQueryWrapper<TestAnalyseKnowledge>()
                            .eq(TestAnalyseKnowledge::getTestanalyseid, testAnalyseKnowledge.getTestanalyseid())
                            .and(wrapper -> wrapper.eq(TestAnalyseKnowledge::getKnowledgeid, testAnalyseKnowledge.getKnowledgeid())));
                    if(testAnalyseKnowledge1 == null) {
//                       不存在，插入
                        testAnalyseKnowledge.setContainknowledgenum(1);
//                        如果用户答错了，设置为0
                        if(question.getIscorrect() == 0) {
                            testAnalyseKnowledge.setCorrectknowledgenum(0);
                        }else{
                            testAnalyseKnowledge.setCorrectknowledgenum(1);
                        }
                        testAnalyseKnowledgeMapper.insert(testAnalyseKnowledge);
                    }else{
//                        存在，更新
                        testAnalyseKnowledge1.setContainknowledgenum(testAnalyseKnowledge1.getContainknowledgenum() + 1);
                        //                        如果用户答错了，不变，如果答对了，加1
                        if(question.getIscorrect() != 0) {
                            testAnalyseKnowledge1.setCorrectknowledgenum(testAnalyseKnowledge1.getCorrectknowledgenum() + 1);
                        }
                        testAnalyseKnowledgeMapper.update(testAnalyseKnowledge1,new LambdaQueryWrapper<TestAnalyseKnowledge>()
                                .eq(TestAnalyseKnowledge::getTestanalyseid, testAnalyseKnowledge1.getTestanalyseid())
                                .and(wrapper -> wrapper.eq(TestAnalyseKnowledge::getKnowledgeid, testAnalyseKnowledge1.getKnowledgeid())));
                    }
                }
            }

//            处理完testanalyse_knowledge后，更新testanalyse中的knowledge_proposal与推荐课程
//            根据testanalyseid查询testanalyse_knowledge表中所有的表项目
            List<TestAnalyseKnowledge> testAnalyseKnowledges = getTestAnalyseKnowledgeByID(testAnalyse.getTestanalyseid());
            String proposal = getKnowledgeProposalByAnalyse(testAnalyseKnowledges);
            testAnalyse.setKnowledgemasterproposal(proposal);
            testAnalyse.setRecommendcourse("2,3,5");
            testAnalyseMapper.update(testAnalyse,new LambdaQueryWrapper<TestAnalyse>()
                    .eq(TestAnalyse::getTestanalyseid,testAnalyse.getTestanalyseid()));

        }

        return Result.success("成功");
    }

    //    根据问题id，在question_knowledge中查找所有的知识点，返回列表
    private List<QuestionKnowledge> getKnowledgeList(Integer questionid){
        // 创建查询条件
        QueryWrapper<QuestionKnowledge> wrapper = new QueryWrapper<>();
        wrapper.in("testquestionid", questionid);

        // 执行查询并返回结果
        return questionKnowledgeMapper.selectList(wrapper);
    }

//    计算question中iscorrect=1的数量
    private Integer getCorrectQuantity(List<TestRecord_Question> testRecord_questions){
        Integer correctQuantity = 0;
        for (TestRecord_Question question : testRecord_questions){
            if(question.getIscorrect() == 1){
                correctQuantity++;
            }
        }
        return correctQuantity;
    }

//    正确率建议
    private String getAccuracyProposal(Float accuracy){
        if(accuracy >= 0.8){
            return "你的正确率很高，继续保持！";
        }else if(accuracy >= 0.6){
            return "你的正确率一般，继续努力！";
        }else{
            return "你的正确率很低，需要加强练习！";
        }
    }

//    根据testanalyseid查询testanalyse_knowledge表中所有的表项目
    private List<TestAnalyseKnowledge> getTestAnalyseKnowledgeByID(Integer analyseid){
        List<TestAnalyseKnowledge> testAnalyseKnowledges = testAnalyseKnowledgeMapper.selectList(
                new LambdaQueryWrapper<TestAnalyseKnowledge>().eq(TestAnalyseKnowledge::getTestanalyseid,analyseid)
        );
        if(! testAnalyseKnowledges.isEmpty()){
            return testAnalyseKnowledges;
        }else{
            return null;
        }
    }

//    根据testanalyse_knowledge列表生成建议
    private String getKnowledgeProposalByAnalyse(List<TestAnalyseKnowledge> testAnalyseKnowledges){
        Integer max_index = 0;
        Float max_accuracy = 0f;
        Integer min_index = 0;
        Float min_accuracy = 1f;
        List<Float> list = new ArrayList<>();
        for( int i = 0;i<testAnalyseKnowledges.size();i++){
            TestAnalyseKnowledge testAnalyseKnowledge = testAnalyseKnowledges.get(i);
            Float accuracy = (float) testAnalyseKnowledge.getCorrectknowledgenum() / testAnalyseKnowledge.getContainknowledgenum();
            if (accuracy < min_accuracy){
                min_index = i;
                min_accuracy = accuracy;
            }
            if (accuracy > max_accuracy){
                max_index = i;
                max_accuracy = accuracy;
            }
        }
        String maxKnowledgeName = getKnowledgeNameByID(testAnalyseKnowledges.get(max_index).getKnowledgeid());
        String minKnowledgeName = getKnowledgeNameByID(testAnalyseKnowledges.get(min_index).getKnowledgeid());

        return "你的"+maxKnowledgeName+"掌握地很好，不过你的"+minKnowledgeName+"的掌握情况还需加强！";

    }

//    通过知识点id查询知识点的名称
    private String getKnowledgeNameByID(Integer id){
        Knowledge knowledge = knowledgeMapper.selectOne(
                new LambdaQueryWrapper<Knowledge>().eq(
                        Knowledge::getKnowledgeid,id
                )
        );
        if (knowledge != null){
            return knowledge.getKnowledgename();
        }else{
            return "error！";
        }
    }

}
