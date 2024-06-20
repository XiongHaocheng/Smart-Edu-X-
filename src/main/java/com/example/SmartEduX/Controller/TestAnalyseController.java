package com.example.SmartEduX.Controller;

import com.example.SmartEduX.Mapper.KnowledgeMapper;
import com.example.SmartEduX.Mapper.QuestionKnowledgeMapper;
import com.example.SmartEduX.Mapper.TestAnalyseKnowledgeMapper;
import com.example.SmartEduX.Mapper.TestAnalyseMapper;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

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
}
