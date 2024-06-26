package com.example.SmartEduX.Controller;


import com.example.SmartEduX.Mapper.IntegralRecordMapper;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.IntegralRecord;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;


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
        // 获取当前时间的年月
        LocalDate currentDate = LocalDate.now();
        String currentYearMonth = currentDate.format(DateTimeFormatter.ofPattern("yyyy-MM"));
        // 设置要更新的值
        IntegralRecord record = new IntegralRecord();
        record.setUserid(userid);
        record.setSource(source);
        record.setDate(currentYearMonth);
        record.setScore(1);
        // 更新记录
        integralRecordMapper.insert(record);
        integralRecordMapper.updateById(record);

        return Result.success("成功");
    }
}
