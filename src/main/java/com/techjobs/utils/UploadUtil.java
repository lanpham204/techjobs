package com.techjobs.utils;
import jakarta.servlet.ServletContext;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class UploadUtil {
    private static final String UPLOAD_DIR = "src/main/resources/static/uploads";
    public static String save(MultipartFile file) {
        try {
            // Lưu trữ file tại thư mục upload
            String fileName = file.getOriginalFilename();
            Path path = Paths.get(UPLOAD_DIR, fileName);
            Files.createDirectories(path.getParent());
            Files.write(path, file.getBytes());

            return  fileName;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
