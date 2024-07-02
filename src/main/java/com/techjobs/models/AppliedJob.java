package com.techjobs.models;

import jakarta.persistence.*;
import lombok.*;

import java.util.Date;
import java.util.Objects;

@Entity
@Table(name = "applied_jobs")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class AppliedJob {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;
    @ManyToOne
    @JoinColumn(name = "id_job")
    private Job job;
    @ManyToOne
    @JoinColumn(name = "id_user")
    private User user;
    @Column(name = "time")
    private Date time;
    @Column(name = "is_accepted")
    private int isAccepted;
    @Column(name = "fullname")
    private String fullname;
    @Column(name = "email")
    private String email;
    @Column(name = "cv")
    private String cv;
    @Column(name = "description")
    private String description;
}
