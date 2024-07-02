package com.techjobs.models;

import lombok.*;

import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class Resume {
    private String fullname;
    private String email;
    private String phoneNumber;
    private String jobName;
    private String address;
    private String skill;
    private List<ResumeEducation> educations;
    private List<ResumeExperience> experiences;
    private List<ResumeProject> projects;
    private List<ResumeAchievement> achievements;
}
