package com.example.SmartEduX.Controller;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.SmartEduX.Mapper.VideoCourseMapper;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.User;
import com.example.SmartEduX.entity.VideoCourse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.*;
import java.util.stream.Collectors;

@Mapper
@Api(tags = "API接口")
@RestController
@RequestMapping("videocourse")
@CrossOrigin(origins = "*", maxAge = 3600)
public class VideoCourseController {
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
                return Result.error("-1", "找不到小章节信息");
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
            return Result.success(result, "成功");
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("-1", "找不到小章节信息");
        }
    }

    @ApiOperation("播放界面的小章节信息以及ID获取")
    @CrossOrigin
    @GetMapping("/videochaptersinfo")
    public Result<Map<String, Object>> getVideoChapters(@RequestParam Integer courseId, @RequestParam String videoCourseName) {
        QueryWrapper<VideoCourse> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("courseid", courseId).eq("videocoursename", videoCourseName);
        List<VideoCourse> videoCourses = videoCourseMapper.selectList(queryWrapper);

        QueryWrapper<VideoCourse> queryWrapper1 = new QueryWrapper<>();
        queryWrapper1.eq("videocoursename", videoCourseName);
        List<VideoCourse> videocourse = videoCourseMapper.selectList(queryWrapper1);

        // 获取该小章节的videoOrder
        Integer videoOrder = videoCourses.get(0).getVideoorder();
        // 获取该小章节的ID
        Integer videoCourseID = videocourse.get(0).getVideocourseid();

        // 根据videoOrder和courseId查找数据库中所有的videoCourseName
        QueryWrapper<VideoCourse> queryWrapper2 = new QueryWrapper<>();
        queryWrapper2.eq("courseid", courseId).eq("videoorder", videoOrder);
        List<VideoCourse> allVideoCourses = videoCourseMapper.selectList(queryWrapper2);

        if (allVideoCourses.isEmpty()) {
            return Result.error("-1", "未找到数据");
        }

        List<String> videoCourseNames = new ArrayList<>();
        for (VideoCourse course : allVideoCourses) {
            videoCourseNames.add(course.getVideocoursename());
        }

        // 创建返回结果
        Map<String, Object> resultData = new HashMap<>();
        resultData.put("videoCourseID", videoCourseID);
        resultData.put("videoCourseNames", videoCourseNames);

        return Result.success(resultData, "成功");
    }

    @ApiOperation("获取播放视频链接")
    @CrossOrigin
    @GetMapping("/videoplaylinkinfo")
    public Result<String> getVideoPlayLink(@RequestParam Integer videoCourseID) {
        VideoCourse videoCourse = videoCourseMapper.selectById(videoCourseID);
        String result = videoCourse.getPlaylink();
        return Result.success(result,"成功");
    }
}

