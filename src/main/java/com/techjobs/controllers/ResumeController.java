package com.techjobs.controllers;

import com.techjobs.dtos.UserDTO;
import com.techjobs.models.*;
import com.techjobs.services.interfaces.IJobService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpServletResponseWrapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class ResumeController {
    private final IJobService jobService;
    private final ServletContext servletContext;
    @GetMapping("/create-resume")
    public String viewIndex(Model model) {
//        model.addAttribute("resume", new Resume());
        Resume resume = Resume.builder()
                .address("")
                .email("")
                .jobName("")
                .phoneNumber("")
                .skill("")
                .fullname("")
                .educations(new ArrayList<>())
                .experiences(new ArrayList<>())
                .projects(new ArrayList<>())
                .achievements(new ArrayList<>())
                .build();
        resume.getEducations().add(new ResumeEducation());
        resume.getEducations().add(new ResumeEducation());
        resume.getExperiences().add(new ResumeExperience());
        resume.getExperiences().add(new ResumeExperience());
        resume.getProjects().add(new ResumeProject());
        resume.getProjects().add(new ResumeProject());
        resume.getAchievements().add(new ResumeAchievement());
        resume.getAchievements().add(new ResumeAchievement());
        model.addAttribute("resume",resume);
        return "/user/create-resume";
    }
//    ,@ModelAttribute ResumeEducation education
//            ,@ModelAttribute ResumeEducation education2,@ModelAttribute ResumeAchievement achievement,
//    @ModelAttribute ResumeAchievement achievement2,@ModelAttribute ResumeProject project
//            ,@ModelAttribute ResumeProject project2,@ModelAttribute ResumeExperience experience
//            ,@ModelAttribute ResumeExperience experience2
    @GetMapping("/viewCV")
    public String viewCV(Model model, @ModelAttribute Resume resume) {
        model.addAttribute(resume);

        return "cv";
    }
    @GetMapping("/exportPDF")
    public String exportPDF(Model model,HttpServletRequest request, HttpServletResponse response
            , @ModelAttribute Resume resume) throws IOException {
        model.addAttribute(resume);
        // Tạo request dispatcher để forward request tới trang JSP
        RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/viewCV");

        // Ghi nội dung HTML vào StringWriter
        StringWriter writer = new StringWriter();
        HttpServletResponseWrapper responseWrapper = new HttpServletResponseWrapper(response) {
            @Override
            public PrintWriter getWriter() {
                return new PrintWriter(writer);
            }
        };

        try {
            dispatcher.include(request, responseWrapper);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Lấy nội dung HTML từ StringWriter
        String htmlContent = writer.toString();

        // Chuyển đổi HTML thành PDF và gửi PDF tới client
        generatePDF(resume.getFullname(),htmlContent, response);
        return "redirect:/jobs";
    }

    private void generatePDF(String fullname,String htmlContent, HttpServletResponse response) throws IOException {
        // Thiết lập loại file trả về
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename="+fullname+".pdf");

        // Sử dụng iText để chuyển đổi HTML thành PDF

        com.itextpdf.html2pdf.HtmlConverter.convertToPdf(htmlContent, response.getOutputStream());
    }
}
