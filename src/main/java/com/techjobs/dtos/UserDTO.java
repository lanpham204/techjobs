package com.techjobs.dtos;

import com.techjobs.models.Role;
import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import lombok.*;
import org.hibernate.validator.constraints.Length;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class UserDTO {
    @Email(message = "Email phải đúng định dạng email")
    private String email;
    @Length(min = 3,message = "Mật khẩu tối thiểu 3 kí tự")
    private String password;
    @Length(min = 3,message = " Mật khẩu nhập lại tối thiểu 3 kí tự")
    private String retypePassword;
    @NotBlank(message = "Họ và tên không được để trống")
    private String fullname;
    private int roleId;
}
