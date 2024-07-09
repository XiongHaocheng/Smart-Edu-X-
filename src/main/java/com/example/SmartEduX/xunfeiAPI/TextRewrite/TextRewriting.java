package com.example.SmartEduX.xunfeiAPI.TextRewrite;

import com.google.gson.Gson;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

@Api(tags = "API接口")
@RestController
@RequestMapping("textrewrite")
@CrossOrigin(origins = "*", maxAge = 3600)
public class TextRewriting {
    private String requestUrl = "https://api.xf-yun.com/v1/private/se3acbe7f";
    private String APPID = "c54fc911";
    private String apiSecret = "YmI3YzI0Mzg2MmY0NWQzYmExNDYzM2Jj";
    private String apiKey = "21ad048e11ea0df413094aae1567bb4e";
    private String LEVEL = "<L4>";

    private static Gson gson = new Gson();

    @ApiOperation("改写音频识别结果")
    @CrossOrigin
    @PostMapping("/textrewrite")
    public com.example.SmartEduX.common.Result<String> getTextRewriteResult(@RequestParam String text) {
        String textToRewrite = text;
        TextRewriting demo = new TextRewriting();
        try {
            String resp = demo.doRequest(textToRewrite);
            //JSONObject tempJSONObject = JSON.parseObject(resp);
            //System.out.println("文本改写返回的结果：" + tempJSONObject);
            JsonParse myJsonParse = gson.fromJson(resp, JsonParse.class);
            String textBase64Decode = new String(Base64.getDecoder().decode(myJsonParse.payload.result.text), StandardCharsets.UTF_8);
            //System.out.println("text字段Base64解码后=>" + textBase64Decode);
            return com.example.SmartEduX.common.Result.success(textBase64Decode, "成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return com.example.SmartEduX.common.Result.error("-1", "失败");
    }

    public String doRequest(String text) throws Exception {
        URL realUrl = new URL(buildRequetUrl());
        URLConnection connection = realUrl.openConnection();
        HttpURLConnection httpURLConnection = (HttpURLConnection) connection;
        httpURLConnection.setDoInput(true);
        httpURLConnection.setDoOutput(true);
        httpURLConnection.setRequestMethod("POST");
        httpURLConnection.setRequestProperty("Content-type", "application/json");

        OutputStream out = httpURLConnection.getOutputStream();
        String params = buildParam(text);
        out.write(params.getBytes(StandardCharsets.UTF_8));
        out.flush();
        InputStream is;
        try {
            is = httpURLConnection.getInputStream();
        } catch (Exception e) {
            is = httpURLConnection.getErrorStream();
            throw new Exception("make request error:" + "code is " + httpURLConnection.getResponseMessage() + readAllBytes(is));
        }
        return readAllBytes(is);
    }

    public String buildRequetUrl() {
        URL url;
        String httpRequestUrl = requestUrl.replace("ws://", "http://").replace("wss://", "https://");
        try {
            url = new URL(httpRequestUrl);
            SimpleDateFormat format = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss z", Locale.US);
            format.setTimeZone(TimeZone.getTimeZone("GMT"));
            String date = format.format(new Date());
            String host = url.getHost();
            if (url.getPort() != 80 && url.getPort() != 443) {
                host = host + ":" + url.getPort();
            }
            String builder = "host: " + host + "\n" +
                    "date: " + date + "\n" +
                    "POST " + url.getPath() + " HTTP/1.1";
            Charset charset = StandardCharsets.UTF_8;
            Mac mac = Mac.getInstance("hmacsha256");
            SecretKeySpec spec = new SecretKeySpec(apiSecret.getBytes(charset), "hmacsha256");
            mac.init(spec);
            byte[] hexDigits = mac.doFinal(builder.getBytes(charset));
            String sha = Base64.getEncoder().encodeToString(hexDigits);

            String authorization = String.format("api_key=\"%s\", algorithm=\"%s\", headers=\"%s\", signature=\"%s\"", apiKey, "hmac-sha256", "host date request-line", sha);
            String authBase = Base64.getEncoder().encodeToString(authorization.getBytes(charset));
            return String.format("%s?authorization=%s&host=%s&date=%s", requestUrl, URLEncoder.encode(authBase), URLEncoder.encode(host), URLEncoder.encode(date));

        } catch (Exception e) {
            throw new RuntimeException("assemble requestUrl error:" + e.getMessage());
        }
    }

    private String buildParam(String text) throws UnsupportedEncodingException {
        String param = "{" +
                "    \"header\": {" +
                "        \"app_id\": \"" + APPID + "\"," +
                "        \"status\": 3" +
                "    }," +
                "    \"parameter\": {" +
                "        \"se3acbe7f\": {" +
                "            \"level\": \"" + LEVEL + "\"," +
                "            \"result\": {" +
                "                \"encoding\": \"utf8\"," +
                "                \"compress\": \"raw\"," +
                "                \"format\": \"json\"" +
                "            }" +
                "        }" +
                "    }," +
                "    \"payload\": {" +
                "        \"input1\": {" +
                "            \"encoding\": \"utf8\"," +
                "            \"compress\": \"raw\"," +
                "            \"format\": \"plain\"," +
                "            \"status\": 3," +
                "            \"text\": \"" + Base64.getEncoder().encodeToString(text.getBytes(StandardCharsets.UTF_8)) + "\"" +
                "        }" +
                "    }" +
                "}";
        return param;
    }

    private String readAllBytes(InputStream is) throws IOException {
        byte[] b = new byte[1024];
        StringBuilder sb = new StringBuilder();
        int len;
        while ((len = is.read(b)) != -1) {
            sb.append(new String(b, 0, len, StandardCharsets.UTF_8));
        }
        return sb.toString();
    }

    // JSON解析
    class JsonParse {
        public Header header;
        public Payload payload;
    }

    class Header {
        public int code;
        public String message;
        public String sid;
    }

    class Payload {
        public Result result;
    }

    class Result {
        public String compress;
        public String encoding;
        public String format;
        public String text;
    }
}
