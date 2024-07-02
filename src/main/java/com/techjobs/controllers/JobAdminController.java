package com.techjobs.controllers;

import com.techjobs.dtos.JobDTO;
import com.techjobs.models.Company;
import com.techjobs.models.Job;
import com.techjobs.services.interfaces.IAppliedJobService;
import com.techjobs.services.interfaces.ICompanyService;
import com.techjobs.services.interfaces.IJobService;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequiredArgsConstructor
public class JobAdminController {
    private final IJobService jobService;
    private final ICompanyService companyService;
    private final IAppliedJobService appliedJobService;
    private final ModelMapper modelMapper;
    @GetMapping("admin/jobs")
    public String viewJobs(Model model,@RequestParam(defaultValue = "0",required = false) int page,
                           @RequestParam(defaultValue = "3",required = false) int size,
                           @RequestParam(defaultValue = "",required = false) String address,
                           @RequestParam(defaultValue = "",required = false) String type,
                           @RequestParam(defaultValue = "",required = false) String contract,
                           @RequestParam(defaultValue = "",required = false) String keyword,
                           @RequestParam(defaultValue = "0",required = false) Float salaryMin,
                           @RequestParam(defaultValue = "0",required = false) Float salaryMax) {
        PageRequest pageRequest = PageRequest.of(page,size);
        Page<Job> jobPages = jobService.searchJobs(address, type, contract, keyword, salaryMin, salaryMax, pageRequest);
        List<Job> jobs = jobPages.getContent().stream()
                .peek(j -> {
                    if (j.getAddress().contains("Hồ Chí Minh")) {
                        j.setAddress("Hồ Chí Minh");
                    } else {
                        j.setAddress("Hà Nội");
                    }
                })
                .collect(Collectors.toList());
        model.addAttribute("jobs",jobs);
        model.addAttribute("totalPages",jobPages.getTotalPages());
        model.addAttribute("currentPage", page);
        return "admin/job";
    }
    @GetMapping("admin/jobs/{id}")
    public String viewJob(Model model, @PathVariable int id) {
        try {
            if(id == 0) {
                model.addAttribute("jobDTO", new JobDTO());
                model.addAttribute("id",0);
            } else {
                Job job = jobService.getById(id);
                JobDTO jobDTO = modelMapper.map(job, JobDTO.class);
                jobDTO.setTypes(Arrays.stream(job.getType().split("\\s*,\\s*")).toList());
                model.addAttribute("jobDTO",jobDTO);
                model.addAttribute("id",job.getId());

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "admin/edit-job";
    }
    @PostMapping("/admin/jobs/{id}")
    public String createOrUpdateJob(Model model, @PathVariable int id, @ModelAttribute @Validated JobDTO jobDTO
            , BindingResult result) {
        if (result.hasErrors()) {
            return "admin/edit-job";
        }
        try {
            if(id == 0 && !result.hasErrors()) {
                jobService.create(jobDTO);
            } else if(id != 0 && !result.hasErrors()) {
                jobService.update(jobDTO,id);
            }
        } catch (Exception e) {
            model.addAttribute("message",e.getMessage());
            return "admin/edit-job";
        }

        return "redirect:/admin/jobs";
    }
    @GetMapping("/admin/jobs/delete/{id}")
    public String deleteJob(Model model, @PathVariable int id) {
        try {
            jobService.delete(id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/admin/jobs";
    }
    @ModelAttribute("companies")
    public List<Company> getCompanies() {
        return companyService.getAll();
    }
}
