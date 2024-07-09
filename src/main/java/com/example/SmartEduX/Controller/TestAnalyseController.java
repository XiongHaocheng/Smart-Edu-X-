package com.example.SmartEduX.Controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
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
@RequestMapping("testanalyse")
@CrossOrigin(origins = "*", maxAge = 3600)
public class TestAnalyseController {
    @Autowired
    @Resource
    private TestAnalyseMapper testAnalyseMapper;

    @Autowired
    @Resource
    private TestAnalyseKnowledgeMapper testAnalyseKnowledgeMapper;

    @Autowired
    @Resource
    private KnowledgeMapper knowledgeMapper;

    @Autowired
    @Resource
    private BigCourse_UserMapper bigCourse_userMapper;

    @Autowired
    @Resource
    private BigCourseMapper bigCourseMapper;

    @Autowired
    @Resource
    private TestRecordMapper testRecordMapper;

    public static class KnowledgeDTO{
        private Integer knowledgeid;
        private Integer containknowledgenum;
        private Integer correctknowledgenum;
        private String knowledgecontent;
        private Integer TestAnalyseID;
        private String KnowledgeDomain;

        public Integer getKnowledgeid() {
            return knowledgeid;
        }

        public void setKnowledgeid(Integer knowledgeid) {
            this.knowledgeid = knowledgeid;
        }

        public Integer getContainknowledgenum() {
            return containknowledgenum;
        }

        public void setContainknowledgenum(Integer containknowledgenum) {
            this.containknowledgenum = containknowledgenum;
        }

        public Integer getCorrectknowledgenum() {
            return correctknowledgenum;
        }

        public void setCorrectknowledgenum(Integer correctknowledgenum) {
            this.correctknowledgenum = correctknowledgenum;
        }

        public String getKnowledgecontent() {
            return knowledgecontent;
        }

        public void setKnowledgecontent(String knowledgecontent) {
            this.knowledgecontent = knowledgecontent;
        }

        public Integer getTestAnalyseID() {
            return TestAnalyseID;
        }

        public void setTestAnalyseID(Integer testAnalyseID) {
            TestAnalyseID = testAnalyseID;
        }

        public String getKnowledgeDomain() {
            return KnowledgeDomain;
        }

        public void setKnowledgeDomain(String knowledgeDomain) {
            KnowledgeDomain = knowledgeDomain;
        }
    }

    public static class KnowledgeBasicInfo{
        private Integer knowledgeid;
        private String knowledgecontent;
        private String knowledgeDomain;
        private Integer containknowledgenum;
        private Integer correctknowledgenum;
        private Double correctrate;

        public Double getCorrectrate() {
            return correctrate;
        }

        public void setCorrectrate(Double correctrate) {
            this.correctrate = correctrate;
        }

        public Integer getContainknowledgenum() {
            return containknowledgenum;
        }

        public void setContainknowledgenum(Integer containknowledgenum) {
            this.containknowledgenum = containknowledgenum;
        }

        public Integer getCorrectknowledgenum() {
            return correctknowledgenum;
        }

        public void setCorrectknowledgenum(Integer correctknowledgenum) {
            this.correctknowledgenum = correctknowledgenum;
        }

        public Integer getKnowledgeid() {
            return knowledgeid;
        }

        public void setKnowledgeid(Integer knowledgeid) {
            this.knowledgeid = knowledgeid;
        }

        public String getKnowledgecontent() {
            return knowledgecontent;
        }

        public void setKnowledgecontent(String knowledgecontent) {
            this.knowledgecontent = knowledgecontent;
        }

        public String getKnowledgeDomain() {
            return knowledgeDomain;
        }

        public void setKnowledgeDomain(String knowledgeDomain) {
            this.knowledgeDomain = knowledgeDomain;
        }
    }

    public class TableDTO{
        private Integer couserID;
        private String courseName;
        private Float avgTime;
        private Float avgScore;
        private Float myTime;
        private Float myScore;

        public Integer getCouserID() {
            return couserID;
        }

        public void setCouserID(Integer couserID) {
            this.couserID = couserID;
        }

        public String getCourseName() {
            return courseName;
        }

        public void setCourseName(String courseName) {
            this.courseName = courseName;
        }

        public Float getAvgTime() {
            return avgTime;
        }

        public void setAvgTime(Float avgTime) {
            this.avgTime = avgTime;
        }

