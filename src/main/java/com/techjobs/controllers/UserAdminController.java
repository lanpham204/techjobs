package com.techjobs.controllers;

import com.techjobs.dtos.UserDTO;
import com.techjobs.models.Role;
import com.techjobs.models.User;
import com.techjobs.repositories.RoleRepository;
import com.techjobs.services.interfaces.IUserService;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class UserAdminController {
    private final IUserService userService;
    private final RoleRepository roleRepository;
    private final ModelMapper modelMapper;
    @GetMapping("admin/users")
    public String viewUsers(Model model) {
        return "admin/user";
    }
    @GetMapping("admin/users/{id}")
    public String viewUser(Model model, @PathVariable int id) {
        try {
            if(id == 0) {
                model.addAttribute("userDTO", new UserDTO());
                model.addAttribute("id",0);
            } else {
                User user = userService.getById(id);
                UserDTO userDTO = modelMapper.map(user, UserDTO.class);
                userDTO.setRetypePassword(user.getPassword());
                model.addAttribute("userDTO",userDTO );
                model.addAttribute("id",user.getId());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "admin/edit-user";
    }
    @PostMapping("/admin/users/{id}")
    public String createOrUpdateUser(Model model, @PathVariable int id, @ModelAttribute @Validated UserDTO userDTO
            , BindingResult result) {
        if (result.hasErrors()) {
            return "admin/edit-user";
        }
        try {
            if(id == 0 && !result.hasErrors()) {
                userService.register(userDTO);
            } else if(id != 0 && !result.hasErrors()) {
                userService.update(userDTO,id);
            }
        } catch (Exception e) {
            model.addAttribute("message",e.getMessage());
            return "admin/edit-user";
        }

        return "redirect:/admin/users";
    }
    @GetMapping("/admin/users/delete/{id}")
    public String deleteUser(Model model, @PathVariable int id) {
        try {
            userService.delete(id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "redirect:/admin/users";
    }
    @ModelAttribute("users")
    public List<User> getUsers() {
        return userService.getAll();
    }
    @ModelAttribute("roles")
    public List<Role> getRole() {
        return roleRepository.findAll();
    }
}
