package com.example.SmartEduX.Controller;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.SmartEduX.Mapper.BigCourseMapper;
import com.example.SmartEduX.Mapper.VideoCourseMapper;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.VideoCourse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.*;
@Mapper

@Api(tags = "API接口")
@RestController
@RequestMapping("videocourse")
@CrossOrigin(origins = "*", maxAge = 3600)
public class VideoCourseController {
    @Autowired
    @Resource
    private BigCourseMapper bigCourseMapper;
    @Autowired
    @Resource
    private VideoCourseMapper videoCourseMapper;
    @ApiOperation("获取录播课程目录信息")
    @CrossOrigin
    @GetMapping("/videocatagorycourseinfo")
    public Result<Map<Integer, List<String>>> getVideoCatagory(@RequestParam Integer courseId) {
        try {
            // 使用条件构造器查询数据
            QueryWrapper<VideoCourse> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("courseid", courseId);
            List<VideoCourse> videoCourses = videoCourseMapper.selectList(queryWrapper);

            // 检查是否有相关记录
            if (videoCourses == null || videoCourses.isEmpty()) {
                return Result.error("-1","找不到小章节信息");
            }

            // 将结果组装成 Map 对象
            Map<Integer, List<String>> result = new HashMap<>();
            for (VideoCourse videoCourse : videoCourses) {
                int order = videoCourse.getVideoorder();
                String courseName = videoCourse.getVideocoursename();
                if (!result.containsKey(order)) {
                    result.put(order, new ArrayList<>());
                }
                result.get(order).add(courseName);
            }
            // 返回结果
            return Result.success(result,"成功");
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("-1","找不到小章节信息");
        }
    }
}

