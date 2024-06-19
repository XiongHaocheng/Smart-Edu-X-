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
@TableName("teachermonitor")
public class TeacherMonitor {
    @ApiModelProperty(value = "ID", required = true, example = "1")
    @TableId(type = IdType.AUTO)
    private Integer teachermonitorid;
    @ApiModelProperty(value = "时间", example = "2024-6-19")
    private String time;
    @ApiModelProperty(value = "次数", example = "1")
    private Integer nums;
    @ApiModelProperty(value = "类型", example = "xhc")
    private Integer type;
    @ApiModelProperty(value = "用户ID", example = "xhc")
    private Integer userid;
}
