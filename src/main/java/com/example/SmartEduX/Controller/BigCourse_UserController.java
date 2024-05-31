package com.example.SmartEduX.Controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.example.SmartEduX.Mapper.BigCourseMapper;
import com.example.SmartEduX.Mapper.BigCourse_UserMapper;
import com.example.SmartEduX.Mapper.VideoCourseMapper;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.BigCourse;
import com.example.SmartEduX.entity.BigCourse_User;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.example.SmartEduX.entity.VideoCourse;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Api(tags = "API接口")
@RestController
@RequestMapping("bigcourseuser")
@CrossOrigin(origins = "*", maxAge = 3600)
public class BigCourse_UserController {
    @Autowired
    @Resource
    private BigCourseMapper bigCourseMapper;
    @Autowired
    @Resource
    private BigCourse_UserMapper bigCourse_UserMapper;
    @Autowired
    @Resource
    private VideoCourseMapper videoCourseMapper;
    @Autowired
    private ObjectMapper objectMapper;

    @ApiOperation("用户订阅课程")
    @CrossOrigin
    @PostMapping("/subscribecourse")
    public Result<?> getBigCourseID(@RequestParam Integer courseID, @RequestParam Integer userID) {
        //先获取该课程的小节数
        QueryWrapper<VideoCourse> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("courseid", courseID);
        List<VideoCourse> videoCourses = videoCourseMapper.selectList(queryWrapper);
        // 获取小节数
        int sectionCount = videoCourses.size();

        BigCourse_User bigcourse_user = new BigCourse_User();
        bigcourse_user.setCourseid(courseID);
        bigcourse_user.setUserid(userID);
        bigcourse_user.setUnfinishnum(sectionCount);
        bigcourse_user.setFinishnum(0);
        bigCourse_UserMapper.insert(bigcourse_user);
        return Result.success("订阅成功");
    }

    @ApiOperation("获取我的学习信息")
    @CrossOrigin
    @GetMapping(value = "/getmystudy")
    public Result<?> getBigCourseID(@RequestParam Integer userID) {
        QueryWrapper<BigCourse_User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("userid", userID);
        List<BigCourse_User> bigCourse_User = bigCourse_UserMapper.selectList(queryWrapper);
        if (bigCourse_User == null || bigCourse_User.isEmpty()) {
            return Result.error("-1","找不到学习信息");
        }
        List<BigCourse> mystudyinfo = new ArrayList<>();
        for (BigCourse_User courseUser : bigCourse_User) {
            // 获取大课程ID
            Integer bigCourseID = courseUser.getCourseid();
            // 根据大课程ID查询大课程信息
            BigCourse bigCourse = bigCourseMapper.selectById(bigCourseID);

            // 将查询到的大课程信息存入 BigCourseInfo 对象中
            BigCourse bigCourseInfo = new BigCourse();
            bigCourseInfo.setCoursename(bigCourse.getCoursename());
            bigCourseInfo.setCoursecover(bigCourse.getCoursecover());
            bigCourseInfo.setCourseid(bigCourse.getCourseid());
            // 将 BigCourseInfo 对象添加到列表中
            mystudyinfo.add(bigCourseInfo);
        }
        //System.out.println(mystudyinfo);
        return Result.success(mystudyinfo,"成功");
    }
    @ApiOperation("取消订阅")
    @CrossOrigin
    @PostMapping(value = "/deletesubscribe")
    public Result<?> deleteSubscribe(@RequestParam Integer userID,@RequestParam Integer courseID) {
        // 创建查询条件
        QueryWrapper<BigCourse_User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("userid", userID).eq("courseid", courseID);

        // 删除记录
        int deleteCount = bigCourse_UserMapper.delete(queryWrapper);

        if (deleteCount > 0) {
            return Result.success("取消订阅成功");
        } else {
            return Result.error("-1", "取消订阅失败或记录不存在");
        }
    }

