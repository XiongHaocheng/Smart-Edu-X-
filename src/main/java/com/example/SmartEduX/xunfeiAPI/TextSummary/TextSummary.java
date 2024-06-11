package com.example.SmartEduX.xunfeiAPI.TextSummary;
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
@RequestMapping("textsummary")
@CrossOrigin(origins = "*", maxAge = 3600)
class TextSummary {
    public static final String API_KEY = "75GAhAmcUKr98XwCW1ggj0e7";
    public static final String SECRET_KEY = "0BsnUVsVEbAw5Vt7g6YopK2bCrR129vX";

    static final OkHttpClient HTTP_CLIENT = new OkHttpClient().newBuilder().build();

    @ApiOperation("内容总结")
    @CrossOrigin
    @PostMapping("/gettextsummary")
    public Result<?> getTextSummaryResult(@RequestParam String title,@RequestParam String text) throws JSONException, IOException {
        MediaType mediaType = MediaType.parse("application/json");
        RequestBody body = RequestBody.create(mediaType, "{\"content\":\"" + text + "\",\"max_summary_len\":200,\"title\":\"" + title + "\"}");
        Request request = new Request.Builder()
                .url("https://aip.baidubce.com/rpc/2.0/nlp/v1/news_summary?charset=UTF-8&access_token=" + getAccessToken())
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