package com.techjobs.controllers;

import com.techjobs.dtos.AppliedJobDTO;
import com.techjobs.dtos.InformationDTO;
import com.techjobs.models.AppliedJob;
import com.techjobs.models.Information;
import com.techjobs.services.interfaces.IAppliedJobService;
import com.techjobs.services.interfaces.IJobService;
import com.techjobs.services.interfaces.IUserService;
import com.techjobs.utils.CookieUtil;
import com.techjobs.utils.SendEmailUtil;
import com.techjobs.utils.UploadUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;


@Controller
@RequiredArgsConstructor
public class InformationController {
    private final IAppliedJobService appliedJobService;
    private final IJobService jobService;
    private final IUserService userService;
    private final CookieUtil cookieUtil;
    private final SendEmailUtil sendEmailUtil;
    @ModelAttribute("informationDTO")
    public InformationDTO newInformation() {
        return new InformationDTO();
    }
    @PostMapping("/informations/{jobId}")
    public String createInformation(Model model, @ModelAttribute AppliedJobDTO appliedJobDTO,
                                    @PathVariable int jobId, @RequestParam MultipartFile fileCV) {
        try {
            if (!fileCV.isEmpty()) {
                String cv = UploadUtil.save(fileCV);
                appliedJobDTO.setCv(cv);
            }
            int userId = Integer.parseInt(cookieUtil.get("id").getValue());
            appliedJobDTO.setUserId(userId);
            appliedJobDTO.setJobId(jobId);
            appliedJobDTO.setIsAccepted(0);
            appliedJobDTO.setTime(new Date());
            AppliedJob appliedJob = appliedJobService.create(appliedJobDTO);
            sendEmailUtil.sendHtmlEmail(appliedJob.getEmail(),"Cảm ơn bạn đã ứng tuyển vào "+
                    appliedJob.getJob().getCompany().getName()," <p>Chào , <strong>" +appliedJob.getFullname()+"</strong></p>"+
                    "<p>Hồ sơ của bạn đã được gửi đến Công ty <strong>"+appliedJob.getJob().getCompany().getName()+"</strong>. Nhà Tuyển Dụng sẽ xem xét và liên hệ với" +
                    " bạn trong thời gian sớm nhất trong trường hợp hồ sơ của bạn đáp ứng yêu cầu tuyển dụng. </p>" +
                    "<p>Nếu cần hỗ trợ thêm thông tin, vui lòng liên hệ qua email: <strong>"+appliedJob.getJob().getCompany().getEmail()+"</strong>.</p>" +
                    "<p>Chúc bạn sớm tìm được công việc phù hợp!\n</p>" +
                    "<p>Trân trọng,</p>" +
                    "<p>Phòng nhân sự <strong>"+appliedJob.getJob().getCompany().getName()+"</strong>.</p>");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/jobs";
    }
}
