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
@TableName("comment")
public class Comment {
    @ApiModelProperty(value = "评论ID", required = true, example = "1")
    @TableId(type = IdType.AUTO)
    private Integer commentid;
    @ApiModelProperty(value = "评论头像", example = "xhc")
    private String avatar;
    @ApiModelProperty(value = "评论昵称", example = "xhc")
    private String name;
    @ApiModelProperty(value = "评论时间", example = "xhc")
    private String commenttime;
    @ApiModelProperty(value = "评论内容", example = "xhc")
    private String commentcontent;
    @ApiModelProperty(value = "用户ID", example = "xhc")
    private Integer userid;
    @ApiModelProperty(value = "图文ID", example = "xhc")
    private Integer imageandtextid;
    @ApiModelProperty(value = "录播课ID", example = "xhc")
    private Integer videocourseid;
    @ApiModelProperty(value = "大课程ID", example = "xhc")
    private Integer courseid;
}
