package com.example.SmartEduX.entity;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Time;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel("数据库字段")
@TableName("videocourse")
public class VideoCourse {
    @ApiModelProperty(value = "视频课程ID", required = true, example = "1")
    @TableId(type = IdType.AUTO)
    private Integer videocourseid;
    @ApiModelProperty(value = "视频课程名称", example = "xhc")
    private String videocoursename;
    @ApiModelProperty(value = "视频排序", example = "xhc")
    private Integer videoorder;
    @ApiModelProperty(value = "视频链接", example = "xhc")
    private String playlink;
    @ApiModelProperty(value = "视频时长", example = "xhc")
    private Time duration;
    @ApiModelProperty(value = "课程ID", example = "xhc")
    private Integer courseid;
}