        public Float getAvgScore() {
            return avgScore;
        }

        public void setAvgScore(Float avgScore) {
            this.avgScore = avgScore;
        }

        public Float getMyTime() {
            return myTime;
        }

        public void setMyTime(Float myTime) {
            this.myTime = myTime;
        }

        public Float getMyScore() {
            return myScore;
        }

        public void setMyScore(Float myScore) {
            this.myScore = myScore;
        }
    }

    @ApiOperation("查找分析数据")
    @CrossOrigin
    @GetMapping("/getanalysebyid")
    public Result<?> getAnalyseByID(@RequestParam Integer recordID){
        TestAnalyse analyse = testAnalyseMapper.selectOne(
                new LambdaQueryWrapper<TestAnalyse>().eq(TestAnalyse::getTestrecordid, recordID)
        );;
        if (analyse == null){
            return Result.error("-1","未找到对应数据");
        }else{
            return Result.success(analyse,"成功");
        }
    }

    @ApiOperation("根据考试记录ID查找知识点分析数据")
    @CrossOrigin
    @GetMapping("/getknowledgedatabyid")
    public Result<?> getKnowledgeDataByID(@RequestParam Integer analyseID){
        List<KnowledgeDTO> list = new ArrayList<>();
        List<TestAnalyseKnowledge> testAnalyseKnowledgeList = testAnalyseKnowledgeMapper.selectList(
                new LambdaQueryWrapper<TestAnalyseKnowledge>().eq(TestAnalyseKnowledge::getTestanalyseid, analyseID)
        );
        for(TestAnalyseKnowledge testAnalyseKnowledge : testAnalyseKnowledgeList){
            KnowledgeDTO knowledgeDTO = new KnowledgeDTO();
            knowledgeDTO.setKnowledgeid(testAnalyseKnowledge.getKnowledgeid());
            knowledgeDTO.setContainknowledgenum(testAnalyseKnowledge.getContainknowledgenum());
            knowledgeDTO.setCorrectknowledgenum(testAnalyseKnowledge.getCorrectknowledgenum());
            knowledgeDTO.setKnowledgecontent(getKnowledgeContent(testAnalyseKnowledge.getKnowledgeid()).get(0));
            knowledgeDTO.setKnowledgeDomain(getKnowledgeContent(testAnalyseKnowledge.getKnowledgeid()).get(1));
            knowledgeDTO.setTestAnalyseID(testAnalyseKnowledge.getTestanalyseid());
            list.add(knowledgeDTO);
        }

        return Result.success(list,"成功");
    }

