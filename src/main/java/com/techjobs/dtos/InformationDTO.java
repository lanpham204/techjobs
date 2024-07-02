package com.techjobs.dtos;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class InformationDTO {
    private int userId;
    private String fullname;
    private String email;
    private String cv;
    private String description;
}
