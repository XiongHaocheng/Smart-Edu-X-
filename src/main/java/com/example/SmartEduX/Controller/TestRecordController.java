package com.example.SmartEduX.Controller;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.example.SmartEduX.Mapper.TestRecordMapper;
import com.example.SmartEduX.Mapper.UserMapper;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.TestRecord;
import com.example.SmartEduX.entity.User;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Date;
import java.util.Map;

@Api(tags = "API接口")
@RestController
@RequestMapping("testrecord")
@CrossOrigin(origins = "*", maxAge = 3600)
public class TestRecordController {
    @Autowired
    @Resource
    private TestRecordMapper testRecordMapper;

    @Autowired
    @Resource
    private UserMapper userMapper;


    @ApiOperation("添加一条新的记录")
    @CrossOrigin
    @PostMapping("/addrecord")
    public Result<?> addrecord(@RequestBody Map<String, Integer> requestData) {
//        在testrecord插入一行
        TestRecord testRecord = new TestRecord();
        Integer paperid = requestData.get("paperid");
        Integer userid = requestData.get("userid");
        // 检查数据库中是否已存在相同用户名的用户
        User res1 = userMapper.selectOne(Wrappers.<User>lambdaQuery().eq(User::getUserid, userid));
        if(res1 != null){
//            新建一个testrecord
            testRecord.setUserid(userid);
            testRecord.setFinishstate(false);
            Date currentDate = new Date();
//            System.out.println(currentDate);
            testRecord.setStarttime(currentDate);
            testRecord.setTestpaperid(paperid);
            testRecord.setTestscore(0.000F);
//            刚开始考试没有考试分析
//            testRecord.setTestanalyseid();

            testRecordMapper.insert(testRecord);
            return Result.success(testRecord.getTestrecordid(),"成功");
        }else{
            return Result.error("-1","新建考试记录：未查找到用户！");
        }
    }
}