    @ApiOperation("智能分析雷达图数据")
    @CrossOrigin
    @GetMapping("/getradardatabyidanddomain")
    public Result<?> getRadarDataByIDAndDomain(@RequestParam Integer userid, @RequestParam String domain){
        List<Integer> analyseIDList = getAnalyseIDByUserID(userid);
        List<KnowledgeDTO> list = new ArrayList<>();
        for(Integer analyseID : analyseIDList){
            List<TestAnalyseKnowledge> testAnalyseKnowledgeList = testAnalyseKnowledgeMapper.selectList(
                    new LambdaQueryWrapper<TestAnalyseKnowledge>().eq(TestAnalyseKnowledge::getTestanalyseid, analyseID)
            );
            for(TestAnalyseKnowledge testAnalyseKnowledge : testAnalyseKnowledgeList){
                KnowledgeDTO knowledgeDTO = new KnowledgeDTO();
                knowledgeDTO.setKnowledgeid(testAnalyseKnowledge.getKnowledgeid());
                knowledgeDTO.setContainknowledgenum(testAnalyseKnowledge.getContainknowledgenum());
                knowledgeDTO.setCorrectknowledgenum(testAnalyseKnowledge.getCorrectknowledgenum());
                String domainName = getKnowledgeContent(testAnalyseKnowledge.getKnowledgeid()).get(1);
                if(domainName.equals(domain)){
                    knowledgeDTO.setKnowledgecontent(getKnowledgeContent(testAnalyseKnowledge.getKnowledgeid()).get(0));
                    knowledgeDTO.setKnowledgeDomain(getKnowledgeContent(testAnalyseKnowledge.getKnowledgeid()).get(1));
                    knowledgeDTO.setTestAnalyseID(testAnalyseKnowledge.getTestanalyseid());
                    list.add(knowledgeDTO);
                }
            }
        }

//        将list中相同知识点ID的数据合并,并计算正确率,保留两位小数
        List<KnowledgeBasicInfo> knowledgeBasicInfoList = new ArrayList<>();
        for(KnowledgeDTO knowledgeDTO : list){
            boolean flag = false;
            for(KnowledgeBasicInfo knowledgeBasicInfo : knowledgeBasicInfoList){
                if(knowledgeBasicInfo.getKnowledgeid().equals(knowledgeDTO.getKnowledgeid())){
                    knowledgeBasicInfo.setContainknowledgenum(knowledgeBasicInfo.getContainknowledgenum() + knowledgeDTO.getContainknowledgenum());
                    knowledgeBasicInfo.setCorrectknowledgenum(knowledgeBasicInfo.getCorrectknowledgenum() + knowledgeDTO.getCorrectknowledgenum());
                    knowledgeBasicInfo.setCorrectrate((double)knowledgeBasicInfo.getCorrectknowledgenum() / knowledgeBasicInfo.getContainknowledgenum());
                    flag = true;
                    break;
                }
            }
            if(!flag){
                KnowledgeBasicInfo knowledgeBasicInfo = new KnowledgeBasicInfo();
                knowledgeBasicInfo.setKnowledgeid(knowledgeDTO.getKnowledgeid());
                knowledgeBasicInfo.setKnowledgecontent(knowledgeDTO.getKnowledgecontent());
                knowledgeBasicInfo.setKnowledgeDomain(knowledgeDTO.getKnowledgeDomain());
                knowledgeBasicInfo.setContainknowledgenum(knowledgeDTO.getContainknowledgenum());
                knowledgeBasicInfo.setCorrectknowledgenum(knowledgeDTO.getCorrectknowledgenum());
                knowledgeBasicInfo.setCorrectrate((double)knowledgeDTO.getCorrectknowledgenum() / knowledgeDTO.getContainknowledgenum());
                knowledgeBasicInfoList.add(knowledgeBasicInfo);
            }
        }


        return Result.success(knowledgeBasicInfoList,"成功");
    }

//    计算有哪些知识点领域
    @ApiOperation("智能分析雷达图数据")
    @CrossOrigin
    @GetMapping("/getalldomain")
    public Result<?> getAllDomain(@RequestParam Integer userid) {
        List<Integer> analyseIDList = getAnalyseIDByUserID(userid);
        List<KnowledgeDTO> list = new ArrayList<>();
        for (Integer analyseID : analyseIDList) {
            List<TestAnalyseKnowledge> testAnalyseKnowledgeList = testAnalyseKnowledgeMapper.selectList(
                    new LambdaQueryWrapper<TestAnalyseKnowledge>().eq(TestAnalyseKnowledge::getTestanalyseid, analyseID)
            );
            for (TestAnalyseKnowledge testAnalyseKnowledge : testAnalyseKnowledgeList) {
                KnowledgeDTO knowledgeDTO = new KnowledgeDTO();
                knowledgeDTO.setKnowledgeid(testAnalyseKnowledge.getKnowledgeid());
                knowledgeDTO.setContainknowledgenum(testAnalyseKnowledge.getContainknowledgenum());
                knowledgeDTO.setCorrectknowledgenum(testAnalyseKnowledge.getCorrectknowledgenum());
                knowledgeDTO.setKnowledgecontent(getKnowledgeContent(testAnalyseKnowledge.getKnowledgeid()).get(0));
                knowledgeDTO.setKnowledgeDomain(getKnowledgeContent(testAnalyseKnowledge.getKnowledgeid()).get(1));
                knowledgeDTO.setTestAnalyseID(testAnalyseKnowledge.getTestanalyseid());
                list.add(knowledgeDTO);
            }
        }

        List<String> domainList = new ArrayList<>();
        for(KnowledgeDTO knowledgeDTO : list){
            boolean flag = false;
            for(String domain : domainList){
                if(domain.equals(knowledgeDTO.getKnowledgeDomain())){
                    flag = true;
                    break;
                }
            }
            if(!flag){
                domainList.add(knowledgeDTO.getKnowledgeDomain());
            }
        }

        return Result.success(domainList,"成功");
    }

//    找到用户的所有分析ID
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

