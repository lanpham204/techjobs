package com.techjobs.controllers;

import com.techjobs.models.Job;
import com.techjobs.services.interfaces.IAppliedJobService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequiredArgsConstructor
public class DashboardAdminController {
    private final IAppliedJobService appliedJobService;
    @GetMapping("admin")
    public String viewDashboard(Model model) {
        model.addAttribute( "statisticalCandidateAppliedJobs",appliedJobService.statisticalCandidateAppliedJob());
        model.addAttribute( "statisticalCandidateAppliedByMonths",appliedJobService.statisticalCandidateAppliedByMonth("2024"));
        return "admin/index";
    }
}
