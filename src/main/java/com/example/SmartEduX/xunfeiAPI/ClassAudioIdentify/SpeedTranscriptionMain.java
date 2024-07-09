package com.example.SmartEduX.xunfeiAPI.ClassAudioIdentify;
import com.example.SmartEduX.xunfeiAPI.ClassAudioIdentify.request.*;
import com.example.SmartEduX.xunfeiAPI.ClassAudioIdentify.util.*;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.example.SmartEduX.xunfeiAPI.ClassAudioIdentify.request.FileReq;
import com.example.SmartEduX.xunfeiAPI.ClassAudioIdentify.request.OpenReq;
import com.example.SmartEduX.xunfeiAPI.ClassAudioIdentify.util.FileCaller;
import com.example.SmartEduX.xunfeiAPI.ClassAudioIdentify.util.FileResp;
import com.example.SmartEduX.xunfeiAPI.ClassAudioIdentify.util.OpenCaller;
import com.example.SmartEduX.xunfeiAPI.ClassAudioIdentify.util.OpenResp;
import com.google.gson.Gson;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import okhttp3.*;
import org.apache.commons.io.IOUtils;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
@Api(tags = "API接口")
@RestController
@RequestMapping("audio")
@CrossOrigin(origins = "*", maxAge = 3600)
public class SpeedTranscriptionMain {
    // 控制台获取以下信息
    private static String APP_ID = "c54fc911";
    private static String API_SECRET = "YmI3YzI0Mzg2MmY0NWQzYmExNDYzM2Jj";
    private static String API_KEY = "21ad048e11ea0df413094aae1567bb4e";

    private static String FILE_URL_PREFIX = "https://upload-ost-api.xfyun.cn/file"; // 上传文件的地址开头

    private static String OPEN_URL_PREFIX = "https://ost-api.xfyun.cn/v2"; // 创建、查询任务的地址开头
    private static OkHttpClient client = new OkHttpClient.Builder().build();
    private static final Gson gson=new Gson();
    private static String AUDIO_PATH="F:/代码部分/中软杯/Smart-Edu-X-前/src/assets/audio/"; // 在此指定音频文件路径
    private static final int SLICE_SIZE = 15728640;// 15M，每块范围 5M~32M


