package com.example.SmartEduX.Controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.example.SmartEduX.Mapper.UserMapper;
import com.example.SmartEduX.LoginUser;
import com.example.SmartEduX.Utils.TokenUtils;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.User;
import io.swagger.annotations.Api;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
@Api(tags = "API接口")
@RestController
@RequestMapping("user")
@CrossOrigin(origins = "*", maxAge = 3600)

public class UserController {
    @Autowired

    @Resource
    private UserMapper userMapper;
    @CrossOrigin
    @PostMapping("/login")
    public Result<?> login(@RequestBody User user) {
        System.out.println(user.toString());
        // 假设user是请求中传来的用户对象，包含登录时输入的用户名和密码
        User userFromDb = userMapper.selectOne(new LambdaQueryWrapper<User>()
                .eq(User::getUserphone, user.getUserphone()));

// 检查是否找到了用户
        if (userFromDb == null) {
            return Result.error("-1", "用户名或密码错误");
        }

        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

// 使用BCrypt进行密码匹配验证
//        if (!passwordEncoder.matches(user.getUserpassword(), userFromDb.getUserpassword())) {
//            // 如果密码不匹配
//            return Result.error("-1", "用户名或密码错误");
//        }

        if (user.getUserpassword().equals(userFromDb.getUserpassword())) {
            // 如果用户名和密码都匹配，则生成Token
            String token = TokenUtils.genToken(userFromDb);
            userFromDb.setUsertoken(token);

// 可以增加用户访问计数
            LoginUser.addVisitCount();
// 返回包含用户信息和Token的成功响应
            return Result.success(userFromDb);
        }
        return null;
    }
}
