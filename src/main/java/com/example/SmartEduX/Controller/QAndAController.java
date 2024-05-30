package com.example.SmartEduX.Controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.SmartEduX.BigModelNew.BigModelNew;
import com.example.SmartEduX.Mapper.QAndAMapper;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.QAndA;
import com.example.SmartEduX.iflytek.WebIATWS;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;


@Api(tags = "API接口")
@RestController
@RequestMapping("qanda")
@CrossOrigin(origins = "*", maxAge = 3600)
public class QAndAController {
    public static  String answer = "";
    public static  String audioResult = "";

    @Autowired
    @Resource
    private QAndAMapper qAndAMapper;
    @ApiOperation("获取对话框全部问答信息")
    @CrossOrigin
    @GetMapping(value = "/allqandainfo")
    public Result<List<QAndA>> getAllQAndAS(@RequestParam Integer dialogboxid) {
    QueryWrapper<QAndA> queryWrapper = new QueryWrapper<>();
    queryWrapper.eq("dialogboxid",dialogboxid);
    List<QAndA> qAndAS = qAndAMapper.selectList(queryWrapper);
    return Result.success(qAndAS,"成功");
    }
    @ApiOperation("添加新问题")
    @CrossOrigin
    @GetMapping(value = "/addnewquestion")
    public Result<List<QAndA>> addNewQuestion(@RequestParam Integer dialogboxid,@RequestParam String newQuestion) throws Exception {
        QAndA newquestion = new QAndA();
        BigModelNew.NewQuestion = newQuestion;
        BigModelNew.main(new String[]{});
        newquestion.setQuestioncontent(newQuestion);
        LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDateTime = now.format(formatter);
        newquestion.setTime(formattedDateTime);
        newquestion.setDialogboxid(dialogboxid);

        // 获取答案
        newquestion.setAnswercontent(answer);//AI的回答

        qAndAMapper.insert(newquestion);
        return Result.success("成功");
    }

    @ApiOperation("语音输入问题")
    @CrossOrigin
    @GetMapping(value = "/addaudioquestion")
    public Result<String> addAudioQuestion() throws Exception {
        audioResult = "" ;
        WebIATWS.main(new String[]{});
        //System.out.println("获得的最终结果" + audioResult);
        return Result.success(audioResult,"成功");
    }
}
