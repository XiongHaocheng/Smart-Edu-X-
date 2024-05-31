package com.example.SmartEduX.entity;

import com.baomidou.mybatisplus.annotation.IdType;
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
@TableName("userstudycourse")
public class UserStudyCourse {
    @ApiModelProperty(value = "用户ID", example = "xhc")
    private Integer userid;
    @ApiModelProperty(value = "大课程ID", example = "xhc")
    private Integer bigcourseid;
    @ApiModelProperty(value = "学习时长", example = "xhc")
    private Double studytime;
}
