package com.example.SmartEduX.Controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.SmartEduX.Mapper.TestPaperMapper;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.StudyPathModule;
import com.example.SmartEduX.entity.TestPaper;
import com.example.SmartEduX.entity.User;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@Api(tags = "API接口")
@RestController
@RequestMapping("testpaper")
@CrossOrigin(origins = "*", maxAge = 3600)
public class TestPaperController {

    @Autowired
    @Resource
    private TestPaperMapper testPaperMapper;

    @ApiOperation("测试:获取所有的考试列表")
    @CrossOrigin
    @GetMapping("/alltestlist")
    public Result<?> getAllPaper() {
        // 查询数据库中所有的考试
        List<TestPaper> testPaper = testPaperMapper.selectList(null);
        if (testPaper.isEmpty()) {
            // 如果未找到任何问题数据，返回错误信息
            return Result.error("-1", "未找到任何问题数据");
        }
        // 返回查询到的问题数据
        return Result.success(testPaper,"成功");
    }

    @ApiOperation("根据考试id获取考试详细内容")
    @CrossOrigin
    @GetMapping("/paperinfo")
    public Result<?> getPaperInfo(@RequestParam Integer testPaperID) {
//        System.out.println(testPaperID);
        TestPaper testPaper = null;
        testPaper = testPaperMapper.selectOne(new LambdaQueryWrapper<TestPaper>()
                .eq(TestPaper::getTestpaperid, testPaperID));
        if(testPaper==null){
            return Result.error("-1", "未找到任何数据");
        }

        return Result.success(testPaper,"成功");
    }

}
