package com.techjobs.controllers;

import com.techjobs.dtos.AppliedJobDTO;
import com.techjobs.exceptions.DataNotFoundException;
import com.techjobs.models.AppliedJob;
import com.techjobs.services.interfaces.IAppliedJobService;
import com.techjobs.utils.SendEmailUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class AppliedJobAdminController {
    private final IAppliedJobService appliedJobService;
    private final SendEmailUtil emailUtil;
    @GetMapping("/admin/applied-job/{jobId}")
    public String getAppliedJobByJobId(Model model, @PathVariable int jobId
    ,@RequestParam(defaultValue = "0",required = false) int page,
    @RequestParam(defaultValue = "10",required = false) int size) {
        try {
            PageRequest pageRequest = PageRequest.of(page,size);
            Page<AppliedJob> appliedJobsPage= appliedJobService.getAllByJobId(jobId,pageRequest);
            List<AppliedJob> appliedJobs = new ArrayList<>();
            List<AppliedJob> content = appliedJobsPage.getContent();
            content.forEach(appliedJob -> {
                if (appliedJob.getIsAccepted() == 0) {
                    appliedJobs.add(appliedJob);
                }
            });
            model.addAttribute("hrefPage","/admin/applied-job");
            model.addAttribute("active","notAccept");
            model.addAttribute("jobId",jobId);
            model.addAttribute("totalPages",appliedJobsPage.getTotalPages());
            model.addAttribute("currentPage",page);
            model.addAttribute("appliedJobs",appliedJobs);
        } catch (DataNotFoundException e) {
            throw new RuntimeException(e);
        }
        return "/admin/appliedJob";
    }
    @GetMapping("/admin/applied-job/accepted/{jobId}")
    public String getAppliedJobAcceptedByJobId(Model model, @PathVariable int jobId
            ,@RequestParam(defaultValue = "0",required = false) int page,
                                       @RequestParam(defaultValue = "10",required = false) int size) {
        try {
            PageRequest pageRequest = PageRequest.of(page,size);
            Page<AppliedJob> appliedJobsPage= appliedJobService.getAllByJobId(jobId,pageRequest);
            List<AppliedJob> appliedJobs = new ArrayList<>();
            List<AppliedJob> content = appliedJobsPage.getContent();
            content.forEach(appliedJob -> {
                if (appliedJob.getIsAccepted() == 1) {
                    appliedJobs.add(appliedJob);
                }
            });
            model.addAttribute("hrefPage","/admin/applied-job/accepted");
            model.addAttribute("active","accepted");
            model.addAttribute("jobId",jobId);
            model.addAttribute("totalPages",appliedJobsPage.getTotalPages());
            model.addAttribute("currentPage",page);
            model.addAttribute("appliedJobs",appliedJobs);
        } catch (DataNotFoundException e) {
            throw new RuntimeException(e);
        }
        return "/admin/appliedJob";
    }
    @PostMapping("/admin/applied-job/accept/{appliedJobId}")
    public String acceptAndSendEmailToCandidate(@PathVariable int appliedJobId,
                                                @RequestParam String addressCompany,
                                                @RequestParam String date,
                                                @RequestParam int hour,
                                                @RequestParam(defaultValue = "00") int minute) {
        try {
//            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            AppliedJob appliedJob = appliedJobService.getById(appliedJobId);
            AppliedJobDTO appliedJobDTO = AppliedJobDTO.builder()
                    .userId(appliedJob.getUser().getId())
                    .jobId(appliedJob.getJob().getId())
                    .time(appliedJob.getTime())
                    .isAccepted(1).build();
            appliedJobService.update(appliedJobDTO,appliedJobId);
            emailUtil.sendHtmlEmail(appliedJob.getEmail(),"Thư mời phỏng vấn tại công ty "+appliedJob.getJob().getCompany().getName(),
                    "<p>Chào bạn <strong>"+appliedJob.getFullname()+"</strong>,</p>\n" +
                    "\n" +
                    "<p>Lời đầu tiên, chúng tôi xin cảm ơn bạn vì đã quan tâm đến vị trí ứng tuyển của công ty <strong>"+appliedJob.getJob().getCompany().getName()+"</strong>. \n" +
                    "Thông qua hồ sơ mà bạn đã gửi về, chúng tôi nhận thấy bạn có kiến thức chuyên môn phù hợp với vị trí mà chúng tôi đang tuyển.</p>\n" +
                    "\n" +
                    "<p>Chúng tôi trân trọng kính mời bạn đến tham gia buổi phỏng vấn của công ty chúng tôi tại:</p>\n" +
                    "<ul>\n" +
                    "\t<li>Thời gian: <strong>"+date+"</strong>, <strong>"+hour+":"+minute+"</strong></li>\n" +
                    "\t<li>Địa điểm: <strong>"+addressCompany+"</strong></li>\n" +
                    "</ul>\n" +
                    "<p>Để buổi phỏng vấn được diễn ra thuận lợi, bạn vui lòng phản hồi lại email này trong 24h kể từ khi nhận được.\n" +
                    " Mọi thắc mắc khác, bạn vui lòng liên hệ với chúng tôi qua: <strong>"+appliedJob.getJob().getCompany().getPhoneNumber()+" - "+appliedJob.getJob().getCompany().getEmail()+"</strong></p>\n" +
                    "<p><strong>"+appliedJob.getJob().getCompany().getName()+"</strong> chúc bạn sẽ có một buổi phỏng vấn thành công.</p>\n" +
                    "<p>Trân trọng,</p>\n" +
                    "<p>Công ty <strong>"+appliedJob.getJob().getCompany().getName()+"</strong></p>");
            return "redirect:/admin/applied-job/"+appliedJob.getJob().getId();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }
    @PostMapping("/admin/applied-job/accepted/{appliedJobId}")
    public String SendEmailToCandidate(@PathVariable int appliedJobId,
                                                @RequestParam String addressCompany,
                                                @RequestParam String nameJob,
                                                @RequestParam String startDate,
                                                @RequestParam String replyDate) {
        try {
//            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            AppliedJob appliedJob = appliedJobService.getById(appliedJobId);
            AppliedJobDTO appliedJobDTO = AppliedJobDTO.builder()
                    .userId(appliedJob.getUser().getId())
                    .jobId(appliedJob.getJob().getId())
                    .time(appliedJob.getTime())
                    .isAccepted(2).build();
            appliedJobService.update(appliedJobDTO,appliedJobId);
            emailUtil.sendHtmlEmail(appliedJob.getEmail(),appliedJob.getJob().getName()+" - Thư mời làm việc","<p>Bạn <strong>"+appliedJob.getFullname()+"</strong> thân mến,</p>\n" +
                    "<p>\n" +
                    "    Lời đầu tiên, chúng tôi vô cùng cảm ơn vì bạn đã quan tâm và dành thời gian ứng tuyển vị trí <strong>"+nameJob+"</strong> tại công ty chúng tôi.\n" +
                    "     Thông qua buổi phỏng vấn cũng như trao đổi, chúng tôi đánh giá cao kinh nghiệm và kỹ năng của bạn.\n" +
                    "</p>\n" +
                    "<p>Bởi vậy, chúng tôi xin trân trọng mời bạn gia nhập vào đội ngũ công ty <strong>"+appliedJob.getJob().getCompany().getName()+"</strong>,\n" +
                    "    với vị trí <strong>"+nameJob+"</strong>. Bạn vui lòng bắt đầu đến nhận việc vào <strong>"+startDate+"</strong>, \n" +
                    "    từ <strong>8h30 - 17h30</strong>, tại <strong>"+addressCompany+"</strong>.\n" +
                    "</p>\n" +
                    "<p>\n" +
                    "    Kèm theo các chính sách hỗ trợ khác như Bảo hiểm, đi lại, ăn uống. Chúng tôi đã đính kèm bản hợp đồng chi tiết dưới đây để bạn tham khảo kỹ trước khi bắt đầu công việc.\n" +
                    "</p>\n" +
                    "<p>\n" +
                    "    Khi nhận được email này, bạn vui lòng xác nhận lại cho chúng tôi trước <strong>"+replyDate+"</strong>.\n" +
                    "     Nếu có bất cứ thắc mắc nào, bạn hãy liên hệ với chúng tôi qua <strong>"+appliedJob.getJob().getCompany().getPhoneNumber()+"</strong> hoặc <strong>"+appliedJob.getJob().getCompany().getEmail()+"</strong>.\n" +
                    "</p>\n" +
                    "<p>\n" +
                    "    Chúng tôi rất mong đợi được đón tiếp bạn như một thành viên của đội ngũ. Xin chân thành cảm ơn bạn!\n" +
                    "</p>\n" +
                    "<p>Trân trọng,</p>\n" +
                    "<p>Công ty <strong>"+appliedJob.getJob().getCompany().getName()+"</strong></p>");
            return "redirect:/admin/applied-job/accepted/"+appliedJob.getJob().getId();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }
}
