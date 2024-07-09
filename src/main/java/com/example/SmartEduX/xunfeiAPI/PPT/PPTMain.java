package com.example.SmartEduX.xunfeiAPI.PPT;

import com.alibaba.fastjson.JSON;
import com.example.SmartEduX.common.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
@Mapper
@Api(tags = "API接口")
@RestController
@RequestMapping("PPTAPI")
public class PPTMain {
    @ApiOperation("大纲和PPT生成")
    @CrossOrigin
    @GetMapping("/getoutlineandppt")
    public Result<OutlineAndProgress> getOutlineAndPPT(@RequestParam String text, @RequestParam String theme, @RequestParam String username) throws IOException, InterruptedException {
        // 输入个人appId
        String appId = "df05880c";
        String secret = "MmMwOTQxODU3OGExMjE1NTUxZGU2NjFm";
        long timestamp = System.currentTimeMillis()/1000;
        String ts = String.valueOf(timestamp);
        // 获得鉴权信息
        ApiAuthAlgorithm auth = new ApiAuthAlgorithm();
        String signature = auth.getSignature(appId, secret, timestamp);
        //System.out.println(signature);

        // 建立链接
        ApiClient client = new ApiClient("https://zwapi.xfyun.cn");
        // 大纲生成
        String outlineQuery =  text;
        String outlineResp = client.createOutline(appId, ts, signature,outlineQuery);
        //System.out.println(outlineResp);
        CreateResponse outlineResponse = JSON.parseObject(outlineResp, CreateResponse.class);
        System.out.println("生成的大纲如下：");
        //System.out.println(outlineResponse.getData().getOutline());
        // 基于大纲生成ppt
        String pptResp = client.createPptByOutline(appId, ts, signature, outlineQuery, outlineResponse.getData().getOutline(),theme,username);
        System.out.println(pptResp);
        CreateResponse pptResponse = JSON.parseObject(pptResp, CreateResponse.class);
        // 利用sid查询PPT生成进度
        int progress = 0;
        ProgressResponse progressResponse = null;
        while (progress < 100) {
            String progressResult = client.checkProgress(appId, ts, signature, pptResponse.getData().getSid());
            progressResponse = JSON.parseObject(progressResult, ProgressResponse.class);
            progress = progressResponse.getData().getProcess();
            //System.out.println(progressResult);

            if (progress < 100) {
                Thread.sleep(5000); // 暂停2秒
            }
        }
        // 创建包含大纲和进度结果的对象
        OutlineAndProgress resultData = new OutlineAndProgress(outlineResponse.getData().getOutline(), progressResponse);
        return Result.success(resultData, "成功");
    }
    public class OutlineAndProgress {
        private String outline;
        private ProgressResponse progress;

        public OutlineAndProgress(String outline, ProgressResponse progress) {
            this.outline = outline;
            this.progress = progress;
        }

        public String getOutline() {
            return outline;
        }

        public void setOutline(String outline) {
            this.outline = outline;
        }

        public ProgressResponse getProgress() {
            return progress;
        }

        public void setProgress(ProgressResponse progress) {
            this.progress = progress;
        }
    }

    @ApiOperation("PPT生成")
    @CrossOrigin
    @GetMapping("/getppt")
    public Result<?> getPPT(@RequestParam String text,@RequestParam String theme,@RequestParam String username) throws IOException, InterruptedException {
        // 输入个人appId
        String appId = "df05880c";
        String secret = "MmMwOTQxODU3OGExMjE1NTUxZGU2NjFm";
        long timestamp = System.currentTimeMillis() / 1000;
        String ts = String.valueOf(timestamp);
        // 获得鉴权信息
        ApiAuthAlgorithm auth = new ApiAuthAlgorithm();
        String signature = auth.getSignature(appId, secret, timestamp);
        //System.out.println(signature);

        // 建立链接
        ApiClient client = new ApiClient("https://zwapi.xfyun.cn");
        // 发送生成PPT请求
        String query = text;
        String resp = client.createPPT(appId, ts, signature, query, theme, username);
        System.out.println(resp);
        CreateResponse response = JSON.parseObject(resp, CreateResponse.class);
        // 利用sid查询PPT生成进度
        int progress = 0;
        ProgressResponse progressResponse;
        String progressResult = null;
        while (progress < 100) {
            progressResult = client.checkProgress(appId, ts, signature, response.getData().getSid());
            progressResponse = JSON.parseObject(progressResult, ProgressResponse.class);
            progress = progressResponse.getData().getProcess();
            System.out.println(progressResult);

            if (progress < 100) {
                Thread.sleep(5000); // 暂停2秒
            }
        }
        return Result.success(progressResult, "成功");
    }

    @ApiOperation("大纲生成")
    @CrossOrigin
    @GetMapping("/getoutline")
    public Result<String> getOutline(@RequestParam String text) throws IOException{
        // 输入个人appId
        String appId = "df05880c";
        String secret = "MmMwOTQxODU3OGExMjE1NTUxZGU2NjFm";
        long timestamp = System.currentTimeMillis()/1000;
        String ts = String.valueOf(timestamp);
        // 获得鉴权信息
        ApiAuthAlgorithm auth = new ApiAuthAlgorithm();
        String signature = auth.getSignature(appId, secret, timestamp);
        //System.out.println(signature);
        // 建立链接
        ApiClient client = new ApiClient("https://zwapi.xfyun.cn");
        // 大纲生成
        String outlineQuery =  text;
        String outlineResp = client.createOutline(appId, ts, signature,outlineQuery);
        //System.out.println(outlineResp);
        CreateResponse outlineResponse = JSON.parseObject(outlineResp, CreateResponse.class);
        //System.out.println("生成的大纲如下：");
        //System.out.println(outlineResponse.getData().getOutline());
        return Result.success(outlineResponse.getData().getOutline(), "成功");
    }
}