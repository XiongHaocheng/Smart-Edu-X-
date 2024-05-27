package com.example.SmartEduX.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.handlers.JacksonTypeHandler;
import com.google.gson.JsonArray;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.ibatis.type.TypeHandler;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel("数据库字段")
@TableName("testrecord_question")
public class TestRecord_Question {
//    `TestQuestionID` int NOT NULL COMMENT '试题ID',
//            `TestRecordID` int NOT NULL COMMENT '记录ID',
//            `Score` int NOT NULL COMMENT '试题分数',
//            `SortNum` int NOT NULL COMMENT '试题序号',
//            `UserAnswer` json DEFAULT NULL COMMENT '用户答案',
//            `IsCorrect` tinyint(1) DEFAULT NULL COMMENT '正确情况',

    @ApiModelProperty(value = "试题ID", example = "0")
    private Integer testquestionid;
    @ApiModelProperty(value = "记录ID", example = "0")
    private Integer testrecordid;
    @ApiModelProperty(value = "试题分数", example = "0")
    private Integer score;
    @ApiModelProperty(value = "试题序号", example = "0")
    private Integer sortnum;
    @ApiModelProperty(value = "用户答案", example = "0")
    private String useranswer;
    @ApiModelProperty(value = "正确情况", example = "0")
    private Integer iscorrect;

}
