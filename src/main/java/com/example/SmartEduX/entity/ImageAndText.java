package com.example.SmartEduX.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
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
@TableName("imageandtext")
public class ImageAndText {
    @ApiModelProperty(value = "图文ID", required = true, example = "1")
    @TableId(type = IdType.AUTO)
    private Integer imageandtextid;
    @ApiModelProperty(value = "阅读人数", example = "1")
    private Integer viewnumber;
    @ApiModelProperty(value = "点赞人数", example = "xhc")
    private Integer likenumber;
    @ApiModelProperty(value = "图文标题", example = "xhc")
    private String title;
    @ApiModelProperty(value = "涉及领域", example = "xhc")
    private String contentdomain;
    @ApiModelProperty(value = "覆盖图片", example = "xhc")
    private String coverimage;
    @ApiModelProperty(value = "文章内容", example = "xhc")
    private String articlecontent;
    @ApiModelProperty(value = "发布时间", example = "xhc")
    private Date releasetime;
}
