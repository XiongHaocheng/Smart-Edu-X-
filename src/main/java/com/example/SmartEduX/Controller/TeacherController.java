package com.example.SmartEduX.Controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.example.SmartEduX.LoginTeacher;
import com.example.SmartEduX.Mapper.TeacherMapper;
import com.example.SmartEduX.Utils.TeacherTokenUtils;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.Teacher;
import com.example.SmartEduX.entity.User;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@Api(tags = "API接口")
@RestController
@RequestMapping("teacher")
@CrossOrigin(origins = "*", maxAge = 3600)
public class TeacherController {
    @Autowired
    @Resource
    private TeacherMapper teacherMapper;

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

}