    @ApiOperation("语音识别")
    @CrossOrigin
    @PostMapping("/audioidentify")
    public com.example.SmartEduX.common.Result<String> getAudioIdentify(@RequestParam String filename) throws IOException, InterruptedException {
        AUDIO_PATH="F:/代码部分/中软杯/Smart-Edu-X-前/src/assets/audio/";
        String index = filename;
        AUDIO_PATH += index;
        File audio = new File(AUDIO_PATH); // 需极速转写的音频文件
        FileInputStream fis = new FileInputStream(audio);
        FileCaller fileCaller = FileCaller.builder().apiKey(API_KEY).apiSecret(API_SECRET).client(client).ulrPrefix(FILE_URL_PREFIX).build();
        JSONObject jsonObjectUploadRespOrCompleteResp;
        /** 1. 上传音频文件 */
        if(audio.length()<31457280){
            /** 1.1 如果是小文件走单个上传接口，建议不大于30M */
            FileResp<FileResp.UploadData> uploadResp = fileCaller.fileUpload(FileReq.Upload.builder().
                    appId(APP_ID).
                    fileName("测试.wav").
                    requestId("20211213152023").
                    data(IOUtils.toByteArray(fis))
                    .build());
            //System.out.println("小文件上传返回的信息："+uploadResp);
            jsonObjectUploadRespOrCompleteResp=JSON.parseObject(JSON.toJSONString(uploadResp.getData()));
        }else{ // 如果是大文件走分块上传接口
            /** 1.2 如果是大文件走分块上传接口*/
            /** 1.2.1 初始化分块信息 */
            FileResp<FileResp.InitData> initResp = fileCaller.fileInit(FileReq.Init.builder().
                    requestId("20211213155434").
                    appId(APP_ID)
                    .build());
            JSONObject jsonObjectInitResp=JSON.parseObject(JSON.toJSONString(initResp.getData()));
            //System.out.println("初始化分块信息-返回的upload_id："+jsonObjectInitResp.get("upload_id"));
            /** 1.2.2 分块上传 */
            // 分片上传文件
            int len = 0;
            byte[] slice = new byte[SLICE_SIZE];
            int sliceIdIndex=1;
            while ((len = fis.read(slice)) > 0) {
                // 上传分片
                if (fis.available() == 0) {
                    slice = Arrays.copyOfRange(slice, 0, len);
                }
                FileResp<Void> partUploadResp = fileCaller.filePartUpload(FileReq.PartUpload.builder().
                        requestId("20211213152023").
                        appId(APP_ID).
                        uploadId(jsonObjectInitResp.get("upload_id").toString()). // 使用初始化分块信息返回的upload_id
                                sliceId(sliceIdIndex).
                        data(slice).
                        build());
                //System.out.println("第"+sliceIdIndex+"块分块上传-返回的信息："+partUploadResp);
                sliceIdIndex++;
            }
            /** 1.2.3 分块上传完成 */
            FileResp<Void> completeResp = fileCaller.fileUploadComplete(FileReq.Complete.builder().
                    appId(APP_ID).requestId("2021164834").
                    uploadId(jsonObjectInitResp.get("upload_id").toString()). // 使用初始化分块信息返回的upload_id
                            build());
            //System.out.println("分块上传完成-返回的信息："+completeResp);
            jsonObjectUploadRespOrCompleteResp=JSON.parseObject(JSON.toJSONString(completeResp.getData()));
        }

        /** 3. 创建任务 */
        OpenCaller openCaller = OpenCaller.builder().apiKey(API_KEY).apiSecret(API_SECRET).
                client(client).ulrPrefix(OPEN_URL_PREFIX).build();
        String requestId="20211213173212"; // 可以自定义
        OpenResp createResp = openCaller.create(OpenReq.Create.builder().
                common(OpenReq.Common.builder().appId(APP_ID).build()).
                business(OpenReq.Business.builder().
                        requestId(requestId).
                        // callbackUrl("http://IP:端口号/xxx").
                                accent("mandarin").
                        language("zh_cn").
                        domain("pro_ost_ed").
                        build()).
                data(OpenReq.Data.builder().audioUrl(jsonObjectUploadRespOrCompleteResp.get("url").toString()). // 上传文件或分块上传完成返回的url
                        encoding("raw").format("audio/L16;rate=16000").audioSrc("http").build()).
                build());
        //System.out.println("创建任务-返回的信息："+createResp);
        JSONObject jsonObjectCreateResp=JSON.parseObject(JSON.toJSONString(createResp.getData()));

        /** 4. 查询任务 */
        OpenResp queryResp = openCaller.query(OpenReq.Query.builder().
                common(OpenReq.Common.builder().appId(APP_ID).build()).
                business(OpenReq.QueryBusiness.builder().taskId(jsonObjectCreateResp.get("task_id").toString()).build()). // 创建任务返回的task_id
                        build());
        //System.out.println("查询任务-返回的信息："+queryResp);
        JSONObject jsonObjectQueryResp=JSON.parseObject(JSON.toJSONString(queryResp.getData()));
        while(true) {
            if (jsonObjectQueryResp.get("task_status").equals("5")) {
                //System.out.println("极速转写-最终结果==>：任务已取消..."); // 控制台打印取消信息
                break; // 跳出循环
            } else if (jsonObjectQueryResp.get("task_status").equals("3") || jsonObjectQueryResp.get("task_status").equals("4")) {
                // System.out.println("极速转写-最终结果==>：\n"+queryResp); // 控制台打印最终转写结果
                //System.out.println("极速转写-最终结果（更多字段请参考queryResp进行解析）==>：");
                JsonParse jsonParse = gson.fromJson(jsonObjectQueryResp.toJSONString(), JsonParse.class);
                List<Lattice> latticeList = jsonParse.result.lattice;
                StringBuilder resultBuilder = new StringBuilder(); // 定义一个 StringBuilder 对象
                for (int i = 0; i < latticeList.size(); i++) {
                    Lattice tempLattice = latticeList.get(i);
                    // String rl=tempLattice.json_1best.st.rl;
                    List<Rt> rtList = tempLattice.json_1best.st.rt;
                    for (int j = 0; j < rtList.size(); j++) {
                        Rt tempRt = rtList.get(j);
                        List<Ws> wsList = tempRt.ws;
                        for (int k = 0; k < wsList.size(); k++) {
                            Ws tempWs = wsList.get(k);
                            List<Cw> cwList = tempWs.cw;
                            for (int l = 0; l < cwList.size(); l++) {
                                Cw tempCw = cwList.get(l);
                                resultBuilder.append(tempCw.w); // 将每个 tempCw.w 添加到 StringBuilder 中
                            }
                        }
                    }
                }
                String result = resultBuilder.toString(); // 将 StringBuilder 转换为 String 对象
                //System.out.println("最终结果：" + result); // 打印最终结果
                return com.example.SmartEduX.common.Result.success(result,"成功");
            } else {
                Thread.sleep(2000); // 两秒查询一次
                // 再次查询任务
                queryResp = openCaller.query(OpenReq.Query.builder().
                        common(OpenReq.Common.builder().appId(APP_ID).build()).
                        business(OpenReq.QueryBusiness.builder().taskId(jsonObjectCreateResp.get("task_id").toString()).build()). // 创建任务返回的task_id
                                build());
                jsonObjectQueryResp = JSON.parseObject(JSON.toJSONString(queryResp.getData()));
                //System.out.println("极速转写-转写中...");
            }
        }

        return null;
    }

    /** 解析极速转写结果 */
    public class JsonParse{
        String task_id;
        String task_status;
        String task_type;
        String force_refresh;
        Result result;
    }
    class Result{
        List<Lattice> lattice;
    }
    class Lattice{
        Json_1best json_1best;
    }
    class Json_1best{
        St st;
    }
    class St{
        List<Rt> rt;
        String rl;
    }
    class Rt{
        List<Ws> ws;
    }
    class Ws{
        List<Cw> cw;
    }
    class Cw{
        String w;
    }
}
