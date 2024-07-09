package com.example.SmartEduX.Controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.SmartEduX.Mapper.*;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.models.auth.In;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.*;
import java.util.stream.Collectors;

@Api(tags = "API接口")
@RestController
@RequestMapping("testpaper")
@CrossOrigin(origins = "*", maxAge = 3600)
public class TestPaperController {

    @Autowired
    @Resource
    private TestPaperMapper testPaperMapper;

    @Autowired
    @Resource
    private BigCourse_UserMapper bigCourse_userMapper;

    @Autowired
    @Resource
    private BigCourseMapper bigCourseMapper;

    @Autowired
    @Resource
    private TestRecordMapper testRecordMapper;

    @Autowired
    @Resource
    private TestAnalyseKnowledgeMapper testAnalyseKnowledgeMapper;

    @Autowired
    @Resource
    private TestAnalyseMapper testAnalyseMapper;

    @Autowired
    @Resource
    private KnowledgeMapper knowledgeMapper;

    @Autowired
    @Resource
    private QuestionKnowledgeMapper questionKnowledgeMapper;

    @Autowired
    @Resource
    private TestQuestionMapper testQuestionMapper;

    @Autowired
    @Resource
    private QuestionTestPaperMapper questionTestPaperMapper;

    @ApiOperation("获取所有的考试列表，考试列表不包含有“每日练习”作为标题的考试项")
    @CrossOrigin
    @GetMapping("/alltestlist")
    public Result<?> getAllPaper() {
        // 查询数据库中所有的考试
        List<TestPaper> allTestPapers = testPaperMapper.selectList(null);
        if (allTestPapers.isEmpty()) {
            // 如果未找到任何问题数据，返回错误信息
            return Result.error("-1", "未找到任何问题数据");
        }

        // 过滤掉标题包含“每日练习”的考试项
        List<TestPaper> filteredTestPapers = allTestPapers.stream()
                .filter(paper -> !paper.getTestpapername().contains("每日练习"))
                .collect(Collectors.toList());

        // 返回过滤后的考试列表
        return Result.success(filteredTestPapers, "成功");
    }

    @ApiOperation("获取用户所有的考试列表，考试列表根据用户订阅的课程筛选")
    @CrossOrigin
    @GetMapping("/usertestlist")
    public Result<?> getUserPaper(@RequestParam Integer userid){
//        根据userid查找所有用户订阅的课程列表
        List<Integer> userSubCourses = getUserSubCourse(userid);
        if( userSubCourses.isEmpty()){
            return Result.error("-1","未订阅课程");
        }
//        根据courseid list查找用户的试卷ID列表
        List<Integer> userPaperIDList = getUserPaperIDListByCourseIDList(userSubCourses);

//        根据paperid list 查找试卷信息
        List<TestPaper> testPapers = testPaperMapper.selectList(
                new LambdaQueryWrapper<TestPaper>().in(
                        TestPaper::getTestpaperid,userPaperIDList
                )
        );

        return Result.success(testPapers,"成功");
    }

    private List<Integer> getUserPaperIDListByCourseIDList(List<Integer> courseids){
        List<BigCourse> bigCourses = bigCourseMapper.selectList(
                new LambdaQueryWrapper<BigCourse>().in(
                        BigCourse::getCourseid,courseids
                )
        );
        // Use a Set to automatically remove duplicates
        Set<Integer> uniqueIds = new HashSet<>();
        for (BigCourse bigCourse : bigCourses) {
            uniqueIds.add(bigCourse.getTestpaperid());
        }

        // Convert back to a List if needed
        return new ArrayList<>(uniqueIds);
    }

    private List<Integer> getUserSubCourse(Integer userid){
        List<BigCourse_User> bigCourse_users = bigCourse_userMapper.selectList(
                new LambdaQueryWrapper<BigCourse_User>().eq(
                        BigCourse_User::getUserid,userid
                )
        );
        List<Integer> list = new ArrayList<>();
        for ( BigCourse_User bigCourse_user:bigCourse_users){
            list.add(bigCourse_user.getCourseid());
        }
        return list;
    }

    @ApiOperation("根据考试id获取考试详细内容")
    @CrossOrigin
    @GetMapping("/paperinfo")
    public Result<?> getPaperInfo(@RequestParam Integer testPaperID) {
//        System.out.println(testPaperID);
        TestPaper testPaper = null;
        testPaper = testPaperMapper.selectOne(new LambdaQueryWrapper<TestPaper>()
                .eq(TestPaper::getTestpaperid, testPaperID));
        if(testPaper==null){
            return Result.error("-1", "未找到任何数据");
        }

        return Result.success(testPaper,"成功");
    }

