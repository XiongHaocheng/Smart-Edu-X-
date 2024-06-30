package com.example.SmartEduX.Controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.SmartEduX.Mapper.IntegralRecordMapper;
import com.example.SmartEduX.Mapper.UserMapper;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.ImageAndText;
import com.example.SmartEduX.entity.IntegralRecord;
import com.example.SmartEduX.entity.User;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;


@Api(tags = "API接口")
@RestController
@RequestMapping("integralrecord")
public class IntegralRecordController {
    @Autowired
    @Resource
    private IntegralRecordMapper integralRecordMapper;

    @ApiOperation("更新获取积分的记录")
    @CrossOrigin
    @PostMapping(value = "/updateintegralrecord")
    public Result<?> updateIntegralRecord(@RequestParam Integer userid,@RequestParam String source) {
        // 获取当前时间，精确到秒
        Date currentDate = new Date();
        // 设置要更新的值
        IntegralRecord record = new IntegralRecord();
        record.setUserid(userid);
        record.setSource(source);
        record.setDate(currentDate);
        record.setScore(1);
        // 更新记录
        integralRecordMapper.insert(record);
        integralRecordMapper.updateById(record);

        return Result.success("成功");
    }

    @ApiOperation("获取积分记录")
    @CrossOrigin
    @GetMapping(value = "/getintegralrecord")
    public Result<List<IntegralRecord>> getIntegralRecord(@RequestParam Integer userid){
        // 根据 currentNavItem 的值进行数据库查询
        List<IntegralRecord> record;

        QueryWrapper<IntegralRecord> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("userid", userid);
        record = integralRecordMapper.selectList(queryWrapper);

        // 根据其他条件查询其他类型的课程
        return Result.success(record,"成功");
    }

}
