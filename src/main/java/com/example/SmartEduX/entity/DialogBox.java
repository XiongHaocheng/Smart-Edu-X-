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
@TableName("dialogbox")
public class DialogBox {
    @ApiModelProperty(value = "对话框ID", required = true, example = "1")
    @TableId(type = IdType.AUTO)
    private Integer dialogboxid;
    @ApiModelProperty(value = "用户ID", example = "")
    private Integer userid;
    @ApiModelProperty(value = "创建时间", example = "")
    private String createtime;
    @ApiModelProperty(value = "对话框标题", example = "")
    private String dialogboxname;
}