    @ApiOperation("查找用户的智能生成的试卷")
    @CrossOrigin
    @GetMapping("/practice")
    public Result<?> getPracticePaper(Integer userid) {
//        QueryWrapper<TestPaper> queryWrapper = new QueryWrapper<>();
//        queryWrapper.like("testpapername", "每日练习%");
//        List<TestPaper> testPaper = testPaperMapper.selectList(queryWrapper);
//        if (testPaper.isEmpty()) {
//            return Result.error("-1", "未找到任何数据");
//        }
        List<TestPaper> testPaper = testPaperMapper.selectList(
                new LambdaQueryWrapper<TestPaper>().eq(TestPaper::getForuserid,userid)
        );
        if (testPaper.isEmpty()) {
            return Result.error("-1", "未找到任何数据");
        }
        return Result.success(testPaper,"成功");
    }
    @ApiOperation("获取每套考试的最高分")
    @CrossOrigin
    @GetMapping("/maxtestlist")
    public Result<?> getMaxTestList(@RequestParam Integer userid) {
        // 1. 根据 userid 查询所有记录
        QueryWrapper<TestRecord> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("userid", userid);
        List<TestRecord> testRecords = testRecordMapper.selectList(queryWrapper);

        // 2. 提取 testpaperid 并找到每个 testpaperid 对应的最高分
        Map<Integer, Optional<TestRecord>> maxScoresOptional = testRecords.stream()
                .collect(Collectors.groupingBy(TestRecord::getTestpaperid,
                        Collectors.maxBy(Comparator.comparing(TestRecord::getTestscore))));

        // 3. 将结果转换为需要的数据类型
        List<Map<String, Object>> result = maxScoresOptional.entrySet().stream()
                .map(entry -> {
                    Map<String, Object> map = new HashMap<>();
                    map.put("testpaperid", entry.getKey());
                    map.put("testscore", entry.getValue().map(TestRecord::getTestscore).orElse(0f));
                    return map;
                })
                .collect(Collectors.toList());

        // 4. 返回结果
        return Result.success(result,"成功");
    }

    @ApiOperation("根据用户的知识点掌握情况，生成一套试卷")
    @CrossOrigin
    @GetMapping("/generate")
    public Result<?> generateTestPaper(@RequestParam Integer userid,@RequestParam Integer question_num) {
        // 1. 根据 userid 查询用户的知识点掌握情况
        List<Integer> analyseIDList = getAnalyseIDByUserID(userid);
        List<TestAnalyseController.KnowledgeDTO> list = new ArrayList<>();

        for (Integer analyseID : analyseIDList) {
            List<TestAnalyseKnowledge> testAnalyseKnowledgeList = testAnalyseKnowledgeMapper.selectList(
                    new LambdaQueryWrapper<TestAnalyseKnowledge>().eq(TestAnalyseKnowledge::getTestanalyseid, analyseID)
            );
            for (TestAnalyseKnowledge testAnalyseKnowledge : testAnalyseKnowledgeList) {
                TestAnalyseController.KnowledgeDTO knowledgeDTO = new TestAnalyseController.KnowledgeDTO();
                knowledgeDTO.setKnowledgeid(testAnalyseKnowledge.getKnowledgeid());
                knowledgeDTO.setContainknowledgenum(testAnalyseKnowledge.getContainknowledgenum());
                knowledgeDTO.setCorrectknowledgenum(testAnalyseKnowledge.getCorrectknowledgenum());
                knowledgeDTO.setKnowledgecontent(getKnowledgeContent(testAnalyseKnowledge.getKnowledgeid()).get(0));
                list.add(knowledgeDTO);
            }
        }

        // 合并相同知识点ID的数据，并计算正确率，保留两位小数
        List<TestAnalyseController.KnowledgeBasicInfo> knowledgeBasicInfoList = new ArrayList<>();
        for (TestAnalyseController.KnowledgeDTO knowledgeDTO : list) {
            boolean flag = false;
            for (TestAnalyseController.KnowledgeBasicInfo knowledgeBasicInfo : knowledgeBasicInfoList) {
                if (knowledgeBasicInfo.getKnowledgeid().equals(knowledgeDTO.getKnowledgeid())) {
                    knowledgeBasicInfo.setContainknowledgenum(knowledgeBasicInfo.getContainknowledgenum() + knowledgeDTO.getContainknowledgenum());
                    knowledgeBasicInfo.setCorrectknowledgenum(knowledgeBasicInfo.getCorrectknowledgenum() + knowledgeDTO.getCorrectknowledgenum());
                    knowledgeBasicInfo.setCorrectrate(Math.round(((double) knowledgeBasicInfo.getCorrectknowledgenum() / knowledgeBasicInfo.getContainknowledgenum()) * 100.0) / 100.0);
                    flag = true;
                    break;
                }
            }
            if (!flag) {
                TestAnalyseController.KnowledgeBasicInfo knowledgeBasicInfo = new TestAnalyseController.KnowledgeBasicInfo();
                knowledgeBasicInfo.setKnowledgeid(knowledgeDTO.getKnowledgeid());
                knowledgeBasicInfo.setKnowledgecontent(knowledgeDTO.getKnowledgecontent());
                knowledgeBasicInfo.setContainknowledgenum(knowledgeDTO.getContainknowledgenum());
                knowledgeBasicInfo.setCorrectknowledgenum(knowledgeDTO.getCorrectknowledgenum());
                knowledgeBasicInfo.setCorrectrate(Math.round(((double) knowledgeDTO.getCorrectknowledgenum() / knowledgeDTO.getContainknowledgenum()) * 100.0) / 100.0);
                knowledgeBasicInfoList.add(knowledgeBasicInfo);
            }
        }
//        将知识点按照正确率升序排序
        knowledgeBasicInfoList.sort(Comparator.comparing(TestAnalyseController.KnowledgeBasicInfo::getCorrectrate));
        // 2. 根据知识点掌握情况生成一套试卷
//        根据知识点id查找所有相关的题目
        List<Integer> knowledgeids = new ArrayList<>();
        for(TestAnalyseController.KnowledgeBasicInfo item: knowledgeBasicInfoList){
            knowledgeids.add(item.getKnowledgeid());
        }
        List<TestQuestion> testQuestionList = getQuestionByKnowledgeID(knowledgeids);

//        从testQuestionList中选择前question_num道题
        // 打乱列表
        Collections.shuffle(testQuestionList);
        List<TestQuestion> subList = testQuestionList.size() <= question_num ? testQuestionList : testQuestionList.subList(0, question_num);
        generatePaper(subList,userid);

        // 3. 返回生成的试卷
        return Result.success("成功");
    }

