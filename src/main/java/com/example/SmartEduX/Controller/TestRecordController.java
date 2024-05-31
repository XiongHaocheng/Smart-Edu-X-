package com.example.SmartEduX.Controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.example.SmartEduX.Mapper.TestRecordMapper;
import com.example.SmartEduX.Mapper.TestRecord_QuestionMapper;
import com.example.SmartEduX.Mapper.UserMapper;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.TestRecord;
import com.example.SmartEduX.entity.TestRecord_Question;
import com.example.SmartEduX.entity.User;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.lang.reflect.Type;
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
            return Result.success(testRecords,"获取考试记录成功");
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

//        System.out.println(testRecord_questions);

        return Result.success("成功");
    }
}
