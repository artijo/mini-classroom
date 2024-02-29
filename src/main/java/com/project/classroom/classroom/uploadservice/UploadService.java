package com.project.classroom.classroom.uploadservice;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.web.multipart.MultipartFile;


public class UploadService {

//	private  String pathStatic
	
	@Value("${pathStatic}")
    private String path = "D:" + File.separator + "java" + File.separator + "project" + File.separator +"classroom"+ File.separator +
    "src" + File.separator + "main" + File.separator + "resources" + File.separator + "static" + File.separator + "file";

    
    public String upload(MultipartFile file) {
        try {
            String originalFilename = file.getOriginalFilename();
            String uniqueFileName = System.currentTimeMillis() + "&" + originalFilename;
            File directory = new File(path);
            if (!directory.exists()) {
                directory.mkdirs();
            }
            file.transferTo(new File(directory, uniqueFileName));
            return uniqueFileName;
        } catch (IOException e) {
            e.printStackTrace(); 
            return "";
        }
    }

}
