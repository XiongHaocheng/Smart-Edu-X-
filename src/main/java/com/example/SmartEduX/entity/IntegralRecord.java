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
@TableName("integralrecord")
public class IntegralRecord {
    @ApiModelProperty(value = "ID", required = true, example = "1")
    @TableId(type = IdType.AUTO)
    private Integer integralid;
    @ApiModelProperty(value = "获得积分", example = "1")
    private Integer score;
    @ApiModelProperty(value = "来源", example = "xhc")
    private String source;
    @ApiModelProperty(value = "用户ID", example = "1")
    private Integer userid;
    @ApiModelProperty(value = "时间", example = "xhc")
    private Date date;
}
