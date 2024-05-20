package com.example.SmartEduX.Mapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.SmartEduX.entity.VideoCourse;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface VideoCourseMapper extends BaseMapper<VideoCourse>{

}
