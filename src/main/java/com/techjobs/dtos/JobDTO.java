package com.techjobs.dtos;

import com.techjobs.models.Company;
import jakarta.persistence.*;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class JobDTO {
    @Min(value = 1,message = "companyId must be > 0")
    private int companyId;
    @NotBlank(message = "address is not blank")
    private String address;
    @NotEmpty(message = "type is not empty")
    private List<String> types;
    @NotBlank(message = "contract is not empty")
    private String contract;
    @NotBlank(message = "name is not blank")
    private String name;
    @Min(value = 0,message = "salaryMin must be > 0")
    private Float salaryMin;
    @Min(value = 0,message = "salaryMax must be > 0")
    private Float salaryMax;
    private int experience;
    @NotBlank(message = "description is not blank")
    private String description;
    @NotBlank(message = "requires is not blank")
    private String requires;
    @NotBlank(message = "welfare is not blank")
    private String welfare;
    private Date endDate;
    private boolean isActive = true;
}
