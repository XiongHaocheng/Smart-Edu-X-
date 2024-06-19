package com.example.SmartEduX.Controller;

import com.example.SmartEduX.Mapper.KnowledgeMapper;
import com.example.SmartEduX.Mapper.QuestionKnowledgeMapper;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@Api(tags = "API接口")
@RestController
@RequestMapping("knowledge")
@CrossOrigin(origins = "*", maxAge = 3600)
public class KnowledgeController {
    @Autowired
    @Resource
    private KnowledgeMapper knowledgeMapper;
    @Autowired
    @Resource
    private QuestionKnowledgeMapper questionKnowledgeMapper;
}
