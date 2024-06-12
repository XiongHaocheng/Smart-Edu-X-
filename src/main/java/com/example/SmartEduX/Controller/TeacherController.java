package com.example.SmartEduX.Controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.example.SmartEduX.LoginTeacher;
import com.example.SmartEduX.Mapper.BigCourseMapper;
import com.example.SmartEduX.Mapper.TeacherMapper;
import com.example.SmartEduX.Utils.TeacherTokenUtils;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.BigCourse;
import com.example.SmartEduX.entity.Teacher;
import com.example.SmartEduX.entity.User;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.models.auth.In;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Api(tags = "API接口")
@RestController
@RequestMapping("teacher")
@CrossOrigin(origins = "*", maxAge = 3600)
public class TeacherController {
    @Autowired
    @Resource
    private TeacherMapper teacherMapper;
    @Autowired
    @Resource
    private BigCourseMapper bigCourseMapper;
    @CrossOrigin
    @PostMapping("/login")
    public Result<?> login(@RequestBody Teacher teacher) {

        Teacher teacherFromDb = teacherMapper.selectOne(new LambdaQueryWrapper<Teacher>()
                .eq(Teacher::getTeacherphone, teacher.getTeacherphone()));
        // 检查是否找到
        if (teacherFromDb == null) {
            return Result.error("-1", "手机号或密码错误");
        }

        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

        // 使用BCrypt进行密码匹配验证
        if (!passwordEncoder.matches(teacher.getTeacherpassword(), teacherFromDb.getTeacherpassword())) {
            // 如果密码不匹配
            return Result.error("-1", "手机号或密码错误");
        }
        // 如果用户名和密码都匹配，则生成Token
        String token = TeacherTokenUtils.genToken(teacherFromDb);
        teacherFromDb.setTeachertoken(token);

        // 可以增加用户访问计数
        LoginTeacher.addVisitCount();

        // 返回包含用户信息和Token的成功响应
        return Result.success(teacherFromDb,"登录成功");
    }
    @ApiOperation("注册")
    @CrossOrigin
    @PostMapping("/register")
    public Result<?> register(@RequestBody Teacher teacher) {
        //System.out.println(user.toString());
        // 检查数据库中是否已存在相同用户名的用户
        Teacher res1 = teacherMapper.selectOne(Wrappers.<Teacher>lambdaQuery().eq(Teacher::getTeachername, teacher.getTeachername()));
        Teacher res2 = teacherMapper.selectOne(Wrappers.<Teacher>lambdaQuery().eq(Teacher::getTeacherphone, teacher.getTeacherphone()));
        // 如果找到用户，返回错误信息
        if (res1 != null) {
            return Result.error("-1", "用户名已重复");
        }
        if (res2 != null) {
            return Result.error("-1", "该手机号已注册");
        }

        // 使用BCryptPasswordEncoder加密密码
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encodedPassword = passwordEncoder.encode(teacher.getTeacherpassword());

        // 只保存加密后的密码
        teacher.setTeacherpassword(encodedPassword);

        // 将用户信息插入数据库
        teacherMapper.insert(teacher);

        // 返回成功的响应
        return Result.success("注册成功");
    }
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

    @ApiOperation("上传附件")
    @CrossOrigin
    @PostMapping(value = "/upload")
    public Result<?> uploadPDF(@RequestParam Integer courseid, @RequestParam String filename , @RequestParam String filepath) {
        // 检查文件是否为空
        if (filename == "") {
            return Result.error("-1","文件为空");
        }

        // 构造保存文件的完整路径
        String filePath = filepath + filename;
        // 创建文件对象
        File dest = new File(filePath);
        // 如果目录不存在，则创建目录
        if (!dest.getParentFile().exists()) {
            dest.getParentFile().mkdirs();
        }

        // 更新课程信息，将文件的路径存储到数据库中
        BigCourse course = new BigCourse();
        course.setCourseid(courseid);
        course.setCourseattachment(filePath);
        bigCourseMapper.updateById(course);

        return Result.success("上传成功");
    }
    @ApiOperation("查看附件")
    @CrossOrigin
    @GetMapping(value = "/download")
    public Result<?> getAttachment(@RequestParam Integer courseid) {
        BigCourse bigCourse = bigCourseMapper.selectById(courseid);
        String result = bigCourse.getCourseattachment();
        return Result.success(result,"成功");
    }
    @ApiOperation("删除附件")
    @CrossOrigin
    @PostMapping(value = "/delete")
    public Result<?> deleteAttachment(@RequestParam Integer courseid) {
        BigCourse course = bigCourseMapper.selectById(courseid);
        if (course == null) {
            return Result.error("-1", "课程不存在");
        }
        // 将 attachment 字段置为空
        course.setCourseattachment("");
        bigCourseMapper.updateById(course);

        return Result.success("附件删除成功");
    }
}
