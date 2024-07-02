package com.techjobs.dtos;

import jakarta.persistence.Column;
import lombok.*;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class AppliedJobDTO {
    private int jobId;
    private int userId;
    private Date time;
    private int isAccepted;
    private String fullname;
    private String email;
    private String cv;
    private String description;
}
