package com.yueqi.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yueqi.common.FileUtils;

@RequestMapping("/file")
@Controller
public class FileController extends BaserController {

	@RequestMapping("/upload")
	@ResponseBody
	public String upload(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request)
			throws Exception {
		String savePath = request.getServletContext().getRealPath(FileUtils.ImageBasePath);
		String filename = file.getOriginalFilename();
		File temp = new File(savePath + filename);
		System.out.println(savePath + filename);
		if (temp.exists()) {
			file.transferTo(temp);
		} else {
			temp.mkdirs();
			file.transferTo(temp);
		}
		return "ok";
	}

}
