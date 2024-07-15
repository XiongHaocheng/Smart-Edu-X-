package com.example.SmartEduX.Mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.SmartEduX.entity.TestAnalyseKnowledge;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface TestAnalyseKnowledgeMapper extends BaseMapper<TestAnalyseKnowledge> {
}
