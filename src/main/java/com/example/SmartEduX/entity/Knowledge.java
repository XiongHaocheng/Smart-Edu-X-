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
@TableName("knowledge")
public class Knowledge {
    @ApiModelProperty(value = "知识点ID", required = true, example = "1")
    @TableId(type = IdType.AUTO)
    private Integer knowledgeid;
    @ApiModelProperty(value = "知识点名称", example = "1")
    private String knowledgename;
    @ApiModelProperty(value = "知识点涉及领域", example = "xhc")
    private Integer knowledgedomain;

}
