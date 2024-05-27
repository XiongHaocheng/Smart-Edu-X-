package com.example.SmartEduX.Controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.SmartEduX.Mapper.BigCourseMapper;
import com.example.SmartEduX.Mapper.StudyPathMapper;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.BigCourse;
import com.example.SmartEduX.entity.ImageAndText;
import com.example.SmartEduX.entity.StudyPath;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Api(tags = "API接口")
@RestController
@RequestMapping("studypath")
@CrossOrigin(origins = "*", maxAge = 3600)
public class StudyPathController {
    @Autowired
    @Resource
    private StudyPathMapper studyPathMapper;
    @ApiOperation("获取部分学习路径信息")
    @CrossOrigin
    @GetMapping(value = "/studypathinfo")
    public Result<List<StudyPath>> getStudyPaths() {
        // 查询数据库中所有的学习路径数据
        List<StudyPath> studyPaths = studyPathMapper.selectList(null);
        if (studyPaths.isEmpty()) {
            // 如果未找到任何学习路径数据，返回错误信息
            return Result.error("-1", "未找到任何学习路径数据");
        }
        // 只保留前两个学习路径数据
        List<StudyPath> firstTwoStudyPaths = studyPaths.subList(0, Math.min(2, studyPaths.size()));

        // 返回查询到的学习路径数据
        return Result.success(firstTwoStudyPaths, "成功");
    }
    @ApiOperation("获取全部学习路径信息")
    @CrossOrigin
    @GetMapping(value = "/allstudypathinfo")
    public Result<List<StudyPath>> getAllStudyPaths() {

        List<StudyPath> studyPaths = studyPathMapper.selectList(null);
        if (studyPaths.isEmpty()) {
            return Result.error("-1", "未找到任何学习路径数据");
        }

        // 返回全部
        return Result.success(studyPaths,"成功");
    }
    @ApiOperation("获取各类学习路径信息（学习路径首页）")
    @CrossOrigin
    @GetMapping(value = "/studypathclassificationinfo")
    public Result<List<StudyPath>> getVideoCourses(@RequestParam String currentNavItem) {
        // 根据 currentNavItem 的值进行数据库查询
        List<StudyPath> studyPaths = new ArrayList<>();
        if (currentNavItem.equals("全部")) {
            studyPaths = studyPathMapper.selectList(null);
        } else {
            // 如果 currentNavItem 为 其它，则查询前端开发课程
            QueryWrapper<StudyPath> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("studypathclassification", currentNavItem);
            studyPaths = studyPathMapper.selectList(queryWrapper);
        }
        // 根据其他条件查询其他类型的课程
        return Result.success(studyPaths,"成功");
    }
    @ApiOperation("获取学习路径详细页信息")
    @CrossOrigin
    @GetMapping(value = "/studypathdetail")
    public Result<StudyPath> getStudyPathDetail(@RequestParam Integer studyPathID) {
        StudyPath studyPath = studyPathMapper.selectById(studyPathID);
        if (studyPath != null){
            StudyPath studyPaths = new StudyPath();
            studyPaths.setStudypathname(studyPath.getStudypathname());
            studyPaths.setStudypathdescription(studyPath.getStudypathdescription());
            studyPaths.setStudypathcover(studyPath.getStudypathcover());
            return Result.success(studyPaths,"成功");
        }else{
            return Result.error("-1", "找不到课程信息");
        }
    }
}

