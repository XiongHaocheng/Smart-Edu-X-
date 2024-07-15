package com.example.SmartEduX.Mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.SmartEduX.entity.QuestionKnowledge;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface QuestionKnowledgeMapper extends BaseMapper<QuestionKnowledge> {
}
