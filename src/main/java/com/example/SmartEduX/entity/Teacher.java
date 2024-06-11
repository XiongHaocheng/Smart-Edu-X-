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
@TableName("teacher")
public class Teacher {
    @ApiModelProperty(value = "教师ID", required = true, example = "1")
    @TableId(type = IdType.AUTO)
    private Integer teacherid;
    @ApiModelProperty(value = "教师名", example = "xhc")
    private String teachername;
    @ApiModelProperty(value = "教师密码", example = "zxc123")
    private String teacherpassword;
    @ApiModelProperty(value = "教师手机号", example = "")
    private String teacherphone;
    @ApiModelProperty(value = "令牌",  example = "")
    @TableField(exist = false)
    private String teachertoken;
}
