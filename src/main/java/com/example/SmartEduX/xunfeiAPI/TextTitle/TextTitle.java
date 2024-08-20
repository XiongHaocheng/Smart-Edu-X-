package com.example.SmartEduX.xunfeiAPI.TextTitle;

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
@RequestMapping("texttitle")
@CrossOrigin(origins = "*", maxAge = 3600)
class TextTitle {
    public static final String API_KEY = "kWlyUenjSR8tdL0fxLD2ckZ4";
    public static final String SECRET_KEY = "Dx33YqmWPp362PWpGTOSpWCHJCk2VezH";

    static final OkHttpClient HTTP_CLIENT = new OkHttpClient().newBuilder().build();

    @ApiOperation("获取内容的标题")
    @CrossOrigin
    @PostMapping("/gettexttitle")
    public com.example.SmartEduX.common.Result<String> getTextTitleResult(@RequestParam String text) throws IOException, JSONException {
        MediaType mediaType = MediaType.parse("application/json");
        RequestBody body = RequestBody.create(mediaType, "{\"doc\":\"" + text + "\"}");
        Request request = new Request.Builder()
                .url("https://aip.baidubce.com/rpc/2.0/nlp/v1/titlepredictor?charset=UTF-8&access_token=" + getAccessToken())
                .method("POST", body)
                .addHeader("Content-Type", "application/json")
                .addHeader("Accept", "application/json")
                .build();
        Response response = HTTP_CLIENT.newCall(request).execute();
        return Result.success(response.body().string(),"成功");
    }
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
        return new JSONObject(response.body().string()).getString("access_token");
    }

}