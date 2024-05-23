package com.example.SmartEduX.Controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.SmartEduX.Mapper.ImageAndTextMapper;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.BigCourse;
import com.example.SmartEduX.entity.ImageAndText;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Api(tags = "API接口")
@RestController
@RequestMapping("imageandtext")
@CrossOrigin(origins = "*", maxAge = 3600)
public class ImageAndTextController {
    @Autowired
    @Resource
    private ImageAndTextMapper imageAndTextMapper;

    @ApiOperation("获取图文信息")
    @CrossOrigin
    @GetMapping(value = "/imageandtextinfo")
    public Result<List<ImageAndText>> getAllimageandtexts() {

        List<ImageAndText> imageAndText = imageAndTextMapper.selectList(null);
        if (imageAndText.isEmpty()) {

            return Result.error("-1", "未找到任何图文数据");
        }

        return Result.success(imageAndText,"成功");
    }

    @ApiOperation("获取各领域图文")
    @CrossOrigin
    @GetMapping(value = "/topicinfo")
    public Result<List<ImageAndText>> getHotTopic(@RequestParam String currentNavItem){
        // 根据 currentNavItem 的值进行数据库查询
        List<ImageAndText> topic = new ArrayList<>();
        if (currentNavItem.equals("全部")) {
            topic = imageAndTextMapper.selectList(null);
        } else {
            // 如果 currentNavItem 为其它，则查询其它课程
            QueryWrapper<ImageAndText> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("contentdomain", currentNavItem);
            topic = imageAndTextMapper.selectList(queryWrapper);
        }
        // 根据其他条件查询其他类型的课程
        return Result.success(topic,"成功");
    }

    @ApiOperation("增加阅读人数")
    @CrossOrigin
    @RequestMapping(value = "/addviewnumber", method = RequestMethod.POST)
    public Result<?> addViewNumber(@RequestBody Integer id) {
// 通过ID从数据库中查找对应的数据
        ImageAndText imageAndText = imageAndTextMapper.selectById(id);
        if (imageAndText != null) {
            // 找到了对应的数据，将其阅读人数加1
            imageAndText.setViewnumber(imageAndText.getViewnumber() + 1);
            // 更新数据库中的数据
            int updated = imageAndTextMapper.updateById(imageAndText);
            if (updated > 0) {
                return Result.success("阅读人数增加成功");
            } else {
                return Result.error("-1", "更新阅读人数失败");
            }
        } else {
            // 没有找到对应的数据，返回错误信息
            return Result.error("-2", "未找到对应的图文数据");
        }
    }
}