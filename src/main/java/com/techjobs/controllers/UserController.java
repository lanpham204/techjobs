package com.techjobs.controllers;

import com.techjobs.dtos.CompanyDTO;
import com.techjobs.dtos.UserDTO;
import com.techjobs.exceptions.DataNotFoundException;
import com.techjobs.models.*;
import com.techjobs.repositories.RoleRepository;
import com.techjobs.services.UserService;
import com.techjobs.services.interfaces.IAppliedJobService;
import com.techjobs.services.interfaces.IUserService;
import com.techjobs.utils.CookieUtil;
import com.techjobs.utils.UploadUtil;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequiredArgsConstructor
public class UserController {
    private final IUserService userService;
    private final IAppliedJobService appliedJobService;
    private final RoleRepository roleRepository;
    private final ModelMapper modelMapper;
    private final CookieUtil cookieUtil;
    @GetMapping("/login")
    public String viewLogin(Model model) {
        return "login";
    }
    @PostMapping("/login")
    public String login(Model model,@RequestParam String email,@RequestParam String password,
                        @RequestParam(required = false) boolean rememberMe) {
       try {
           User user = userService.login(email, password);
           if(user.getPassword().equals(password)) {
               if(rememberMe) {
                   cookieUtil.create("email",user.getEmail(),1);
               }
               cookieUtil.create("id", String.valueOf(user.getId()),1);
               cookieUtil.create("fullname",user.getFullname().split("\\s+")[user.getFullname().split("\\s+").length-1],1);
               if(user.getRole().getId() == 1) {
                   return "redirect:/admin/jobs";
               } else  {
                   return "redirect:/jobs";
               }
           } else {
               model.addAttribute("message","Sai tài khoản hoặc mật khẩu");
           }
       } catch (Exception e) {
           model.addAttribute("message","Sai tài khoản hoặc mật khẩu");
       }
        return "login";
    }
    @GetMapping("/logout")
    public String logout(Model model) {
        cookieUtil.deleteCookie("id");
        cookieUtil.deleteCookie("fullname");
        return "redirect:/home";
    }
    @GetMapping("/register")
    public String viewRegister(Model model) {
        model.addAttribute("userDTO",new UserDTO());
        return "register";
    }
    @PostMapping("/register")
    public String register(Model model,@ModelAttribute @Validated UserDTO userDTO, BindingResult result) {
        try {
            if (userDTO.getPassword().equals(userDTO.getRetypePassword())) {
                userDTO.setRoleId(2);
                if(!result.hasErrors())  {
                    userService.register(userDTO);
                    return "redirect:/login";
                }
            } else {
                model.addAttribute("passwordMessage","Mật khẩu và mật khẩu xác nhận không đúng");
            }
        }catch (Exception e) {
            new RuntimeException(e.getMessage());
        }

        return "register";
    }
    @GetMapping("/users/applied-jobs/{userId}")
    public String viewAppliedJobs(Model model,@PathVariable int userId) {
        try {
            User user = userService.getById(userId);
            List<AppliedJob> appliedJobs = appliedJobService.getAllByUserId(user.getId());
            model.addAttribute("appliedJobs",appliedJobs);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "/user/appliedJob";
    }
    @GetMapping("/users/profile/{userId}")
    public String viewProfile(Model model,@PathVariable int userId) {
        try {
            User user = userService.getById(userId);
            UserDTO userDTO = modelMapper.map(user,UserDTO.class);
            model.addAttribute("userDTO",userDTO);
            model.addAttribute("userId",user.getId());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        return "/user/profile";
    }
    @PostMapping("/users/profile/{userId}")
    public String updateProfile(Model model,@PathVariable int userId,@ModelAttribute @Validated UserDTO userDTO,
                                BindingResult result) {
        try {
            if(!result.hasErrors()) {
                User user = userService.getById(userId);
                userDTO.setRoleId(2);
                userDTO.setEmail(user.getEmail());
                userDTO.setPassword(user.getPassword());
                userService.update(userDTO,userId);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "/user/profile";
    }
    @GetMapping("/users/change-password/{userId}")
    public String viewChangePassword(Model model,@PathVariable int userId) {
        model.addAttribute("userDTO",new UserDTO());
        model.addAttribute("userId",userId);
        return "/user/change-password";
    }
    @PostMapping("/users/change-password/{userId}")
    public String changePassword(Model model,@PathVariable int userId,@RequestParam String oldPassword
                                ,@RequestParam String newPassword,@RequestParam String retypePassword) {
        try {
                User user = userService.getById(userId);
                if(user.getPassword().equals(oldPassword)) {
                    if(newPassword.length() <=3 || retypePassword.length()<= 3) {
                        model.addAttribute("messagePassword",
                                "Mật khẩu hoặc xác nhận mật khẩu không được dưới 3 ký tự");
                    }
                    if (newPassword.equals(retypePassword)) {
                        UserDTO userDTO = modelMapper.map(user, UserDTO.class);
                        userDTO.setPassword(newPassword);
                        userService.update(userDTO,userId);
                    } else {
                        model.addAttribute("messageRetype","Mật khẩu phải trùng với xác nhận mật khẩu");
                    }
                } else {
                    model.addAttribute("message","Mật khẩu cũ không đúng");
                }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "/user/change-password";
    }

}
