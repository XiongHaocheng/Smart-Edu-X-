package com.example.SmartEduX.Controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.SmartEduX.Mapper.BigCourseMapper;
import com.example.SmartEduX.Mapper.BigCourse_UserMapper;
import com.example.SmartEduX.Mapper.TestPaperMapper;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.models.auth.In;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Api(tags = "API接口")
@RestController
@RequestMapping("testpaper")
@CrossOrigin(origins = "*", maxAge = 3600)
public class TestPaperController {

    @Autowired
    @Resource
    private TestPaperMapper testPaperMapper;

    @Autowired
    @Resource
    private BigCourse_UserMapper bigCourse_userMapper;

    @Autowired
    @Resource
    private BigCourseMapper bigCourseMapper;

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

    @ApiOperation("获取用户所有的考试列表，考试列表根据用户订阅的课程筛选")
    @CrossOrigin
    @GetMapping("/usertestlist")
    public Result<?> getUserPaper(@RequestParam Integer userid){
//        根据userid查找所有用户订阅的课程列表
        List<Integer> userSubCourses = getUserSubCourse(userid);
        if( userSubCourses.isEmpty()){
            return Result.error("-1","未订阅课程");
        }
//        根据courseid list查找用户的试卷ID列表
        List<Integer> userPaperIDList = getUserPaperIDListByCourseIDList(userSubCourses);

//        根据paperid list 查找试卷信息
        List<TestPaper> testPapers = testPaperMapper.selectList(
                new LambdaQueryWrapper<TestPaper>().in(
                        TestPaper::getTestpaperid,userPaperIDList
                )
        );

        return Result.success(testPapers,"成功");
    }

    private List<Integer> getUserPaperIDListByCourseIDList(List<Integer> courseids){
        List<BigCourse> bigCourses = bigCourseMapper.selectList(
                new LambdaQueryWrapper<BigCourse>().in(
                        BigCourse::getCourseid,courseids
                )
        );
        // Use a Set to automatically remove duplicates
        Set<Integer> uniqueIds = new HashSet<>();
        for (BigCourse bigCourse : bigCourses) {
            uniqueIds.add(bigCourse.getTestpaperid());
        }

        // Convert back to a List if needed
        return new ArrayList<>(uniqueIds);
    }

    private List<Integer> getUserSubCourse(Integer userid){
        List<BigCourse_User> bigCourse_users = bigCourse_userMapper.selectList(
                new LambdaQueryWrapper<BigCourse_User>().eq(
                        BigCourse_User::getUserid,userid
                )
        );
        List<Integer> list = new ArrayList<>();
        for ( BigCourse_User bigCourse_user:bigCourse_users){
            list.add(bigCourse_user.getCourseid());
        }
        return list;
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
