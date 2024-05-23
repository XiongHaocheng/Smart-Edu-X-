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
@TableName("question_testpaper")
public class QuestionTestPaper {

    @ApiModelProperty(value = "试题ID", example = "1")
    private Integer testquestionid;
    @ApiModelProperty(value = "试卷ID", example = "1")
    private Integer testpaperid;
    @ApiModelProperty(value = "试题分数", example = "60")
    private Integer score;
    @ApiModelProperty(value = "题目排序", example = "10")
    private Integer sortnum;
}
