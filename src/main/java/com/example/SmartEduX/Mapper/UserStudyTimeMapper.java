package com.example.SmartEduX.Mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.SmartEduX.entity.UserStudyCourse;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface UserStudyTimeMapper extends BaseMapper<UserStudyCourse> {
}
