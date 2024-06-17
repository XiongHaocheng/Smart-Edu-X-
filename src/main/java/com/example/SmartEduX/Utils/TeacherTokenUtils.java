package com.example.SmartEduX.Utils;

import cn.hutool.core.date.DateUtil;
import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.example.SmartEduX.Mapper.TeacherMapper;
import com.example.SmartEduX.Mapper.UserMapper;
import com.example.SmartEduX.entity.Teacher;
import com.example.SmartEduX.entity.User;
import javax.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.PostConstruct;
import java.util.Date;

@Slf4j
@Component
public class TeacherTokenUtils {

    @Autowired
    private TeacherMapper teacherMapper;

    private static TeacherMapper staticTeacherMapper;

    @PostConstruct
    public void init() {
        staticTeacherMapper = teacherMapper;
    }

    /**
     * 生成token
     * @param teacher
     * @return
     */
    public static String genToken(Teacher teacher) {
        return JWT.create().withExpiresAt(DateUtil.offsetDay(new Date(), 1)).withAudience(teacher.getTeacherid().toString())
                .sign(Algorithm.HMAC256(teacher.getTeacherpassword()));
    }

    /**
     * 获取token中的用户信息
     * @return
     */
    public static Teacher getTeacher() {
        try {
            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
            String token = request.getHeader("token");
            String aud = JWT.decode(token).getAudience().get(0);
            Integer teacherId = Integer.valueOf(aud);
            return staticTeacherMapper.selectById(teacherId);
        } catch (Exception e) {
            log.error("解析token失败", e);
            return null;
        }
    }
}
