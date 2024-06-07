package com.example.SmartEduX.TextKeyWords;

import com.example.SmartEduX.common.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import okhttp3.*;
import okhttp3.RequestBody;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.web.bind.annotation.*;

import java.io.*;


@Api(tags = "API接口")
@RestController
@RequestMapping("keywords")
@CrossOrigin(origins = "*", maxAge = 3600)
public class ltp {

    public static final String API_KEY = "75GAhAmcUKr98XwCW1ggj0e7";
    public static final String SECRET_KEY = "0BsnUVsVEbAw5Vt7g6YopK2bCrR129vX";

    static final OkHttpClient HTTP_CLIENT = new OkHttpClient().newBuilder().build();

    @ApiOperation("关键词提取")
    @CrossOrigin
    @PostMapping("/audiokeywords")
    public Result<?> getAudioKeyords(@RequestParam String text) throws JSONException, IOException {
        MediaType mediaType = MediaType.parse("application/x-www-form-urlencoded");
        RequestBody body = RequestBody.create(mediaType, "{\"text\":[\"" + text + "\"],\"num\":4}");
        //RequestBody body = RequestBody.create(mediaType, "{\"text\":[\"讯飞开放平台作为开放的智能交互技术服务平台，致力于为开发者打造一站式智能人机交互解决方案\"],\"num\":4}");
        Request request = new Request.Builder()
                .url("https://aip.baidubce.com/rpc/2.0/nlp/v1/txt_keywords_extraction?access_token=" + getAccessToken())
                .method("POST", body)
                .addHeader("Content-Type", "application/x-www-form-urlencoded")
                .build();
        Response response = HTTP_CLIENT.newCall(request).execute();
        return Result.success(response.body().string(),"成功");
    }
    /**
     * 从用户的AK，SK生成鉴权签名（Access Token）
     *
     * @return 鉴权签名（Access Token）
     * @throws IOException IO异常
     */
    static String getAccessToken() throws IOException, JSONException {
        MediaType mediaType = MediaType.parse("application/x-www-form-urlencoded");
        RequestBody body = RequestBody.create(mediaType, "grant_type=client_credentials&client_id=" + API_KEY
                + "&client_secret=" + SECRET_KEY);
        Request request = new Request.Builder()
                .url("https://aip.baidubce.com/oauth/2.0/token")
                .method("POST", body)
                .addHeader("Content-Type", "application/x-www-form-urlencoded")
                .build();
        Response response = HTTP_CLIENT.newCall(request).execute();
        //System.out.println(response);
        return new JSONObject(response.body().string()).getString("access_token");
    }

}