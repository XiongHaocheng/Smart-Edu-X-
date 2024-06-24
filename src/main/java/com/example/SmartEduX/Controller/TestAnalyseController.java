package com.example.SmartEduX.Controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.example.SmartEduX.Mapper.KnowledgeMapper;
import com.example.SmartEduX.Mapper.QuestionKnowledgeMapper;
import com.example.SmartEduX.Mapper.TestAnalyseKnowledgeMapper;
import com.example.SmartEduX.Mapper.TestAnalyseMapper;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.Knowledge;
import com.example.SmartEduX.entity.TestAnalyse;
import com.example.SmartEduX.entity.TestAnalyseKnowledge;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

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

    public class KnowledgeDTO{
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

    private List<String> getKnowledgeContent(Integer knowledgeID){
        List<String> list = new ArrayList<>();
        Knowledge knowledge = knowledgeMapper.selectById(knowledgeID);
        list.add(knowledge.getKnowledgename());
        list.add(knowledge.getKnowledgedomain());
        return list;
    }
}
