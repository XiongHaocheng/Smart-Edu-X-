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
@TableName("qanda")
public class QAndA {
    @ApiModelProperty(value = "问答ID", required = true, example = "1")
    @TableId(type = IdType.AUTO)
    private Integer qandaid;
    @ApiModelProperty(value = "问题内容", example = "")
    private String questioncontent;
    @ApiModelProperty(value = "答案内容", example = "")
    private String answercontent;
    @ApiModelProperty(value = "问答时间", example = "")
    private String time;
    @ApiModelProperty(value = "所属对话框", example = "")
    private Integer dialogboxid;
}
