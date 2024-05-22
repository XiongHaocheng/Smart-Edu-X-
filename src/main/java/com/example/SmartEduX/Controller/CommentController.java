package com.example.SmartEduX.Controller;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.SmartEduX.Mapper.CommentMapper;
import com.example.SmartEduX.Mapper.UserMapper;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.Comment;
import com.example.SmartEduX.entity.User;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.*;
@Mapper
@Api(tags = "API接口")
@RestController
@RequestMapping("comment")
@CrossOrigin(origins = "*", maxAge = 3600)
public class CommentController {
    @Autowired
    @Resource
    private CommentMapper commentMapper;
    @Autowired
    @Resource
    private UserMapper userMapper;
    @ApiOperation("获取大课程评论信息")
    @CrossOrigin
    @GetMapping(value = "/coursecommentinfo")
    public Result<List<Map<String, Object>>> getCourseCommentinfo(@RequestParam Integer courseId) {
        QueryWrapper<Comment> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("courseid", courseId);
        List<Comment> comments = commentMapper.selectList(queryWrapper);
        // 检查是否有相关记录
        if (comments == null || comments.isEmpty()) {
            return Result.error("-1","找不到评论信息");
        }
        // 构造返回的评论列表
        List<Map<String, Object>> result = new ArrayList<>();
        for (Comment comment : comments) {
            Map<String, Object> commentMap = new HashMap<>();
            commentMap.put("avatar", comment.getAvatar());
            commentMap.put("name", comment.getName());
            commentMap.put("commenttime", comment.getCommenttime());
            commentMap.put("commentcontent", comment.getCommentcontent());
            result.add(commentMap);
        }

        return Result.success(result,"成功");
    }

    @ApiOperation("获取单节录播课程评论信息")
    @CrossOrigin
    @GetMapping(value = "/videocommentinfo")
    public Result<List<Map<String, Object>>> getVideoCourseCommentinfo(@RequestParam Integer videoCourseID) {
        QueryWrapper<Comment> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("videocourseid", videoCourseID);
        List<Comment> comments = commentMapper.selectList(queryWrapper);
        // 检查是否有相关记录
        if (comments == null || comments.isEmpty()) {
            return Result.error("-1","找不到评论信息");
        }
        // 构造返回的评论列表
        List<Map<String, Object>> result = new ArrayList<>();
        for (Comment comment : comments) {
            Map<String, Object> commentMap = new HashMap<>();
            commentMap.put("avatar", comment.getAvatar());
            commentMap.put("name", comment.getName());
            commentMap.put("commenttime", comment.getCommenttime());
            commentMap.put("commentcontent", comment.getCommentcontent());
            result.add(commentMap);
        }

        return Result.success(result,"成功");
    }


    @ApiOperation("新增大课程评论信息")
    @CrossOrigin
    @PostMapping ("/addcoursecomment")
    public Result<List<Map<String, Object>>> addCourseComment(@RequestBody Comment request) {
        String commentContent = request.getCommentcontent();
        Integer userId = request.getUserid();
        Integer courseId = request.getCourseid();

        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("userid", userId);
        List<User> userList = userMapper.selectList(queryWrapper);

        User user = userList.get(0); // 只有一个用户匹配

        // 获取当前评论的时间
        Date currentTime = new Date();
        // 创建SimpleDateFormat对象，指定日期格式为 "yyyy-MM-dd"
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        // 格式化日期为字符串
        String commentTime = sdf.format(currentTime);

        // 插入评论数据到数据库中
        Comment comment = new Comment();
        comment.setAvatar(user.getUseravatar());
        comment.setName(user.getUsername());
        comment.setCommenttime(commentTime);
        comment.setCommentcontent(commentContent);
        comment.setUserid(userId);
        comment.setCourseid(courseId);

        commentMapper.insert(comment);

        return Result.success("评论成功");
    }

    @ApiOperation("新增单节录播课程评论信息")
    @CrossOrigin
    @PostMapping ("/addvideocoursecomment")
    public Result<List<Map<String, Object>>> addVideoCourseComment(@RequestBody Comment request) {
        String commentContent = request.getCommentcontent();
        Integer userId = request.getUserid();
        Integer videocourseId = request.getVideocourseid();

        QueryWrapper<User> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("userid", userId);
        List<User> userList = userMapper.selectList(queryWrapper);

        User user = userList.get(0); // 只有一个用户匹配

        // 获取当前评论的时间
        Date currentTime = new Date();
        // 创建SimpleDateFormat对象，指定日期格式为 "yyyy-MM-dd"
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        // 格式化日期为字符串
        String commentTime = sdf.format(currentTime);

        // 插入评论数据到数据库中
        Comment comment = new Comment();
        comment.setAvatar(user.getUseravatar());
        comment.setName(user.getUsername());
        comment.setCommenttime(commentTime);
        comment.setCommentcontent(commentContent);
        comment.setUserid(userId);
        comment.setVideocourseid(videocourseId);

        commentMapper.insert(comment);

        return Result.success("评论成功");
    }
}
