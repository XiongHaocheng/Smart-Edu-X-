package com.example.SmartEduX.Controller;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.example.SmartEduX.Mapper.BigCourseMapper;
import com.example.SmartEduX.Mapper.QuestionTestPaperMapper;
import com.example.SmartEduX.Mapper.StudyPathModuleMapper;
import com.example.SmartEduX.Mapper.TestQuestionMapper;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.QuestionTestPaper;
import com.example.SmartEduX.entity.TestQuestion;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Api(tags = "API接口")
@RestController
@RequestMapping("testquestion")
@CrossOrigin(origins = "*", maxAge = 3600)
public class TestQuestionController {

    @Autowired
    @Resource
    private TestQuestionMapper testQuestionMapper;

    @Autowired
    @Resource
    private QuestionTestPaperMapper questionTestPaperMapper;

    // 创建 DTO 类
    public class QuestionDTO {
        private Integer testquestionid;
        private String questiontext;
        private String questionimage;
        private String questiontype;
        private String singlechoice;
        private String multiplechoice;
        private String fillblankquantity;
        private String singlechoiceanswer;
        private String multiplechoiceanswer;
        private String judgeanswer;
        private String fillblankanswer;
        private String analysis;
        private Integer testpaperid;
        private Integer score;
        private Integer sortnum;

        public Integer getTestquestionid() {
            return testquestionid;
        }

        public void setTestquestionid(Integer testquestionid) {
            this.testquestionid = testquestionid;
        }

        public String getQuestiontext() {
            return questiontext;
        }

        public void setQuestiontext(String questiontext) {
            this.questiontext = questiontext;
        }

        public String getQuestionimage() {
            return questionimage;
        }

        public void setQuestionimage(String questionimage) {
            this.questionimage = questionimage;
        }

        public String getQuestiontype() {
            return questiontype;
        }

        public void setQuestiontype(String questiontype) {
            this.questiontype = questiontype;
        }

        public String getSinglechoice() {
            return singlechoice;
        }

        public void setSinglechoice(String singlechoice) {
            this.singlechoice = singlechoice;
        }

        public String getMultiplechoice() {
            return multiplechoice;
        }

        public void setMultiplechoice(String multiplechoice) {
            this.multiplechoice = multiplechoice;
        }

        public String getFillblankquantity() {
            return fillblankquantity;
        }

        public void setFillblankquantity(String fillblankquantity) {
            this.fillblankquantity = fillblankquantity;
        }

        public String getSinglechoiceanswer() {
            return singlechoiceanswer;
        }

        public void setSinglechoiceanswer(String singlechoiceanswer) {
            this.singlechoiceanswer = singlechoiceanswer;
        }

        public String getMultiplechoiceanswer() {
            return multiplechoiceanswer;
        }

        public void setMultiplechoiceanswer(String multiplechoiceanswer) {
            this.multiplechoiceanswer = multiplechoiceanswer;
        }

        public String getJudgeanswer() {
            return judgeanswer;
        }

        public void setJudgeanswer(String judgeanswer) {
            this.judgeanswer = judgeanswer;
        }

        public String getFillblankanswer() {
            return fillblankanswer;
        }

        public void setFillblankanswer(String fillblankanswer) {
            this.fillblankanswer = fillblankanswer;
        }

        public String getAnalysis() {
            return analysis;
        }

        public void setAnalysis(String analysis) {
            this.analysis = analysis;
        }

        public Integer getTestpaperid() {
            return testpaperid;
        }

        public void setTestpaperid(Integer testpaperid) {
            this.testpaperid = testpaperid;
        }

        public Integer getScore() {
            return score;
        }

        public void setScore(Integer score) {
            this.score = score;
        }

        public Integer getSortnum() {
            return sortnum;
        }

        public void setSortnum(Integer sortnum) {
            this.sortnum = sortnum;
        }
        // 省略 getter 和 setter 方法
    }


    @ApiOperation("获取所有问题")
    @CrossOrigin
    @GetMapping("/allquestions")
    public Result<?> getAllQuestions() {
        // 查询数据库中所有的问题数据
        List<TestQuestion> testQuestions = testQuestionMapper.selectList(null);
        if (testQuestions.isEmpty()) {
            // 如果未找到任何问题数据，返回错误信息
            return Result.error("-1", "未找到任何问题数据");
        }
        // 返回查询到的问题数据
        return Result.success(testQuestions,"成功");
    }

    @ApiOperation("获取所有问题")
    @CrossOrigin
    @GetMapping("/questions")
    public Result<?> getQuestionsByID(@RequestParam Integer paperid) {
        // 查询数据库中paperid的所有试题id
        // 查询数据库中 paperid 的所有试题 id 和 sortNum
        QueryWrapper<QuestionTestPaper> wrapper = new QueryWrapper<>();
        wrapper.select()
                .eq("TestPaperID", paperid);
        List<QuestionTestPaper> questionTestPapers = questionTestPaperMapper.selectList(wrapper);

        // 获取试题 id
        List<Integer> questionIds = questionTestPapers.stream()
                .map(QuestionTestPaper::getTestquestionid)
                .collect(Collectors.toList());

        // 查询试题详情
        QueryWrapper<TestQuestion> questionWrapper = new QueryWrapper<>();
        questionWrapper.in("TestQuestionID", questionIds);
        List<TestQuestion> questions = testQuestionMapper.selectList(questionWrapper);

        // 将 sortNum 添加到 Question 对象中
//        Map<Integer, Integer> questionIdToSortNumMap = questionTestPapers.stream()
//                .collect(Collectors.toMap(QuestionTestPaper::getTestquestionid, QuestionTestPaper::getSortnum));

        List<QuestionDTO> questionDTOS = questions.stream()
                .map(question -> {
                    QuestionDTO questionDTO = new QuestionDTO();
                    BeanUtils.copyProperties(question, questionDTO);
                    questionDTO.setSortnum(questionTestPapers.stream()
                            .filter(qtp -> qtp.getTestquestionid().equals(question.getTestquestionid()))
                            .findFirst()
                            .map(QuestionTestPaper::getSortnum)
                            .orElse(null));
                    questionDTO.setScore(questionTestPapers.stream()
                            .filter(qtp -> qtp.getTestquestionid().equals(question.getTestquestionid()))
                            .findFirst()
                            .map(QuestionTestPaper::getScore)
                            .orElse(null));
                    questionDTO.setTestpaperid(questionTestPapers.stream()
                            .filter(qtp -> qtp.getTestquestionid().equals(question.getTestquestionid()))
                            .findFirst()
                            .map(QuestionTestPaper::getTestpaperid)
                            .orElse(null));
                    return questionDTO;
                })
                .collect(Collectors.toList());

//        for (TestQuestion question : questions) {
//            question.setSortNum(questionIdToSortNumMap.get(question.getTestquestionid()));
//        }

        return Result.success(questionDTOS,"成功");

    }

}
