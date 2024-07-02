package com.techjobs.controllers;

import com.techjobs.dtos.AppliedJobDTO;
import com.techjobs.models.Job;
import com.techjobs.models.User;
import com.techjobs.services.interfaces.ICompanyService;
import com.techjobs.services.interfaces.IJobService;
import com.techjobs.services.interfaces.IUserService;
import com.techjobs.utils.CookieUtil;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequiredArgsConstructor
public class JobController {
    private final IJobService jobService;
    private final ICompanyService companyService;
    private final IUserService userService;
    private final ModelMapper modelMapper;
    private final CookieUtil cookieUtil;
    @GetMapping("/home")
    public String viewIndex(Model model,@RequestParam(defaultValue = "0",required = false) int page,
                           @RequestParam(defaultValue = "9",required = false) int size,
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
        return "user/index";
    }
    @GetMapping("jobs")
    public String viewJobs(Model model,@RequestParam(defaultValue = "0",required = false) int page,
                           @RequestParam(defaultValue = "3",required = false) int size,
                           @RequestParam(defaultValue = "",required = false) String address,
                           @RequestParam(defaultValue = "",required = false) String type,
                           @RequestParam(defaultValue = "",required = false) String contract,
                           @RequestParam(defaultValue = "",required = false) String keyword,
                           @RequestParam(defaultValue = "0",required = false) Float salaryMin,
                           @RequestParam(defaultValue = "0",required = false) Float salaryMax,
                           @RequestParam(defaultValue = "",required = false) String sort) {
        Page<Job> jobPages = searchJobs(page, size, address, type, contract, keyword, salaryMin, salaryMax,sort);
        List<Job> jobs = jobPages.getContent().stream()
                .peek(j -> {
                    if (j.getAddress().contains("Hồ Chí Minh")) {
                        j.setAddress("Hồ Chí Minh");
                    } else {
                        j.setAddress("Hà Nội");
                    }
                })
                .collect(Collectors.toList());
        BigDecimal formattedSalaryMin = new BigDecimal(salaryMin);
        BigDecimal formattedSalaryMax = new BigDecimal(salaryMax);
        model.addAttribute("address",address);
        model.addAttribute("type",type);
        model.addAttribute("contract",contract);
        model.addAttribute("keyword",keyword);
//        model.addAttribute("salaryMin",salaryMin);
        model.addAttribute("salaryMin", formattedSalaryMin.toPlainString());
        model.addAttribute("salaryMax",formattedSalaryMax.toPlainString());
        model.addAttribute("sort",sort);
        model.addAttribute("jobs",jobs);
        model.addAttribute("totalPages",jobPages.getTotalPages());
        model.addAttribute("currentPage", page);
        return "user/job";
    }
    private Page<Job> searchJobs(int page,int size,String address,String type,String contract,String keyword,Float salaryMin,Float salaryMax,String sort) {
        PageRequest pageRequest = sort.equals("") ? PageRequest.of(page,size,Sort.by("id").descending()):
                PageRequest.of(page,size,sort.equals("asc")?
                        Sort.by("salaryMax").ascending():Sort.by("salaryMax").descending());
        return jobService.searchJobs(address, type, contract, keyword, salaryMin, salaryMax, pageRequest);
    }

    @GetMapping("/jobs/{id}")
    public String viewJobDetail(Model model, @PathVariable int id) {
        try {
                Job job = jobService.getById(id);
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                model.addAttribute("endDate",dateFormat.format(job.getEndDate()));
                model.addAttribute("job",job);
                model.addAttribute("id",job.getId());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "user/job-detail";
    }
    @ModelAttribute("appliedJobDTO")
    public AppliedJobDTO newAppliedJob() {
        try {
            AppliedJobDTO appliedJobDTO = new AppliedJobDTO();
            if(cookieUtil.get("id") != null) {
                User user = userService.getById(Integer.parseInt(cookieUtil.get("id").getValue()));
                appliedJobDTO = appliedJobDTO.builder()
                        .email(user.getEmail())
                        .fullname(user.getFullname())
                        .build();
            }
            return appliedJobDTO;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    @ModelAttribute("locations")
    public List<String> getLocations() {
        List<String> list = new ArrayList<>();
        list.add("Hồ Chí Minh");
        list.add("Hà Nội");
        return list;
    }
}
