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
import java.util.stream.Collectors;

@Api(tags = "API接口")
@RestController
@RequestMapping("testpaper")
@CrossOrigin(origins = "*", maxAge = 3600)
public class TestPaperController {

    @Autowired
    @Resource
    private TestPaperMapper testPaperMapper;

    @ApiOperation("获取所有的考试列表，考试列表不包含有“每日练习”作为标题的考试项")
    @CrossOrigin
    @GetMapping("/alltestlist")
    public Result<?> getAllPaper() {
        // 查询数据库中所有的考试
        List<TestPaper> allTestPapers = testPaperMapper.selectList(null);
        if (allTestPapers.isEmpty()) {
            // 如果未找到任何问题数据，返回错误信息
            return Result.error("-1", "未找到任何问题数据");
        }

        // 过滤掉标题包含“每日练习”的考试项
        List<TestPaper> filteredTestPapers = allTestPapers.stream()
                .filter(paper -> !paper.getTestpapername().contains("每日练习"))
                .collect(Collectors.toList());

        // 返回过滤后的考试列表
        return Result.success(filteredTestPapers, "成功");
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

    @ApiOperation("查找以“每日练习”开头的试卷名称")
    @CrossOrigin
    @GetMapping("/practice")
    public Result<?> getPracticePaper() {
        QueryWrapper<TestPaper> queryWrapper = new QueryWrapper<>();
        queryWrapper.like("testpapername", "每日练习%");
        List<TestPaper> testPaper = testPaperMapper.selectList(queryWrapper);
        if (testPaper.isEmpty()) {
            return Result.error("-1", "未找到任何数据");
        }
        return Result.success(testPaper,"成功");
    }

}
