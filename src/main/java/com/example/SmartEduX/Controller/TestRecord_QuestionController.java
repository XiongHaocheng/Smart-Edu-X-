package com.example.SmartEduX.Controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.example.SmartEduX.Mapper.TestRecord_QuestionMapper;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.TestRecord_Question;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@Api(tags = "API接口")
@RestController
@RequestMapping("testquestion")
@CrossOrigin(origins = "*", maxAge = 3600)
public class TestRecord_QuestionController {
    @Autowired
    @Resource
    private TestRecord_QuestionMapper testRecord_questionMapper;

    @ApiOperation("提交用户答案")
    @CrossOrigin
    @PostMapping ("/submitanswer")
    public Result<?> submitAnswer(@RequestBody String data){
        System.out.println(data);
        Gson gson = new Gson();
        JsonObject jsonObject = gson.fromJson(data, JsonObject.class);

        // 从JsonObject中获取各个值
        Integer recordid = jsonObject.get("rid").getAsInt();
        Integer questionid = jsonObject.get("questionid").getAsInt();
        Integer score = jsonObject.get("score").getAsInt();
        Integer sortnum = jsonObject.get("sortnum").getAsInt();
        String useranswer = jsonObject.get("answer").getAsString();
        System.out.println("答案"+useranswer);

//        从数据库中查看是否有这一试题的记录
        TestRecord_Question testRecord_questionfromDB =
                testRecord_questionMapper.selectOne(new LambdaQueryWrapper<TestRecord_Question>()
                        .eq(TestRecord_Question::getTestrecordid, recordid)
                        .and(wrapper -> wrapper.eq(TestRecord_Question::getTestquestionid, questionid)));

        if (testRecord_questionfromDB == null){
            TestRecord_Question testRecord_question = new TestRecord_Question();
            testRecord_question.setTestrecordid(recordid);
            testRecord_question.setTestquestionid(questionid);
            testRecord_question.setScore(score);
            testRecord_question.setSortnum(sortnum);
            testRecord_question.setUseranswer(useranswer);

            testRecord_questionMapper.insert(testRecord_question);
            return Result.success("成功");

        }else{
            testRecord_questionfromDB.setUseranswer(useranswer);
            testRecord_questionMapper.update(testRecord_questionfromDB,new LambdaQueryWrapper<TestRecord_Question>()
                    .eq(TestRecord_Question::getTestrecordid, recordid)
                    .and(wrapper -> wrapper.eq(TestRecord_Question::getTestquestionid, questionid)));
            return Result.success("成功");
        }



    }

}
