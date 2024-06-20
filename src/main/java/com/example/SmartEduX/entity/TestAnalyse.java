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
@TableName("testanalyse")
public class TestAnalyse {
    @ApiModelProperty(value = "考试分析ID",example = "1")
    @TableId(type = IdType.AUTO)
    private Integer testanalyseid;
    @ApiModelProperty(value = "考试分析ID", example = "1")
    private Integer questionnumber;
    @ApiModelProperty(value = "正确数量",example = "1")
    private Integer correctquantity;
    @ApiModelProperty(value = "正确率", example = "1")
    private Float accuracy;
    @ApiModelProperty(value = "正确率建议", example = "1")
    private String accuracyproposal;
    @ApiModelProperty(value = "知识点建议", example = "1")
    private String knowledgemasterproposal;
    @ApiModelProperty(value = "推荐课程", example = "1")
    private String recommendcourse;
    @ApiModelProperty(value = "考试记录ID", required = true, example = "1")
    private Integer testrecordid;
    @ApiModelProperty(value = "用户ID", required = true, example = "1")
    private Integer userid;
}
