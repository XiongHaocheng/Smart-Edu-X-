package com.example.SmartEduX.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ApiModel("数据库字段")
@TableName("testrecord")
public class TestRecord {

    @ApiModelProperty(value = "考试记录ID", required = true, example = "1")
    @TableId(type = IdType.AUTO)
    private Integer testrecordid;
    @ApiModelProperty(value = "考试得分", example = "0")
    private Float testscore;
    @ApiModelProperty(value = "完成状态", example = "true")
    private Boolean finishstate;
    @ApiModelProperty(value = "考试开始时间", example = "2024-5-22 12:00:00")
    private Date starttime;
    @ApiModelProperty(value = "用户id", example = "1")
    private Integer userid;
    @ApiModelProperty(value = "考试分析ID", example = "1")
    private Integer testanalyseid;
    @ApiModelProperty(value = "试卷ID", example = "1")
    private Integer testpaperid;
}
