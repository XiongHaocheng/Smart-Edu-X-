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
@TableName("testpaper")
public class TestPaper {

    @ApiModelProperty(value = "试卷ID", required = true, example = "1")
    @TableId(type = IdType.AUTO)
    private Integer testpaperid;
    @ApiModelProperty(value = "试卷名称", example = "xhc")
    private String testpapername;
    @ApiModelProperty(value = "试卷满分", example = "100")
    private Integer fullscore;
    @ApiModelProperty(value = "试卷及格分", example = "60")
    private Integer passscore;
    @ApiModelProperty(value = "题目数量", example = "10")
    private Integer questionnumber;
    @ApiModelProperty(value = "持续时间", example = "10")
    private Integer duration;

}
