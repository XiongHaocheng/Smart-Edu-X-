package com.example.SmartEduX.Controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.example.SmartEduX.Mapper.BigCourseMapper;
import com.example.SmartEduX.Mapper.ImageAndTextMapper;
import com.example.SmartEduX.Mapper.StudyPathMapper;
import com.example.SmartEduX.Mapper.TestPaperMapper;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Api(tags = "API接口")
@RestController
@RequestMapping("search")
@CrossOrigin(origins = "*", maxAge = 3600)
public class searchController {

    @Autowired
    @Resource
    private BigCourseMapper bigCourseMapper;

    @Autowired
    @Resource
    private StudyPathMapper studyPathMapper;

    @Autowired
    @Resource
    private ImageAndTextMapper imageAndTextMapper;

    @Autowired
    @Resource
    private TestPaperMapper testPaperMapper;

    @ApiOperation("搜索结果")
    @CrossOrigin
    @PostMapping("/searchresult")
    public Result<List<Object>> getSearchResult(@RequestParam String query , @RequestParam String currentNavItem) {
        List<Object> results = new ArrayList<>();
        if ("全部".equals(currentNavItem)) {
            QueryWrapper<BigCourse> wrapper1 = new QueryWrapper<>();
            wrapper1.like("coursename", query).or().like("coursedescription", query);
            List<BigCourse> courses = bigCourseMapper.selectList(wrapper1);
            for (BigCourse course : courses) {
                // 创建一个对象，包含 text1 和 text2 两个字段
                Map<String, String> item = new HashMap<>();
                item.put("text1", course.getCoursename());
                item.put("text2", course.getCoursedescription());
                // 将对象添加到结果列表中
                results.add(item);
            }
            QueryWrapper<TestPaper> wrapper2 = new QueryWrapper<>();
            wrapper2.like("testpapername", query);
            List<TestPaper> testpapers = testPaperMapper.selectList(wrapper2);
            for (TestPaper testpaper : testpapers) {
                // 创建一个对象，包含 text1 和 text2 两个字段
                Map<String, String> item = new HashMap<>();
                item.put("text1", testpaper.getTestpapername());
                // 将对象添加到结果列表中
                results.add(item);
            }
            QueryWrapper<StudyPath> wrapper3 = new QueryWrapper<>();
            wrapper3.like("studypathname", query).or().like("studypathdescription", query);
            List<StudyPath> studyPaths = studyPathMapper.selectList(wrapper3);
            for (StudyPath studyPath : studyPaths) {
                // 创建一个对象，包含 text1 和 text2 两个字段
                Map<String, String> item = new HashMap<>();
                item.put("text1", studyPath.getStudypathname());
                item.put("text2", studyPath.getStudypathdescription());
                // 将对象添加到结果列表中
                results.add(item);
            }
            QueryWrapper<ImageAndText> wrapper4 = new QueryWrapper<>();
            wrapper4.like("title", query);
            List<ImageAndText> imageAndTexts = imageAndTextMapper.selectList(wrapper4);
            for (ImageAndText imageAndText : imageAndTexts) {
                // 创建一个对象，包含 text1 和 text2 两个字段
                Map<String, String> item = new HashMap<>();
                item.put("text1", imageAndText.getTitle());
                // 将对象添加到结果列表中
                results.add(item);
            }
        }
        if ("录播课".equals(currentNavItem)) {
            QueryWrapper<BigCourse> wrapper = new QueryWrapper<>();
            wrapper.like("coursename", query).or().like("coursedescription", query);
            List<BigCourse> courses = bigCourseMapper.selectList(wrapper);
            for (BigCourse course : courses) {
                // 创建一个对象，包含 text1 和 text2 两个字段
                Map<String, String> item = new HashMap<>();
                item.put("text1", course.getCoursename());
                item.put("text2", course.getCoursedescription());
                // 将对象添加到结果列表中
                results.add(item);
            }
        }
        if ("考试练习".equals(currentNavItem)) {
            QueryWrapper<TestPaper> wrapper = new QueryWrapper<>();
            wrapper.like("testpapername", query);
            List<TestPaper> testpapers = testPaperMapper.selectList(wrapper);
            for (TestPaper testpaper : testpapers) {
                // 创建一个对象，包含 text1 和 text2 两个字段
                Map<String, String> item = new HashMap<>();
                item.put("text1", testpaper.getTestpapername());
                // 将对象添加到结果列表中
                results.add(item);
            }
        }
        if ("学习路径".equals(currentNavItem)) {
            QueryWrapper<StudyPath> wrapper = new QueryWrapper<>();
            wrapper.like("studypathname", query).or().like("studypathdescription", query);
            List<StudyPath> studyPaths = studyPathMapper.selectList(wrapper);
            for (StudyPath studyPath : studyPaths) {
                // 创建一个对象，包含 text1 和 text2 两个字段
                Map<String, String> item = new HashMap<>();
                item.put("text1", studyPath.getStudypathname());
                item.put("text2", studyPath.getStudypathdescription());
                // 将对象添加到结果列表中
                results.add(item);
            }
        }
        if ("图文".equals(currentNavItem)) {
            QueryWrapper<ImageAndText> wrapper = new QueryWrapper<>();
            wrapper.like("title", query);
            List<ImageAndText> imageAndTexts = imageAndTextMapper.selectList(wrapper);
            for (ImageAndText imageAndText : imageAndTexts) {
                // 创建一个对象，包含 text1 和 text2 两个字段
                Map<String, String> item = new HashMap<>();
                item.put("text1", imageAndText.getTitle());
                // 将对象添加到结果列表中
                results.add(item);
            }
        }

        return Result.success(results,"成功");
    }


    @ApiOperation("根据ID搜索结果")
    @CrossOrigin
    @PostMapping("/getid")
    public Result<Map<String, Integer>> getID(@RequestParam String name) {
        QueryWrapper<BigCourse> queryWrapper1 = new QueryWrapper<>();
        queryWrapper1.eq("coursename", name);
        BigCourse course  =  bigCourseMapper.selectOne(queryWrapper1);

        QueryWrapper<TestPaper> queryWrapper2 = new QueryWrapper<>();
        queryWrapper2.eq("testpapername", name);
        TestPaper testPaper  =  testPaperMapper.selectOne(queryWrapper2);

        QueryWrapper<StudyPath> queryWrapper3 = new QueryWrapper<>();
        queryWrapper3.eq("studypathname", name);
        StudyPath studyPath  =  studyPathMapper.selectOne(queryWrapper3);

        QueryWrapper<ImageAndText> queryWrapper4 = new QueryWrapper<>();
        queryWrapper4.eq("title", name);
        ImageAndText imageAndText  =  imageAndTextMapper.selectOne(queryWrapper4);

        Map<String, Integer> result = new HashMap<>();
        if (course != null) {
            Integer courseId = course.getCourseid();
            result.put("courseid", courseId);
            return Result.success(result, "成功");
        }
        if (testPaper != null) {
            Integer testPaperid = testPaper.getTestpaperid();
            result.put("testPaperid", testPaperid);
            return Result.success(result, "成功");
        }
        if (studyPath != null) {
            Integer studyPathid = studyPath.getStudypathid();
            result.put("studyPathid", studyPathid);
            return Result.success(result, "成功");
        }
        if (imageAndText != null) {
            Integer imageAndTextid = imageAndText.getImageandtextid();
            result.put("imageAndTextid", imageAndTextid);
            return Result.success(result, "成功");
        }
        return Result.error("-1", "失败");
    }
}
