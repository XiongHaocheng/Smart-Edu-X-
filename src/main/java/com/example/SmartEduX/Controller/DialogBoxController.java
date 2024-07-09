package com.example.SmartEduX.Controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.SmartEduX.Mapper.DialogBoxMapper;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.DialogBox;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Api(tags = "API接口")
@RestController
@RequestMapping("dialogbox")
@CrossOrigin(origins = "*", maxAge = 3600)
public class DialogBoxController {
    @Autowired
    @Resource
    private DialogBoxMapper dialogBoxMapper;
    @ApiOperation("获取全部对话框信息")
    @CrossOrigin
    @GetMapping(value = "/alldialogboxinfo")
    public Result<List<DialogBox>> getAllDialogBoxs(@RequestParam Integer userid) {
        QueryWrapper<DialogBox> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("userid", userid);
        List<DialogBox> dialogBoxs = dialogBoxMapper.selectList(queryWrapper);
        return Result.success(dialogBoxs,"成功");
    }

    @ApiOperation("添加新对话框")
    @CrossOrigin
    @PostMapping (value = "/adddialog")
    public Result<DialogBox> addDialogBox(@RequestParam Integer userid) {
        DialogBox newDialog = new DialogBox();
        newDialog.setUserid(userid);
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDateTime = now.format(formatter);
        newDialog.setCreatetime(formattedDateTime);
        newDialog.setDialogboxname("新建对话框");
        dialogBoxMapper.insert(newDialog);
        return Result.success(newDialog,"新建对话框成功");
    }
    @ApiOperation("删除对话框")
    @CrossOrigin
    @PostMapping (value = "/deletedialog")
    public Result<List<DialogBox>> deleteDialogBox(@RequestParam Integer dialogboxid) {
        // 创建查询条件
        QueryWrapper<DialogBox> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("dialogboxid", dialogboxid);

        // 删除记录
        int deleteCount = dialogBoxMapper.delete(queryWrapper);

        if (deleteCount > 0) {
            return Result.success("删除成功");
        } else {
            return Result.error("-1", "取消订阅失败或记录不存在");
        }
    }

    @ApiOperation("重命名对话框")
    @CrossOrigin
    @PostMapping (value = "/renamedialog")
    public Result<List<DialogBox>> deleteDialogBox(@RequestParam Integer dialogboxid,@RequestParam String dialogboxname) {

            // 创建查询条件
            QueryWrapper<DialogBox> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("dialogboxid", dialogboxid);
            // 创建更新对象
            DialogBox dialogBox = new DialogBox();
            dialogBox.setDialogboxname(dialogboxname);
            // 执行更新操作
            dialogBoxMapper.update(dialogBox, queryWrapper);
            return Result.success("成功");
    }

}
