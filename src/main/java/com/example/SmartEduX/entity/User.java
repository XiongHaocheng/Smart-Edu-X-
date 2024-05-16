package com.example.SmartEduX.entity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel("数据库字段")
@TableName("user")
public class User {
    @ApiModelProperty(value = "用户ID", required = true, example = "1")
    @TableId(type = IdType.AUTO)
    private Integer userid;
    @ApiModelProperty(value = "用户名", example = "xhc")
    private String username;
    @ApiModelProperty(value = "用户密码", example = "zxc123")
    private String userpassword;
    @ApiModelProperty(value = "用户头像", example = "")
    private String useravatar;
    @ApiModelProperty(value = "用户手机号", example = "")
    private String userphone;
    @ApiModelProperty(value = "用户班级", example = "")
    private String userclass;
    @ApiModelProperty(value = "学习时长", example = "")
    private String userstudytime;
    @ApiModelProperty(value = "用户活跃度", example = "")
    private String useractivity;
    @ApiModelProperty(value = "用户得分", example = "")
    private Double userscore;
    @ApiModelProperty(value = "用户列", example = "")
    private String usercol;
    @ApiModelProperty(value = "令牌",  example = "")
    @TableField(exist = false)
    private String usertoken;
}