    @ApiOperation("智能分析学习进度评价")
    @CrossOrigin
    @GetMapping("/getlearningtabledata")
    public Result<?> getLearningTableData(@RequestParam Integer userid){
//        根据id获取用户订阅的课程
        List<Integer> userSubList = getUserSubCourse(userid);
//        根据id获取用户的课程名称
        List<BigCourse> courses = getCourseByID(userSubList);
        List<Float> avgTimeList = getAvgCourseTimeByIDList(userSubList);

//        从course中提取testpaperid，testpaperid不能重复
        List<Integer> testPaperIDList = new ArrayList<>();
        for (BigCourse bigCourse:courses){
            int paperid = bigCourse.getTestpaperid();
            if(!testPaperIDList.contains(paperid)){
                testPaperIDList.add(paperid);
            }
        }
        List<Float> avgScoreList = getAvgScoreByIDList(testPaperIDList);

//        获取用户的平均分和学习时间
        List<Float> myAvgScoreList = getUserAvgScore(testPaperIDList,userid);
        List<Float> myAvgTimeList = getCourseTimeByID(userSubList,userid);

        Integer len = userSubList.size();

        List<TableDTO> list=new ArrayList<>();
        for(int i = 0;i<len;i++){
            TableDTO tableDTO = new TableDTO();
            tableDTO.setCouserID(userSubList.get(i));
            tableDTO.setCourseName(courses.get(i).getCoursename());
            tableDTO.setAvgTime(avgTimeList.get(i));
            tableDTO.setAvgScore(avgScoreList.get(i));
            tableDTO.setMyScore(myAvgScoreList.get(i));
            tableDTO.setMyTime(myAvgTimeList.get(i));
            list.add(tableDTO);
        }

        return Result.success(list,"成功");

    }

