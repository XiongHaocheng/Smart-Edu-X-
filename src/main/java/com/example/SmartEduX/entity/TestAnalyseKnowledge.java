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
@TableName("testanalyse_knowledge")
public class TestAnalyseKnowledge {
    @ApiModelProperty(value = "考试分析ID", required = true, example = "1")
    private Integer testanalyseid;
    @ApiModelProperty(value = "知识点ID", required = true, example = "1")
    private Integer knowledgeid;
    @ApiModelProperty(value = "包含知识点的个数", required = true, example = "1")
    private Integer containknowledgenum;
    @ApiModelProperty(value = "正确知识点的个数", required = true, example = "1")
    private Integer correctknowledgenum;

}
