package com.example.SmartEduX.Controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.SmartEduX.Mapper.BigCourseMapper;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.BigCourse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Api(tags = "API接口")
@RestController
@RequestMapping("bigcourse")
@CrossOrigin(origins = "*", maxAge = 3600)
public class BigCourseController {
    @Autowired
    @Resource
    private BigCourseMapper bigCourseMapper;
    @ApiOperation("获取大课程信息")
    @CrossOrigin
    @GetMapping(value = "/bigcourseinfo")
    public Result<List<BigCourse>> getAllBigCourses() {
        // 根据课程ID列表查询数据库中符合条件的课程数据
        List<BigCourse> courses = bigCourseMapper.selectList(null);
        if (courses.isEmpty()) {
            // 如果未找到符合条件的课程数据，返回错误信息
            return Result.error("-1", "未找到符合条件的课程数据");
        }
        // 返回查询到的课程数据
        return Result.success(courses,"成功");
    }
        @ApiOperation("获取各类录播课程信息")
        @CrossOrigin
        @GetMapping(value = "/videocourseinfo")
        public Result<List<BigCourse>> getVideoCourses(@RequestParam String currentNavItem) {
            // 根据 currentNavItem 的值进行数据库查询
            List<BigCourse> courses = new ArrayList<>();
            if (currentNavItem.equals("全部")) {
                courses = bigCourseMapper.selectList(null);
            } else if (currentNavItem.equals("前端开发")) {
                // 如果 currentNavItem 为 "前端开发"，则查询前端开发课程
                QueryWrapper<BigCourse> queryWrapper = new QueryWrapper<>();
                queryWrapper.eq("coursedomain", "前端开发");
                courses = bigCourseMapper.selectList(queryWrapper);
            } else if (currentNavItem.equals("后端开发")) {
                QueryWrapper<BigCourse> queryWrapper = new QueryWrapper<>();
                queryWrapper.eq("coursedomain", "后端开发");
                courses = bigCourseMapper.selectList(queryWrapper);
            }
            else if (currentNavItem.equals("移动开发")) {
                QueryWrapper<BigCourse> queryWrapper = new QueryWrapper<>();
                queryWrapper.eq("coursedomain", "移动开发");
                courses = bigCourseMapper.selectList(queryWrapper);
            }
            else if (currentNavItem.equals("人工智能")) {
                QueryWrapper<BigCourse> queryWrapper = new QueryWrapper<>();
                queryWrapper.eq("coursedomain", "人工智能");
                courses = bigCourseMapper.selectList(queryWrapper);
            }
            // 根据其他条件查询其他类型的课程
            return Result.success(courses,"成功");
        }

}