    @ApiOperation("获取所有知识点对应的正确率")
    @CrossOrigin
    @GetMapping("/getknowledgecorrectrate")
    public Result<?> getKnowledgeCorrectRate(@RequestParam Integer userid) {
        List<Integer> analyseIDList = getAnalyseIDByUserID(userid);
        List<KnowledgeDTO> list = new ArrayList<>();

        for (Integer analyseID : analyseIDList) {
            List<TestAnalyseKnowledge> testAnalyseKnowledgeList = testAnalyseKnowledgeMapper.selectList(
                    new LambdaQueryWrapper<TestAnalyseKnowledge>().eq(TestAnalyseKnowledge::getTestanalyseid, analyseID)
            );
            for (TestAnalyseKnowledge testAnalyseKnowledge : testAnalyseKnowledgeList) {
                KnowledgeDTO knowledgeDTO = new KnowledgeDTO();
                knowledgeDTO.setKnowledgeid(testAnalyseKnowledge.getKnowledgeid());
                knowledgeDTO.setContainknowledgenum(testAnalyseKnowledge.getContainknowledgenum());
                knowledgeDTO.setCorrectknowledgenum(testAnalyseKnowledge.getCorrectknowledgenum());
                knowledgeDTO.setKnowledgecontent(getKnowledgeContent(testAnalyseKnowledge.getKnowledgeid()).get(0));
                list.add(knowledgeDTO);
            }
        }

        // 合并相同知识点ID的数据，并计算正确率，保留两位小数
        List<KnowledgeBasicInfo> knowledgeBasicInfoList = new ArrayList<>();
        for (KnowledgeDTO knowledgeDTO : list) {
            boolean flag = false;
            for (KnowledgeBasicInfo knowledgeBasicInfo : knowledgeBasicInfoList) {
                if (knowledgeBasicInfo.getKnowledgeid().equals(knowledgeDTO.getKnowledgeid())) {
                    knowledgeBasicInfo.setContainknowledgenum(knowledgeBasicInfo.getContainknowledgenum() + knowledgeDTO.getContainknowledgenum());
                    knowledgeBasicInfo.setCorrectknowledgenum(knowledgeBasicInfo.getCorrectknowledgenum() + knowledgeDTO.getCorrectknowledgenum());
                    knowledgeBasicInfo.setCorrectrate(Math.round(((double) knowledgeBasicInfo.getCorrectknowledgenum() / knowledgeBasicInfo.getContainknowledgenum()) * 100.0) / 100.0);
                    flag = true;
                    break;
                }
            }
            if (!flag) {
                KnowledgeBasicInfo knowledgeBasicInfo = new KnowledgeBasicInfo();
                knowledgeBasicInfo.setKnowledgeid(knowledgeDTO.getKnowledgeid());
                knowledgeBasicInfo.setKnowledgecontent(knowledgeDTO.getKnowledgecontent());
                knowledgeBasicInfo.setContainknowledgenum(knowledgeDTO.getContainknowledgenum());
                knowledgeBasicInfo.setCorrectknowledgenum(knowledgeDTO.getCorrectknowledgenum());
                knowledgeBasicInfo.setCorrectrate(Math.round(((double) knowledgeDTO.getCorrectknowledgenum() / knowledgeDTO.getContainknowledgenum()) * 100.0) / 100.0);
                knowledgeBasicInfoList.add(knowledgeBasicInfo);
            }
        }

        // 排序并提取correctrate最低的前三个
        knowledgeBasicInfoList.sort(Comparator.comparingDouble(KnowledgeBasicInfo::getCorrectrate));
        List<String> lowestCorrectRateContents = knowledgeBasicInfoList.stream()
                .limit(3)
                .map(KnowledgeBasicInfo::getKnowledgecontent)
                .collect(Collectors.toList());

        return Result.success(lowestCorrectRateContents, "成功");
    }

//    根据courseid和userid，获取用户的学习时长
    private List<Float> getCourseTimeByID(List<Integer> courseids,Integer userid){
        List<Float> list = new ArrayList<>();
        for (Integer integer:courseids){
            BigCourse_User bigCourse_user = bigCourse_userMapper.selectOne(
                    new LambdaQueryWrapper<BigCourse_User>().eq(
                            BigCourse_User::getCourseid,integer
                    ).and(
                            wrapper -> wrapper.eq(BigCourse_User::getUserid,userid)
                    )
            );
            double studytime = bigCourse_user.getStudytime();
            list.add((float) studytime);
        }

        return list;
    }

//    根据testpaperid，获取用户的平均分
    private List<Float> getUserAvgScore(List<Integer> testPaperIDList,Integer userid){
        List<Float> avgList = new ArrayList<>();
        for (Integer integer:testPaperIDList){
            List<TestRecord> testRecords = testRecordMapper.selectList(
                    new LambdaQueryWrapper<TestRecord>().eq(
                            TestRecord::getTestpaperid,integer
                    ).and(
                            wrapper -> wrapper.eq(TestRecord::getUserid,userid)
                    )
            );
            double sum = 0f;
            for (TestRecord testRecord:testRecords){
                sum += testRecord.getTestscore();
            }
            double sumAvg = sum / testRecords.size();
            avgList.add((float)sumAvg);
        }
        return avgList;
    }

    private List<Float> getAvgScoreByIDList(List<Integer> TestPaperIDList){
        List<Float> avgList = new ArrayList<>();
        for (Integer integer:TestPaperIDList){
            List<TestRecord> testRecords = testRecordMapper.selectList(
                    new LambdaQueryWrapper<TestRecord>().eq(
                            TestRecord::getTestpaperid,integer
                    )
            );
            double sum = 0f;
            for (TestRecord testRecord:testRecords){
                sum += testRecord.getTestscore();
            }
            double sumAvg = sum / testRecords.size();
            avgList.add((float)sumAvg);
        }
        return avgList;
    }

    private List<Float> getAvgCourseTimeByIDList(List<Integer> courseids){
//        根据courseid获取bigcourse_user表中的数据，相同的courseid,它们studyTime要加在一起
        List<Float> avgList = new ArrayList<>();
        for (Integer integer:courseids){
            List<BigCourse_User> bigCourse_users = bigCourse_userMapper.selectList(
                    new LambdaQueryWrapper<BigCourse_User>().eq(
                            BigCourse_User::getCourseid,integer
                    )
            );
            double sum = 0f;
            for (BigCourse_User bigCourse_user:bigCourse_users){
                sum += bigCourse_user.getStudytime();
            }
            double sumAvg = sum / bigCourse_users.size();
            avgList.add((float)sumAvg);
        }
        return avgList;
    }

    private List<BigCourse> getCourseByID(List<Integer> courseids){
        List<BigCourse> bigCourses = bigCourseMapper.selectList(
                new LambdaQueryWrapper<BigCourse>().in(
                        BigCourse::getCourseid,courseids
                )
        );
        return bigCourses;

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

}