    //    将现有的listquestion组合成一套试
    private void generatePaper(List<TestQuestion> list,Integer userid){
        TestPaper testPaper = new TestPaper();
        Integer question_num = list.size();
        testPaper.setForuserid(userid);
        testPaper.setFullscore(question_num*10);
        testPaper.setDuration(60);
        testPaper.setQuestionnumber(question_num);
        testPaper.setPassscore(question_num*6);
        testPaper.setTestpapername(getTestpaperName());
        testPaperMapper.insert(testPaper);

        Integer paperid = testPaper.getTestpaperid();

        for (Integer i =0;i<question_num;i++){
            TestQuestion temp_question_item = list.get(i);
            QuestionTestPaper questionTestPaper = new QuestionTestPaper();
            questionTestPaper.setScore(10);
            questionTestPaper.setSortnum(i+1);
            questionTestPaper.setTestpaperid(paperid);
            questionTestPaper.setTestquestionid(temp_question_item.getTestquestionid());
            questionTestPaperMapper.insert(questionTestPaper);
        }
    }


    private List<Integer> getAnalyseIDByUserID(Integer userid){
        List<Integer> list = new ArrayList<>();
        List<TestAnalyse> testAnalyseList = testAnalyseMapper.selectList(
                new LambdaQueryWrapper<TestAnalyse>().eq(TestAnalyse::getUserid, userid)
        );
        for(TestAnalyse testAnalyse : testAnalyseList){
            list.add(testAnalyse.getTestanalyseid());
        }
        return list;
    }

    private List<String> getKnowledgeContent(Integer knowledgeID){
        List<String> list = new ArrayList<>();
        Knowledge knowledge = knowledgeMapper.selectById(knowledgeID);
        list.add(knowledge.getKnowledgename());
        list.add(knowledge.getKnowledgedomain());
        return list;
    }

    private String getTestpaperName(){
//        获取今天的日期
        Date date = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int year = calendar.get(Calendar.YEAR);
        int month = calendar.get(Calendar.MONTH)+1;
        int day = calendar.get(Calendar.DATE);
        return "每日练习"+year+"年"+month+"月"+day+"日";
    }

//    根据知识点id查找所有相关题目
    private List<TestQuestion> getQuestionByKnowledgeID(List<Integer> kids){
        List<QuestionKnowledge> list = new ArrayList<>();
//        查询所有的QuestionKnowledge
        for (Integer kid : kids){
            List<QuestionKnowledge> questionKnowledgeList = questionKnowledgeMapper.selectList(
                    new LambdaQueryWrapper<QuestionKnowledge>().in(
                            QuestionKnowledge::getKnowledgeid,kid
                    )
            );
            for (QuestionKnowledge item:questionKnowledgeList){
                list.add(item);
            }
        }
//        去除重复questionid
        Set<Integer> questionids = new HashSet<>();
        for (QuestionKnowledge questionKnowledge : list) {
            questionids.add(questionKnowledge.getTestquestionid());
        }

        List<TestQuestion> testQuestionList = testQuestionMapper.selectBatchIds(questionids);

//        return questionids;
        return testQuestionList;

    }
}
