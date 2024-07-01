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
@TableName("bigcourse_knowledge")
public class BigCourse_Knowledge {
    @ApiModelProperty(value = "课程ID", required = true, example = "1")
    @TableId(type = IdType.AUTO)
    private Integer bigcourseid;
    @ApiModelProperty(value = "知识点ID", required = true, example = "1")
    private Integer knowledgeid;
}
