package com.example.SmartEduX.xunfeiAPI.PDFrecognize;
import com.example.SmartEduX.common.Result;
import com.example.SmartEduX.entity.VideoCourse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.ibatis.annotations.Mapper;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.io.IOException;
@Mapper
@Api(tags = "API接口")
@RestController
@RequestMapping("extraterritorial")
public class PDFTextExtractor {
    @ApiOperation("解析pdf")
    @CrossOrigin
    @GetMapping("/getpdftext")
    public Result<String> getPDFText(@RequestParam String filename) {
        String pdfFilePath = "F:/代码部分/中软杯/SmartEduX-T/src/assets/" + filename;
        try (PDDocument document = PDDocument.load(new File(pdfFilePath))) {
            PDFTextStripper pdfStripper = new PDFTextStripper();

            // 设置开始页和结束页
            pdfStripper.setStartPage(1); // 从第一页开始
            pdfStripper.setEndPage(document.getNumberOfPages()); // 提取到最后一页

            String text = pdfStripper.getText(document);
            return Result.success(text,"成功");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return Result.error("-1","失败");
    }
}