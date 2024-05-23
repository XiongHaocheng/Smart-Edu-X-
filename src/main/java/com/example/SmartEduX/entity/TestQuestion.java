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
@TableName("testquestion")
public class TestQuestion {
    @ApiModelProperty(value = "题目ID", required = true, example = "1")
    @TableId(type = IdType.AUTO)
    private Integer testquestionid;
    @ApiModelProperty(value = "题干内容", example = "xhc")
    private String questiontext;
    @ApiModelProperty(value = "题干图片", example = "xhc")
    private String questionimage;
    @ApiModelProperty(value = "题目类型", example = "选择题")
    private String questiontype;
    @ApiModelProperty(value = "单选选项", example = "sss")
    private String singlechoice;
    @ApiModelProperty(value = "多选选项", example = "sss")
    private String multiplechoice;
    @ApiModelProperty(value = "填空数量", example = "2")
    private String fillblankquantity;
    @ApiModelProperty(value = "单选答案", example = "2")
    private String singlechoiceanswer;
    @ApiModelProperty(value = "多选答案", example = "2")
    private String multiplechoiceanswer;
    @ApiModelProperty(value = "判断答案", example = "2")
    private String judgeanswer;
    @ApiModelProperty(value = "填空答案", example = "2")
    private String fillblankanswer;
    @ApiModelProperty(value = "解析", example = "2")
    private String analysis;

}

