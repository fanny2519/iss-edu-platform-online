package com.iss.edu.controller;

import com.iss.edu.common.ResultModel;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/upload")
public class UploadController {

    @Value("${upload.file.path}")
    private String filePath;


    @PostMapping("/uploadAvatar")
    @ResponseBody
    public ResultModel uploadAvatar(@RequestPart MultipartFile avatar) {
        String filename = System.currentTimeMillis() + ".jpg";
        try {
            avatar.transferTo(new File(filePath + filename));
        } catch (IOException e) {
            e.printStackTrace();
            return ResultModel.error("头像上传失败！");
        }
        return ResultModel.success("头像上传成功！", filename);
    }


    @PostMapping("/uploadMaterial")
    @ResponseBody
    public ResultModel uploadMaterial(MultipartFile material) {

        String originalFilename = material.getOriginalFilename(); // linux.txt
        String filename = System.currentTimeMillis() + originalFilename.substring(originalFilename.indexOf("."));  // 234567654323456.txt
        String path = filePath + filename;
        System.out.println(path);
        try {
            material.transferTo(new File(path));
        } catch (IOException e) {
            e.printStackTrace();
            return ResultModel.error("课程资料上传失败！");
        }
        Map<String, String> map = new HashMap<>();
        map.put("localname", filename);
        map.put("dbname", originalFilename);
        return ResultModel.success("课程资料上传成功！", map);
    }

    public static void main(String[] args) {
        String a = "abc.exe";
        System.out.println(a.substring(a.indexOf(".")));

    }
}
