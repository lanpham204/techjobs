package com.techjobs.dtos;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class CompanyDTO {
    @NotBlank(message = "name is not blank")
    private String name;
    @NotBlank(message = "images is not blank")
    private String images;
    @Email(message = "email is not email format")
    private String email;
    @NotBlank(message = "website is not blank")
    private String website;
    @NotBlank(message = "phoneNumber is not blank")
    private String phoneNumber;
    @NotBlank(message = "address is not blank")
    private String address;
    @NotBlank(message = "description is not blank")
    private String description;
}
