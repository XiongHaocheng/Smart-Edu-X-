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
@TableName("studypathmodule")
public class StudyPathModule {
    @ApiModelProperty(value = "学习路径模块ID", required = true, example = "1")
    @TableId(type = IdType.AUTO)
    private Integer moduleid;
    @ApiModelProperty(value = "学习路径模块名称", example = "xhc")
    private String modulename;
    @ApiModelProperty(value = "学习路径模块描述", example = "xhc")
    private String moduledescription;
    @ApiModelProperty(value = "学习路径ID", example = "xhc")
    private Integer studypathid;
}
