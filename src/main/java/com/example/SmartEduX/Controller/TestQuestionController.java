package com.example.SmartEduX.Controller;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.example.SmartEduX.Mapper.*;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.QuestionTestPaper;
import com.example.SmartEduX.entity.TestQuestion;
import com.example.SmartEduX.entity.TestRecord;
import com.example.SmartEduX.entity.TestRecord_Question;
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

    @Autowired
    @Resource
    private TestRecord_QuestionMapper testRecord_questionMapper;

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

        public String getUseranswer() {
            return useranswer;
        }

        public void setUseranswer(String useranswer) {
            this.useranswer = useranswer;
        }

        public Integer getIscorrect() {
            return iscorrect;
        }

        public void setIscorrect(Integer iscorrect) {
            this.iscorrect = iscorrect;
        }

        private String useranswer;
        private Integer iscorrect;

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

    @ApiOperation("获取用户某个记录的所有试题，包含用户答案，是否正确等")
    @CrossOrigin
    @GetMapping("/getrecordquestionsbyid")
    public Result<?> getRecordQuestionsByID(@RequestParam Integer rid) {
//        System.out.println(rid);
        QueryWrapper<TestRecord_Question> wrapper = new QueryWrapper<>();
        wrapper.select()
                .eq("TestRecordID", rid);
        List<TestRecord_Question> testRecord_questions = testRecord_questionMapper.selectList(wrapper);

        // 获取试题 id
        List<Integer> questionIds = testRecord_questions.stream()
                .map(TestRecord_Question::getTestquestionid)
                .collect(Collectors.toList());

        // 查询试题详情
        QueryWrapper<TestQuestion> questionWrapper = new QueryWrapper<>();
        questionWrapper.in("TestQuestionID", questionIds);
        List<TestQuestion> questions = testQuestionMapper.selectList(questionWrapper);

        List<QuestionDTO> questionDTOS = questions.stream()
                .map(question -> {
                    QuestionDTO questionDTO = new QuestionDTO();
                    BeanUtils.copyProperties(question, questionDTO);
                    questionDTO.setSortnum(testRecord_questions.stream()
                            .filter(qtp -> qtp.getTestquestionid().equals(question.getTestquestionid()))
                            .findFirst()
                            .map(TestRecord_Question::getSortnum)
                            .orElse(null));
                    questionDTO.setScore(testRecord_questions.stream()
                            .filter(qtp -> qtp.getTestquestionid().equals(question.getTestquestionid()))
                            .findFirst()
                            .map(TestRecord_Question::getScore)
                            .orElse(null));
                    questionDTO.setIscorrect(testRecord_questions.stream()
                            .filter(qtp -> qtp.getTestquestionid().equals(question.getTestquestionid()))
                            .findFirst()
                            .map(TestRecord_Question::getIscorrect)
                            .orElse(null));
                    questionDTO.setUseranswer(testRecord_questions.stream()
                            .filter(qtp -> qtp.getTestquestionid().equals(question.getTestquestionid()))
                            .findFirst()
                            .map(TestRecord_Question::getUseranswer)
                            .orElse(null));
                    questionDTO.setTestquestionid(testRecord_questions.stream()
                            .filter(qtp -> qtp.getTestquestionid().equals(question.getTestquestionid()))
                            .findFirst()
                            .map(TestRecord_Question::getTestquestionid)
                            .orElse(null));
                    return questionDTO;
                })
                .collect(Collectors.toList());

        return Result.success(questionDTOS,"成功");
    }

    @ApiOperation("找出用户做错的所有错题,可能有重复")
    @CrossOrigin
    @GetMapping("/getwrongbook")
    public Result<?> getWrongBook(@RequestParam Integer userid){
        // 查询用户答错的题目
        QueryWrapper<TestRecord_Question> wrapper = new QueryWrapper<>();
        wrapper.select()
                .eq("UserID", userid)
                .eq("IsCorrect", 0);
        List<TestRecord_Question> wrongQuestions = testRecord_questionMapper.selectList(wrapper);

        // 获取答错题目的ID列表
        List<Integer> questionIds = wrongQuestions.stream()
                .map(TestRecord_Question::getTestquestionid)
                .collect(Collectors.toList());

        // 查询答错题目的详细信息
        QueryWrapper<TestQuestion> questionWrapper = new QueryWrapper<>();
        questionWrapper.in("TestQuestionID", questionIds);
        List<TestQuestion> questions = testQuestionMapper.selectList(questionWrapper);

        // 将答错题目的详细信息转换为QuestionDTO对象
        List<QuestionDTO> questionDTOS = questions.stream()
                .map(question -> {
                    QuestionDTO questionDTO = new QuestionDTO();
                    BeanUtils.copyProperties(question, questionDTO);
                    questionDTO.setIscorrect(0);
                    questionDTO.setUseranswer(wrongQuestions.stream()
                            .filter(qtp -> qtp.getTestquestionid().equals(question.getTestquestionid()))
                            .findFirst()
                            .map(TestRecord_Question::getUseranswer)
                            .orElse(null));
                    return questionDTO;
                })
                .collect(Collectors.toList());

        // 返回包含所有答错题目的QuestionDTO列表
        return Result.success(questionDTOS,"成功");
    }

    @ApiOperation("根据题型找出用户做错的所有错题,可能有重复")
    @CrossOrigin
    @GetMapping("/getwrongbookbytype")
    public Result<?> getWrongBookByType(@RequestParam Integer userid, @RequestParam String questiontype){
        // 查询用户答错的题目
        QueryWrapper<TestRecord_Question> wrapper = new QueryWrapper<>();
        wrapper.select()
                .eq("UserID", userid)
                .eq("IsCorrect", 0);
        if (!questiontype.equals("0")) {
            wrapper.eq("QuestionType", questiontype);
        }
        List<TestRecord_Question> wrongQuestions = testRecord_questionMapper.selectList(wrapper);

        // 获取答错题目的ID列表
        List<Integer> questionIds = wrongQuestions.stream()
                .map(TestRecord_Question::getTestquestionid)
                .collect(Collectors.toList());

        // 查询答错题目的详细信息
        QueryWrapper<TestQuestion> questionWrapper = new QueryWrapper<>();
        questionWrapper.in("TestQuestionID", questionIds);
        List<TestQuestion> questions = testQuestionMapper.selectList(questionWrapper);

        // 将答错题目的详细信息转换为QuestionDTO对象
        List<QuestionDTO> questionDTOS = questions.stream()
                .map(question -> {
                    QuestionDTO questionDTO = new QuestionDTO();
                    BeanUtils.copyProperties(question, questionDTO);
                    questionDTO.setIscorrect(0);
                    questionDTO.setUseranswer(wrongQuestions.stream()
                            .filter(qtp -> qtp.getTestquestionid().equals(question.getTestquestionid()))
                            .findFirst()
                            .map(TestRecord_Question::getUseranswer)
                            .orElse(null));
                    return questionDTO;
                })
                .collect(Collectors.toList());

        // 返回包含所有答错题目的QuestionDTO列表
        return Result.success(questionDTOS,"成功");
    }

    @ApiOperation("查找用户单选题，多选题，判断题，填空题的数量")
    @CrossOrigin
    @GetMapping("/getwrongbookcount")
    private Result<?> getWrongBookCount(@RequestParam Integer userid){
        // 查询用户答错的题目
        QueryWrapper<TestRecord_Question> wrapper = new QueryWrapper<>();
        wrapper.select()
                .eq("UserID", userid)
                .eq("IsCorrect", 0);
        List<TestRecord_Question> wrongQuestions = testRecord_questionMapper.selectList(wrapper);

        // 根据题目类型进行分类统计
        Map<String, Long> typeCount = wrongQuestions.stream()
                .collect(Collectors.groupingBy(TestRecord_Question::getQuestiontype, Collectors.counting()));

        // 返回统计结果
        return Result.success(typeCount,"成功");
    }

}
