package com.example.SmartEduX.Controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.SmartEduX.Mapper.BigCourseMapper;
import com.example.SmartEduX.Mapper.BigCourse_KnowledgeMapper;
import com.example.SmartEduX.Mapper.KnowledgeMapper;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.BigCourse;
import com.example.SmartEduX.entity.BigCourse_Knowledge;
import com.example.SmartEduX.entity.Knowledge;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.models.auth.In;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

@Api(tags = "API接口")
@RestController
@RequestMapping("bigcourse")
@CrossOrigin(origins = "*", maxAge = 3600)
public class BigCourseController {
    @Autowired
    @Resource
    private BigCourseMapper bigCourseMapper;
    @Autowired
    @Resource
    private KnowledgeMapper knowledgeMapper;
    @Autowired
    @Resource
    private BigCourse_KnowledgeMapper bigCourse_knowledgeMapper;
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
    @ApiOperation("根据课程ID获取附件")
    @CrossOrigin
    @GetMapping(value = "/courseattachment")
    public Result<?> getCourseAttachmentID(@RequestParam Integer courseID) {
        QueryWrapper<BigCourse> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("courseid", courseID);
        BigCourse course = bigCourseMapper.selectOne(queryWrapper);
        String attachment = course.getCourseattachment();
        if(attachment != "")
            return Result.success(attachment,"成功");
        else
            return Result.error("-1","未找到附件");
    }
    @ApiOperation("获取最感兴趣课程")
    @CrossOrigin
    @GetMapping(value = "/interestedcourse")
    public Result<?> getCourseAttachmentID(@RequestParam String maxCourseName) {
        QueryWrapper<BigCourse> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("coursename", maxCourseName);
        List<BigCourse> course = bigCourseMapper.selectList(queryWrapper);
        return Result.success(course,"成功");
    }

    @ApiOperation("根据ID获取课程")
    @CrossOrigin
    @GetMapping(value = "/getcoursebyidlist")
    public Result<?> getCourseByIDList(@RequestParam String courseIDListstr) {
        String[] courseIDList = courseIDListstr.split(",");
        List<Integer> list = new ArrayList<>();
        for( int i = 0; i < courseIDList.length; i++ ) {
            list.add(Integer.parseInt(courseIDList[i]));
        }
        List<BigCourse> courseList = getCourseByIDListImpl(list);
        return Result.success(courseList,"成功");
    }
    @ApiOperation("根据薄弱知识点获取推荐课程")
    @CrossOrigin
    @GetMapping(value = "/recommendcourses")
    public Result<?> getRecommendCourseList(@RequestParam String knowledge) {
        // 将知识点字符串转换为列表
        List<String> knowledgeList = Arrays.asList(knowledge.split(","));
        // 通过知识点名在 knowledge 表中找到对应的 knowledgeid
        List<Integer> knowledgeIds = new ArrayList<>();
        for (String knowledgeName : knowledgeList) {
            Knowledge knowledges = knowledgeMapper.selectOne(new LambdaQueryWrapper<Knowledge>()
                    .eq(Knowledge::getKnowledgename, knowledgeName));
            if (knowledges != null) {
                knowledgeIds.add(knowledges.getKnowledgeid());
            }
        }
        // 在 bigcourse_knowledge 表中通过 knowledgeid 找到对应的 bigcourseid（随机提取三个）
        List<Integer> bigCourseIds = new ArrayList<>();
        for (Integer knowledgeId : knowledgeIds) {
            List<BigCourse_Knowledge> bigCourseKnowledgeList = bigCourse_knowledgeMapper.selectList(
                    new LambdaQueryWrapper<BigCourse_Knowledge>().eq(BigCourse_Knowledge::getKnowledgeid, knowledgeId)
            );
            Collections.shuffle(bigCourseKnowledgeList); // 随机打乱列表
            for (int i = 0; i < Math.min(3, bigCourseKnowledgeList.size()); i++) {
                bigCourseIds.add(bigCourseKnowledgeList.get(i).getBigcourseid());
            }
        }
        // 在 bigcourse 表中通过 bigcourseid 找到对应的记录
        List<BigCourse> bigCourses = new ArrayList<>();
        for (Integer bigCourseId : bigCourseIds) {
            BigCourse bigCourse = bigCourseMapper.selectById(bigCourseId);
            if (bigCourse != null) {
                bigCourses.add(bigCourse);
            }
        }

        return Result.success(bigCourses, "成功");
    }
    private List<BigCourse> getCourseByIDListImpl(@RequestParam List<Integer> courseIDList) {
        List<BigCourse> courseList = new ArrayList<>();
        for (Integer courseID : courseIDList) {
            QueryWrapper<BigCourse> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("courseid", courseID);
            BigCourse course = bigCourseMapper.selectOne(queryWrapper);
            courseList.add(course);
        }
        return courseList;
    }
}

