package com.example.SmartEduX.entity;

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
@TableName("question_knowledge")
public class QuestionKnowledge {
    @ApiModelProperty(value = "知识点ID", required = true, example = "1")
    private Integer knowledgeid;
    @ApiModelProperty(value = "题目ID", example = "1")
    private Integer testquestionid;
}
