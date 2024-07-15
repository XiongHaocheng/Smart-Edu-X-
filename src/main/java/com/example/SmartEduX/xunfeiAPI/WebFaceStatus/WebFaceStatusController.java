package com.example.SmartEduX.xunfeiAPI.WebFaceStatus;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.example.SmartEduX.Mapper.TeacherMonitorMapper;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.BigCourse;
import com.example.SmartEduX.entity.TeacherMonitor;
import com.example.SmartEduX.util.*;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.example.SmartEduX.util.FileUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.core.type.TypeReference;

/**
 * 眼睛状态检测 WebAPI 接口调用示例
 * 运行前：请先填写Appid、APIKey、APISecret以及图片路径
 * 运行方法：直接运行 main() 即可
 * 结果： 控制台输出结果信息
 * 接口文档（必看）：https://www.xfyun.cn/doc/face/face_status/API.html
 * @author iflytek
 */
@Api(tags = "API接口")
@RestController
@RequestMapping("facestatus")
@CrossOrigin(origins = "*", maxAge = 3600)
public class WebFaceStatusController {
    @Autowired
    @Resource
    private TeacherMonitorMapper teacherMonitorMapper;
    @ApiOperation("检测状态")
    @CrossOrigin
    @PostMapping("/getfacestatus")
    public Result<Object> getFaceStatus(@RequestBody Map<String, String> requestBody) throws Exception {
        String base64Image = requestBody.get("base64Image");
        try {
            // 解码 Base64 字符串到字节数组
            byte[] imageBytes = Base64.getDecoder().decode(base64Image);
            // 将字节数组写入文件
            String fileName = "F:/代码部分/中软杯/Smart-Edu-X-前/src/assets/img/image.png"; //改成你们自己保存图片的路径
            Property.imagePath = fileName;
            try (FileOutputStream fos = new FileOutputStream(fileName)) {
                fos.write(imageBytes);
                fos.flush();
               System.out.println("保存成功");
            } catch (IOException e) {
                e.printStackTrace();
                System.out.println("保存失败");
            }
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            System.out.println("无效base64编码");
        }
        WebFaceStatusController demo = new WebFaceStatusController();
        ResponseData respData = demo.faceContrast(Property.imagePath);
        if (respData!=null && respData.getPayLoad().getAntiSpoofResult() != null) {
            String textBase64 = respData.getPayLoad().getAntiSpoofResult().getText();
            String text = new String(Base64.getDecoder().decode(textBase64));
            System.out.println("眼睛状态检测结果(text)base64解码后：");
            System.out.println(text);
            ObjectMapper objectMapper = new ObjectMapper();
            Map<String, Object> jsonMap = objectMapper.readValue(text, new TypeReference<Map<String, Object>>(){});

            return Result.success(jsonMap,"成功");
        }
        return Result.success("-1","失败");
    }
    @ApiOperation("更新闭眼睡觉次数")
    @CrossOrigin
    @GetMapping(value = "/updatesleepnums")
    public Result<?> updateSleepNums(@RequestParam Integer userid) {
        // 根据课程ID列表查询数据库中符合条件的课程数据
        Date currentDate = new Date();
            // 如果不存在记录，插入新记录
            TeacherMonitor newRecord = new TeacherMonitor();
            newRecord.setUserid(userid);
            newRecord.setTime(currentDate);
            newRecord.setType(1);
            teacherMonitorMapper.insert(newRecord);
        return Result.success("成功");
    }
    @ApiOperation("更新吃东西打哈欠次数")
    @CrossOrigin
    @GetMapping(value = "/updateeatnums")
    public Result<?> updateEatNums(@RequestParam Integer userid) {
        // 根据课程ID列表查询数据库中符合条件的课程数据
        Date currentDate = new Date();
        // 如果不存在记录，插入新记录
        TeacherMonitor newRecord = new TeacherMonitor();
        newRecord.setUserid(userid);
        newRecord.setTime(currentDate);
        newRecord.setType(2);
        teacherMonitorMapper.insert(newRecord);
        return Result.success("成功");
    }
    @ApiOperation("更新考试违规次数")
    @CrossOrigin
    @GetMapping(value = "/updatetestnums")
    public Result<?> updateTestNums(@RequestParam Integer userid) {
        // 根据课程ID列表查询数据库中符合条件的课程数据
        Date currentDate = new Date();
        // 如果不存在记录，插入新记录
        TeacherMonitor newRecord = new TeacherMonitor();
        newRecord.setUserid(userid);
        newRecord.setTime(currentDate);
        newRecord.setType(3);
        teacherMonitorMapper.insert(newRecord);
        return Result.success("成功");
    }
    class Property {
        public final static  String requestUrl =  "https://api.xf-yun.com/v1/private/s67c9c78c";
        public final static  String appid ="a0633869"; //请填写控制台获取的APPID,
        public final static  String apiSecret="Nzc1MTdkMDYwNzlkYWMxYThkMTFhMWE1";  //请填写控制台获取的APISecret;
        public final static  String apiKey = "3e4517f4ab3f8ef228cf18f99792a513";  //请填写控制台获取的APIKey
        static String imagePath="";  //请填写要检测的图片路径
        public final static  String serviceId= "s67c9c78c";
    }

