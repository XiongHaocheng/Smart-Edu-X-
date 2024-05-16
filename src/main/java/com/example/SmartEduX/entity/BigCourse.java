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
@TableName("bigcourse")
public class BigCourse {
    @ApiModelProperty(value = "大课程ID", required = true, example = "1")
    @TableId(type = IdType.AUTO)
    private Integer courseid;
    @ApiModelProperty(value = "大课程名称", example = "xhc")
    private String coursename;
    @ApiModelProperty(value = "大课程描述", example = "xhc")
    private String coursedescription;
    @ApiModelProperty(value = "大课程封面", example = "xhc")
    private String coursecover;
    @ApiModelProperty(value = "大课程涉及领域", example = "xhc")
    private String coursedomain;
    @ApiModelProperty(value = "大课程详细图片", example = "xhc")
    private String courseimage;
    @ApiModelProperty(value = "大章节ID", example = "xhc")
    private String majorchapters;
    @ApiModelProperty(value = "学习路径ID", example = "xhc")
    private Integer studypathid;
    @ApiModelProperty(value = "试卷ID", example = "xhc")
    private Integer testpaperid;
}
