package com.example.SmartEduX.Controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.example.SmartEduX.Mapper.UserStudyTimeMapper;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.UserStudyCourse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@Api(tags = "API接口")
@RestController
@RequestMapping("userstudytime")
@CrossOrigin(origins = "*", maxAge = 3600)
public class UserStudyTimeController {
    @Autowired
    @Resource
    private UserStudyTimeMapper userStudyTimeMapper;
    @ApiOperation("增加用户观看视频的时长")
    @CrossOrigin
    @PostMapping(value ="/adduserstudytime")
    public Result<String> addUserStudyTime(@RequestParam Integer userId , @RequestParam Integer courseId, @RequestParam Double time) {
        QueryWrapper<UserStudyCourse> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("userid", userId).eq("bigcourseid",courseId);
        UserStudyCourse userStudyCourse = userStudyTimeMapper.selectOne(queryWrapper);
        //如果没有查找到数据，那么先插入新的userid、courseid进去，并把time设为0
        if(userStudyCourse == null){
            //插入新数据
            userStudyCourse = new UserStudyCourse();
            userStudyCourse.setUserid(userId);
            userStudyCourse.setBigcourseid(courseId);
            userStudyCourse.setStudytime(0.0); // 初始观看时长设为0
            userStudyTimeMapper.insert(userStudyCourse);
        }
        // 计算新的观看时长
        Double curTime = userStudyCourse.getStudytime();
        Double newTime = curTime + time;
        // 更新数据库中的观看时长
        userStudyCourse.setStudytime(newTime);
        UpdateWrapper<UserStudyCourse> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("userid", userId).eq("bigcourseid", courseId);
        int updateResult = userStudyTimeMapper.update(userStudyCourse, updateWrapper);

        if (updateResult > 0) {
            return Result.success("成功");
        } else {
            return Result.error("-1","Failed to update study time");
        }

    }
}
