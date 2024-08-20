package com.example.SmartEduX.xunfeiAPI.TextLegal;

import com.example.SmartEduX.Utils.MyUtil;
import com.example.SmartEduX.common.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * 1、文本内容合规审核接口
 * 2、appid与secret信息请在控制台获取 https://console.xfyun.cn/services/text_audit
 */
@Api(tags = "API接口")
@RestController
@RequestMapping("text")
@CrossOrigin(origins = "*", maxAge = 3600)
public class TextMain {
    @ApiOperation("文本合规检测")
    @CrossOrigin
    @PostMapping( "/textislegal")
    public Result<String> textIsLeagl(@RequestParam Map<String, Object> requestBody) throws Exception {

        String textInput = (String) requestBody.get("requestBody");
        String url = "https://audit.iflyaisol.com//audit/v2/syncText";
        String APPID = Constants.APPID;
        String APISecret = Constants.APISecret;
        String APIKey = Constants.APIKey;
        String content = textInput;// 送检文本

        // 词库指定
        final String lib_ids_1 = "d37742d5f4884fa991c350f476bd532d"; // 根据自己创建获取词库ID  黑名单
        final String lib_ids_2 = "639c6b0ed7a147a6a7dc9d5c7b4c4333"; // 根据自己创建获取词库ID  白名单
        /**
         * 业务参数
         * --- 如果需要使用黑白名单资源，放开lib_ids与categories参数
         * */
        String json = "{\n" +
                "  \"is_match_all\": 1,\n" +
                "  \"content\": \"" + content + "\",\n" + // 放开lib_ids与categories参数，注意在content后面加逗号使之成为合法json
                "  \"lib_ids\": [\n" +
                "    \"" + lib_ids_1 + "\",\n" +
                "    \"" + lib_ids_2 + "\"\n" +
                "  ],\n" +
                "  \"categories\": [\n" +
                "    \"pornDetection\",\n" +
                "    \"violentTerrorism\",\n" +
                "    \"political\",\n" +
                "    \"lowQualityIrrigation\",\n" +
                "    \"contraband\",\n" +
                "    \"advertisement\",\n" +
                "    \"uncivilizedLanguage\"\n" +
                "  ]\n" +
                "}";
        // 获取鉴权
        Map<String, String> urlParams = MyUtil.getAuth(APPID, APIKey, APISecret);
        // 发起请求
        String returnResult = MyUtil.doPostJson(url, urlParams, json);
        //System.out.println("文本合规返回结果：\n" + returnResult);
        return Result.success(returnResult,"成功");
    }
}
