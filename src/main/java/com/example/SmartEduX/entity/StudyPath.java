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
@TableName("studypath")
public class StudyPath {
    @ApiModelProperty(value = "学习路径ID", required = true, example = "1")
    @TableId(type = IdType.AUTO)
    private Integer studypathid;
    @ApiModelProperty(value = "学习路径名称", example = "xhc")
    private String studypathname;
    @ApiModelProperty(value = "学习路径描述", example = "xhc")
    private String studypathdescription;
    @ApiModelProperty(value = "学习路径封面", example = "xhc")
    private String studypathcover;
    @ApiModelProperty(value = "学习路径分类", example = "xhc")
    private String studypathclassification;
    @ApiModelProperty(value = "课程数量", example = "xhc")
    private Integer coursenumber;
}
