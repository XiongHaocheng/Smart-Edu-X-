package com.example.SmartEduX.Controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.example.SmartEduX.LoginTeacher;
import com.example.SmartEduX.Mapper.*;
import com.example.SmartEduX.Utils.TeacherTokenUtils;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.*;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.io.File;
import java.sql.Date;
import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
    @Autowired
    @Resource
    private UserMapper userMapper;
    @Autowired
    @Resource
    private BigCourse_UserMapper bigCourse_UserMapper;
    @Autowired
    @Resource
    private TestRecordMapper testRecordMapper;
    @Autowired
    @Resource
    private TestPaperMapper testPaperMapper;
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
    @ApiOperation("更改教师名")
    @CrossOrigin
    @PostMapping(value = "/changeteachername")
    public Result<?> changeTeacherName(@RequestParam Integer teacherid,@RequestParam String teachername) {
        Teacher teacher = teacherMapper.selectById(teacherid);
        if (teacher == null) {
            return Result.error("-1", "教师信息不存在");
        }
        // 将 attachment 字段置为空
        teacher.setTeachername(teachername);
        teacherMapper.updateById(teacher);
        return Result.success(teachername,"更新成功");
    }

    @ApiOperation("更改教师密码")
    @CrossOrigin
    @PostMapping(value = "/updatePassword")
    public Result<?> updatePassword(@RequestBody String passwordFormdata) {
        Gson gson = new Gson();
        JsonObject jsonObject = gson.fromJson(passwordFormdata, JsonObject.class);

        // 从JsonObject中获取各个值
        String teacherphone = jsonObject.get("teacherphone").getAsString();
        String oldpassword = jsonObject.get("oldpassword").getAsString();
        String newpassword = jsonObject.get("newpassword").getAsString();


        Teacher teacherFromDb = teacherMapper.selectOne(new LambdaQueryWrapper<Teacher>()
                .eq(Teacher::getTeacherphone, teacherphone));
        String passwordFromDb = teacherFromDb.getTeacherpassword();

        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        if(!passwordEncoder.matches(oldpassword, passwordFromDb)){
            return Result.error("-1","原密码错误");
        }else{
            String encodedPassword = passwordEncoder.encode(newpassword);
            teacherFromDb.setTeacherpassword(encodedPassword);
            teacherMapper.updateById(teacherFromDb);
            return Result.success(teacherFromDb,"更新密码成功！");
        }
    }
    @ApiOperation("获取学生信息")
    @CrossOrigin
    @GetMapping(value = "/studentmanageinfo")
    public Result<List<User>> getStudentInfo() {
        // 根据课程ID列表查询数据库中符合条件的课程数据
        List<User> users = userMapper.selectList(null);
        if (users.isEmpty()) {
            // 如果未找到符合条件的课程数据，返回错误信息
            return Result.error("-1", "未找到");
        }
        // 返回查询到的课程数据
        return Result.success(users,"成功");
    }
    @ApiOperation("获取学生学习时长")
    @CrossOrigin
    @GetMapping(value = "/studentstudytime")
    public Result<List<Map<String, Object>>> getStudentStudyTime() {
        // 从数据库中查询所有用户学习数据
        List<BigCourse_User> bigCourse_users = bigCourse_UserMapper.selectList(null);
        if (bigCourse_users.isEmpty()) {
            // 如果未找到符合条件的课程数据，返回错误信息
            return Result.error("-1", "未找到");
        }

        // 使用一个 Map 来存储每个用户的总学习时长
        Map<Integer, Double> userStudyTimeMap = new HashMap<>();
        for (BigCourse_User user : bigCourse_users) {
            userStudyTimeMap.put(user.getUserid(), userStudyTimeMap.getOrDefault(user.getUserid(), 0.00) + user.getStudytime());
        }

        // 将 Map 转换为 List<Map<String, Object>>
        List<Map<String, Object>> userStudyTimes = userStudyTimeMap.entrySet().stream()
                .map(entry -> {
                    Map<String, Object> map = new HashMap<>();
                    map.put("userid", entry.getKey());
                    map.put("totalStudyTime", entry.getValue());
                    return map;
                })
                .collect(Collectors.toList());

        // 返回查询到的课程数据
        return Result.success(userStudyTimes, "成功");
    }
    @ApiOperation("获取考试记录")
    @CrossOrigin
    @GetMapping(value = "/testrecord")
    public Result<List<Map<String, Object>>> getTestRecordInfo() {
        // 根据课程ID列表查询数据库中符合条件的课程数据
        List<TestRecord> testRecords = testRecordMapper.selectList(null);
        if (testRecords.isEmpty()) {
            // 如果未找到符合条件的课程数据，返回错误信息
            return Result.error("-1", "未找到");
        }
        List<Map<String, Object>> result = new ArrayList<>();

        for (TestRecord record : testRecords) {
            // 获取当前记录的 userId
            Integer userId = record.getUserid();
            Integer testpaperId = record.getTestpaperid();
            // 根据 userId 查询 user 表中的 username，假设这里使用 userMapper 查询
            User user = userMapper.selectById(userId);
            TestPaper testPaper = testPaperMapper.selectById(testpaperId);
            if (user != null && testPaper != null) {
                // 创建一个包含 TestRecord 和 username 的 Map
                Map<String, Object> recordWithUsername = new HashMap<>();
                recordWithUsername.put("testrecordid", record.getTestrecordid());
                recordWithUsername.put("username", user.getUsername());
                recordWithUsername.put("testpapername", testPaper.getTestpapername());
                recordWithUsername.put("starttime", record.getStarttime());
                recordWithUsername.put("finishstate", record.getFinishstate());
                recordWithUsername.put("fullscore", testPaper.getFullscore());
                recordWithUsername.put("testscore", record.getTestscore());
                if(testPaper.getPassscore() > record.getTestscore()){
                    recordWithUsername.put("ispass", 0);
                }else{
                    recordWithUsername.put("ispass", 1);
                }
                // 将当前记录添加到结果列表中
                result.add(recordWithUsername);
            }
        }

        // 返回查询到的课程数据
        return Result.success(result, "成功");
    }


}
