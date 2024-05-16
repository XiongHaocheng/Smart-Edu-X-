package com.example.SmartEduX.Controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.SmartEduX.Mapper.BigCourseMapper;
import com.example.SmartEduX.Mapper.StudyPathMapper;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.BigCourse;
import com.example.SmartEduX.entity.StudyPath;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@Api(tags = "API接口")
@RestController
@RequestMapping("studypath")
@CrossOrigin(origins = "*", maxAge = 3600)
public class StudyPathController {
    @Autowired
    @Resource
    private StudyPathMapper studyPathMapper;
    @ApiOperation("获取学习路径信息")
    @CrossOrigin
    @GetMapping(value = "/studypathinfo")
    public Result<List<StudyPath>> getAllStudyPaths() {
        // 查询数据库中所有的学习路径数据
        List<StudyPath> studyPaths = studyPathMapper.selectList(null);
        if (studyPaths.isEmpty()) {
            // 如果未找到任何学习路径数据，返回错误信息
            return Result.error("-1", "未找到任何学习路径数据");
        }
        // 返回查询到的学习路径数据
        return Result.success(studyPaths);
    }
}