    @ApiOperation("检查是否订阅")
    @CrossOrigin
    @PostMapping(value = "/isSubscribe")
    public Result<Boolean> isSubscribe(@RequestParam Integer courseID, @RequestParam Integer userID) {
        // 创建查询条件
        QueryWrapper<BigCourse_User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("userid", userID).eq("courseid", courseID);
        // 查询数据库
        BigCourse_User bigCourseUser = bigCourse_UserMapper.selectOne(queryWrapper);
        if(bigCourseUser==null){
            return Result.success(false,"成功");//未订阅
        }else{
            return Result.success(true,"成功");//订阅了
        }
    }

    @ApiOperation("更新用户观看视频的时长&&更新学习章节的次数")
    @CrossOrigin
    @PostMapping(value ="/adduserstudytime")
    public Result<String> addUserStudyTime(@RequestParam Integer userId , @RequestParam Integer courseId, @RequestParam Double time ,@RequestParam boolean isfinish,@RequestParam String videocoursename) {
        QueryWrapper<BigCourse_User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("userid", userId).eq("courseId",courseId);
        BigCourse_User bigCourse_User = bigCourse_UserMapper.selectOne(queryWrapper);
        //如果没有查找到数据，那么先插入新的userid、courseid进去，并把time设为0
        if(bigCourse_User == null){
            //插入新数据
           return Result.error("-1","用户未订阅该课程，不必记录");

        }
        // 计算新的观看时长
        Double curTime = (Double)bigCourse_User.getStudytime();
        Double newTime = curTime + time;
        // 更新数据库中的观看时长
        bigCourse_User.setStudytime(newTime);
        UpdateWrapper<BigCourse_User> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("userid", userId).eq("courseId", courseId);
        bigCourse_UserMapper.update(bigCourse_User, updateWrapper);
        //检查是否完成观看并记录状态
        if (isfinish) {
            // 更新 FinishVideoCourseName 列
            String finishVideoCourseNameJson = bigCourse_User.getFinishvideocoursename();
            List<String> finishVideoCourseNames;

            try {
                // 如果 JSON 字符串不为空，则将其解析为 List
                if (finishVideoCourseNameJson != null && !finishVideoCourseNameJson.isEmpty()) {
                    Gson gson = new Gson();
                    finishVideoCourseNames = gson.fromJson(finishVideoCourseNameJson, new TypeToken<List<String>>() {
                    }.getType());
                }else {
                    finishVideoCourseNames = new ArrayList<>();
                }

                // 检查是否已经包含指定的视频课程名称
                if (!finishVideoCourseNames.contains(videocoursename)) {
                    // 更新完成次数和未完成次数
                    bigCourse_User.setFinishnum(bigCourse_User.getFinishnum() + 1);
                    bigCourse_User.setUnfinishnum(bigCourse_User.getUnfinishnum() - 1);

                    // 添加新的视频课程名称
                    finishVideoCourseNames.add(videocoursename);
                    String updatedFinishVideoCourseNameJson = objectMapper.writeValueAsString(finishVideoCourseNames);
                    bigCourse_User.setFinishvideocoursename(updatedFinishVideoCourseNameJson);

                    // 更新数据库记录
                    bigCourse_UserMapper.updateById(bigCourse_User);
                    return Result.success(null, "成功");
                } else {
                    return Result.error("-1", "已学习该课程");
                }
            } catch (IOException e) {
                return Result.error("-1", "处理 JSON 数据时出错");
            }
        } else {
            return Result.error("-1", "没有完成观看");
        }
    }

    @ApiOperation("获取已完成数和未完成数")
    @CrossOrigin
    @GetMapping("/getfinishnums")
    public Result<List<Integer>> getFinishNums(@RequestParam Integer userID, @RequestParam Integer courseID) {
        System.out.println(courseID);
        QueryWrapper<BigCourse_User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("userid", userID).eq("courseid", courseID);
        BigCourse_User bigCourseUser = bigCourse_UserMapper.selectOne(queryWrapper);
        System.out.println(bigCourseUser.toString());
        if (bigCourseUser == null) {
            return Result.error("-1","未找到对应记录");
        }
        List<Integer> nums = Arrays.asList(bigCourseUser.getFinishnum(), bigCourseUser.getUnfinishnum());
        return Result.success(nums, "成功");
    }
}
