package com.example.SmartEduX.Controller;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.SmartEduX.Mapper.BigCourseMapper;
import com.example.SmartEduX.Mapper.StudyPathModuleMapper;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.BigCourse;
import com.example.SmartEduX.entity.StudyPathModule;
import com.example.SmartEduX.entity.User;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.*;
import java.util.stream.Collectors;

@Api(tags = "API接口")
@RestController
@RequestMapping("studypath")
@CrossOrigin(origins = "*", maxAge = 3600)
public class StudyPathModuleController {
    @Autowired
    @Resource
    private StudyPathModuleMapper studyPathModuleMapper;
    @Autowired
    @Resource
    private BigCourseMapper bigCourseMapper;

    @ApiOperation("获取学习路径模块信息")
    @CrossOrigin
    @GetMapping(value = "/studypathmodule")
    public Result<List<Map<String, Object>>> getStudyPathModule(@RequestParam Integer studyPathID) {
        QueryWrapper<StudyPathModule> queryWrapper1 = new QueryWrapper<>();
        queryWrapper1.eq("studypathid", studyPathID);
        List<StudyPathModule> studypathmodules = studyPathModuleMapper.selectList(queryWrapper1);
        List<Map<String, Object>> moduleList = new ArrayList<>();

        if (studypathmodules != null) {
            for (StudyPathModule module : studypathmodules) {
                Map<String, Object> moduleInfo = new HashMap<>();
                List<Map<String, String>> coursesList = new ArrayList<>();

                moduleInfo.put("studyPathModuleName", module.getModulename());
                moduleInfo.put("studyPathModuleDescription", module.getModuledescription());

                QueryWrapper<BigCourse> queryWrapper = new QueryWrapper<>();
                queryWrapper.eq("studypathid", studyPathID);
                queryWrapper.eq("moduleid", module.getModuleid());
                List<BigCourse> courses = bigCourseMapper.selectList(queryWrapper);

                for (BigCourse course : courses) {
                    Map<String, String> courseInfo = new HashMap<>();
                    courseInfo.put("studyPathCourseCover", course.getCoursecover());
                    courseInfo.put("studyPathCourseName", course.getCoursename());
                    courseInfo.put("studyPathCourseDescription", course.getCoursedescription());
                    coursesList.add(courseInfo);
                }
                moduleInfo.put("courses", coursesList);
                moduleList.add(moduleInfo);
            }
            return Result.success(moduleList,"成功");
        }
        return Result.success(null);
    }
}

