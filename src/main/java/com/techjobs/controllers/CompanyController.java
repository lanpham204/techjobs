package com.techjobs.controllers;

import com.techjobs.dtos.CompanyDTO;
import com.techjobs.dtos.JobDTO;
import com.techjobs.models.Company;
import com.techjobs.models.Job;
import com.techjobs.services.CompanyService;
import com.techjobs.services.JobService;
import com.techjobs.services.interfaces.ICompanyService;
import com.techjobs.utils.UploadUtil;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequiredArgsConstructor
public class CompanyController {
    private final ICompanyService companyService;
    private final ModelMapper modelMapper;
    @GetMapping("admin/companies")
    public String viewCompanies(Model model) {

        return "admin/company";
    }
    @GetMapping("admin/companies/{id}")
    public String viewCompany(Model model, @PathVariable int id) {
        try {
            if(id == 0) {
                model.addAttribute("companyDTO", new CompanyDTO());
                model.addAttribute("id",0);
            } else {
                Company company = companyService.getById(id);
                model.addAttribute("companyDTO",company);
                model.addAttribute("id",company.getId());
                model.addAttribute("image",company.getImages());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "admin/edit-company";
    }
    @PostMapping("/admin/companies/{id}")
    public String createOrUpdateCompany(Model model, @PathVariable int id, @ModelAttribute @Validated CompanyDTO companyDTO,
            @RequestParam MultipartFile file
            , BindingResult result) {
        if (result.hasErrors()) {
            return "admin/edit-company";
        }
        try {
            if(!file.isEmpty()) {
                companyDTO.setImages(UploadUtil.save(file));
            }
            if(id == 0 && !result.hasErrors()) {
                companyService.create(companyDTO);
            } else if(id != 0 && !result.hasErrors()) {
                companyService.update(companyDTO,id);
            }
        } catch (Exception e) {
            model.addAttribute("message",e.getMessage());
            return "admin/edit-company";
        }

        return "redirect:/admin/companies";
    }
    @GetMapping("/admin/companies/delete/{id}")
    public String deleteCompany(Model model, @PathVariable int id) {
        try {
            companyService.delete(id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/admin/companies";
    }
    @ModelAttribute("companies")
    public List<Company> getCompanies() {
        return companyService.getAll();
    }
}
