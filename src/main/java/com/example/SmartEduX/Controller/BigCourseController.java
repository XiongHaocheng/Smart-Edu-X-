package com.example.SmartEduX.Controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.SmartEduX.Mapper.BigCourseMapper;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.BigCourse;
import com.example.SmartEduX.entity.ImageAndText;
import com.example.SmartEduX.entity.User;
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
        @ApiOperation("获取各类录播课程信息（录播课首页）")
        @CrossOrigin
        @GetMapping(value = "/videocourseinfo")
        public Result<List<BigCourse>> getVideoCourses(@RequestParam String currentNavItem) {
            // 根据 currentNavItem 的值进行数据库查询
            List<BigCourse> courses = new ArrayList<>();
            if (currentNavItem.equals("全部")) {
                courses = bigCourseMapper.selectList(null);
            } else {
                // 如果 currentNavItem 为 "前端开发"，则查询前端开发课程
                QueryWrapper<BigCourse> queryWrapper = new QueryWrapper<>();
                queryWrapper.eq("coursedomain", currentNavItem);
                courses = bigCourseMapper.selectList(queryWrapper);
            }
            // 根据其他条件查询其他类型的课程
            return Result.success(courses,"成功");
        }
    @ApiOperation("获取录播课各课程内容（录播课详细页）")
    @CrossOrigin
    @GetMapping(value = "/videodetailcourseinfo")
    public Result<BigCourse> getVideoDetialCourses(@RequestParam Integer courseId) {
        BigCourse course = bigCourseMapper.selectById(courseId);
        if (course != null){
            BigCourse courses = new BigCourse();
            courses.setCoursename(course.getCoursename());
            courses.setCoursedescription(course.getCoursedescription());
            courses.setCoursecover(course.getCoursecover());
            courses.setCourseimage(course.getCourseimage());
            courses.setMajorchapters(course.getMajorchapters());
            return Result.success(courses,"成功");
        }else{
            return Result.error("-1", "找不到课程信息");
        }
    }
    @ApiOperation("根据课程名获取ID")
    @CrossOrigin
    @GetMapping(value = "/bigcourseIDinfo")
    public Result<Integer> getBigCourseID(@RequestParam String studyPathCourseName) {
        QueryWrapper<BigCourse> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("coursename", studyPathCourseName);
        List<BigCourse> ID = bigCourseMapper.selectList(queryWrapper);
        if (!ID.isEmpty()) {
            BigCourse course = ID.get(0);
            Integer courseId = course.getCourseid();
            return Result.success(courseId,"成功");
        } else {
            return Result.error("-1","课程不存在");
        }
    }
}

