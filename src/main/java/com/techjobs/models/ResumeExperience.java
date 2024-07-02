package com.techjobs.models;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class ResumeExperience {
    private String name;
    private String description;
    private String start;
    private String end;
}
