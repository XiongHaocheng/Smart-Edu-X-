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
@TableName("bigcourse_user")
public class BigCourse_User {
    @ApiModelProperty(value = "课程ID", required = true, example = "1")
    @TableId(type = IdType.AUTO)
    private Integer courseid;
    @ApiModelProperty(value = "用户ID", example = "xhc")
    private Integer userid;
}