    public String getXParam(String imageBase641, String imageEncoding1) {
        JsonObject jso = new JsonObject();

        /** header **/
        JsonObject header = new JsonObject();
        header.addProperty("app_id", Property.appid);
        header.addProperty("status", 3);

        jso.add("header", header);

        /** parameter **/
        JsonObject parameter = new JsonObject();
        JsonObject service = new JsonObject();
        service.addProperty("service_kind", "face_status");

        JsonObject faceCompareResult = new JsonObject();
        faceCompareResult.addProperty("encoding", "utf8");
        faceCompareResult.addProperty("format", "json");
        faceCompareResult.addProperty("compress", "raw");
        service.add("face_status_result", faceCompareResult);
        parameter.add(Property.serviceId, service);
        jso.add("parameter", parameter);

        /** payload **/
        JsonObject payload = new JsonObject();
        JsonObject inputImage1 = new JsonObject();
        inputImage1.addProperty("encoding", imageEncoding1);
        inputImage1.addProperty("image", imageBase641);
        payload.add("input1", inputImage1);

        System.out.println(jso.toString());
        jso.add("payload", payload);
        return jso.toString();
    }

    //读取image
    private byte[] readImage(String imagePath) throws IOException {
        InputStream is = new FileInputStream(imagePath);
        byte[] imageByteArray1 = FileUtil.read(imagePath);
        //return is.readAllBytes();
        return imageByteArray1;
    }

    public ResponseData faceContrast(String imageFirstUrl) throws Exception {

        String url = assembleRequestUrl(Property.requestUrl, Property.apiKey, Property.apiSecret);

        String imageBase641 = Base64.getEncoder().encodeToString(readImage(imageFirstUrl));
        String imageEncoding1 = imageFirstUrl.substring(imageFirstUrl.lastIndexOf(".") + 1);

        //System.out.println("url:"+url);
        return handleFaceContrastRes(url, getXParam(imageBase641, imageEncoding1));
    }

    public static final Gson json = new Gson();

    private ResponseData handleFaceContrastRes(String url, String bodyParam) {

        Map<String,String> headers = new HashMap<>();
        headers.put("Content-type", "application/json");
        String result = HttpUtil.doPost2(url, headers,bodyParam);
        if (result != null) {
            System.out.println("眼睛状态检测接口调用结果：" + result);
            return json.fromJson(result, ResponseData.class);
        } else {
            return null;
        }
    }


    //构建url
    public static String assembleRequestUrl(String requestUrl, String apiKey, String apiSecret) {
        URL url = null;
        // 替换调schema前缀 ，原因是URL库不支持解析包含ws,wss schema的url
        String  httpRequestUrl = requestUrl.replace("ws://", "http://").replace("wss://","https://" );
        try {
            url = new URL(httpRequestUrl);
            //获取当前日期并格式化
            SimpleDateFormat format = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss z", Locale.US);
            format.setTimeZone(TimeZone.getTimeZone("GMT"));
            String date = format.format(new Date());

            String host = url.getHost();
            if (url.getPort()!=80 && url.getPort() !=443){
                host = host +":"+String.valueOf(url.getPort());
            }
            StringBuilder builder = new StringBuilder("host: ").append(host).append("\n").//
                    append("date: ").append(date).append("\n").//
                    append("POST ").append(url.getPath()).append(" HTTP/1.1");
            Charset charset = Charset.forName("UTF-8");
            Mac mac = Mac.getInstance("hmacsha256");
            SecretKeySpec spec = new SecretKeySpec(apiSecret.getBytes(charset), "hmacsha256");
            mac.init(spec);
            byte[] hexDigits = mac.doFinal(builder.toString().getBytes(charset));
            String sha = Base64.getEncoder().encodeToString(hexDigits);

            String authorization = String.format("api_key=\"%s\", algorithm=\"%s\", headers=\"%s\", signature=\"%s\"", apiKey, "hmac-sha256", "host date request-line", sha);
            String authBase = Base64.getEncoder().encodeToString(authorization.getBytes(charset));
            return String.format("%s?authorization=%s&host=%s&date=%s", requestUrl, URLEncoder.encode(authBase), URLEncoder.encode(host), URLEncoder.encode(date));

        } catch (Exception e) {
            throw new RuntimeException("assemble requestUrl error:"+e.getMessage());
        }
    }

    public static class ResponseData {
        private Header header;
        private PayLoad payload;
        public Header getHeader() {
            return header;
        }
        public PayLoad getPayLoad() {
            return payload;
        }
    }
    public static class Header {
        private int code;
        private String message;
        private String sid;
        public int getCode() {
            return code;
        }
        public String getMessage() {
            return message;
        }
        public String getSid() {
            return sid;
        }
    }
    public static class PayLoad {
        private FaceResult face_status_result;
        public FaceResult getAntiSpoofResult() {
            return face_status_result;
        }
    }
    public static class FaceResult {
        private String compress;
        private String encoding;
        private String format;
        private String text;
        public String getCompress() {
            return compress;
        }
        public String getEncoding() {
            return encoding;
        }
        public String getFormat() {
            return format;
        }
        public String getText() {
            return text;
        }
    }
}
