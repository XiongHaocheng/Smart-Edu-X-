package com.example.SmartEduX.Controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.example.SmartEduX.LoginUser;
import com.example.SmartEduX.Mapper.UserMapper;
import com.example.SmartEduX.Utils.TokenUtils;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.ImageAndText;
import com.example.SmartEduX.entity.User;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@Api(tags = "API接口")
@RestController
@RequestMapping("user")
@CrossOrigin(origins = "*", maxAge = 3600)

public class UserController {
    @Autowired
    @Resource
    private UserMapper userMapper;

    @ApiOperation("注册")
    @CrossOrigin
    @PostMapping("/register")
    public Result<?> register(@RequestBody User user) {
        System.out.println(user.toString());
        // 检查数据库中是否已存在相同用户名的用户
        User res1 = userMapper.selectOne(Wrappers.<User>lambdaQuery().eq(User::getUsername, user.getUsername()));
        User res2 = userMapper.selectOne(Wrappers.<User>lambdaQuery().eq(User::getUserphone, user.getUserphone()));
        // 如果找到用户，返回错误信息
        if (res1 != null) {
            return Result.error("-1", "用户名已重复");
        }
        if (res2 != null) {
            return Result.error("-1", "该手机号已注册");
        }

        // 使用BCryptPasswordEncoder加密密码
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encodedPassword = passwordEncoder.encode(user.getUserpassword());

        // 只保存加密后的密码
        user.setUserpassword(encodedPassword);

        // 将用户信息插入数据库
        userMapper.insert(user);

        // 返回成功的响应
        return Result.success("注册成功");
    }

    @CrossOrigin
    @PostMapping("/login")
    public Result<?> login(@RequestBody User user) {
        // 假设user是请求中传来的用户对象，包含登录时输入的用户名和密码
        User userFromDb = userMapper.selectOne(new LambdaQueryWrapper<User>()
                .eq(User::getUserphone, user.getUserphone()));
        // 检查是否找到了用户
        if (userFromDb == null) {
            return Result.error("-1", "手机号或密码错误");
        }

        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

        // 使用BCrypt进行密码匹配验证
        if (!passwordEncoder.matches(user.getUserpassword(), userFromDb.getUserpassword())) {
            // 如果密码不匹配
            return Result.error("-1", "手机号或密码错误");
        }
        // 如果用户名和密码都匹配，则生成Token
        String token = TokenUtils.genToken(userFromDb);
        userFromDb.setUsertoken(token);

        // 可以增加用户访问计数
        LoginUser.addVisitCount();

        // 返回包含用户信息和Token的成功响应
        return Result.success(userFromDb,"登录成功");
    }

    @CrossOrigin
    @PostMapping("/update")
    public Result<?> update(@RequestBody User user) {
        User userFromDb = userMapper.selectOne(new LambdaQueryWrapper<User>()
                .eq(User::getUserphone, user.getUserphone()));
        userFromDb = user;
        userMapper.updateById(userFromDb);
        return Result.success(userFromDb,"更新成功");
    }

    @CrossOrigin
    @PostMapping("/updatePassword")
    public Result<?> updatePassword(@RequestBody String passwordFormdata){

        Gson gson = new Gson();
        JsonObject jsonObject = gson.fromJson(passwordFormdata, JsonObject.class);

        // 从JsonObject中获取各个值
        String userphone = jsonObject.get("userphone").getAsString();
        String oldpassword = jsonObject.get("oldpassword").getAsString();
        String newpassword = jsonObject.get("newpassword").getAsString();


        User userFromDb = userMapper.selectOne(new LambdaQueryWrapper<User>()
                .eq(User::getUserphone, userphone));
        String passwordFromDb = userFromDb.getUserpassword();

        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        if(!passwordEncoder.matches(oldpassword, passwordFromDb)){
            return Result.error("-1","原密码错误");
        }else{
            String encodedPassword = passwordEncoder.encode(newpassword);
            userFromDb.setUserpassword(encodedPassword);
            userMapper.updateById(userFromDb);
            return Result.success(userFromDb,"更新密码成功！");
        }

    }

    @ApiOperation("获取用户头像")
    @CrossOrigin
    @GetMapping(value ="/useravatar")
    public Result<String> getUserAvatar(@RequestParam Integer userId) {
    User user = userMapper.selectById(userId);
    String result = user.getUseravatar();
    return Result.success(result,"成功");
    }


}
