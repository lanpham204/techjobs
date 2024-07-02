package com.techjobs.models;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@Entity
@Table(name = "jobs")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class Job {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;
    @ManyToOne
    @JoinColumn(name = "id_company")
    private Company company;
    @Basic
    @Column(name = "address")
    private String address;
    @Basic
    @Column(name = "type")
    private String type;
    @Basic
    @Column(name = "contract")
    private String contract;
    @Basic
    @Column(name = "name")
    private String name;
    @Basic
    @Column(name = "salary_min")
    private Float salaryMin;
    @Basic
    @Column(name = "salary_max")
    private Float salaryMax;
    @Basic
    @Column(name = "experience")
    private int experience;
    @Basic
    @Column(name = "description")
    private String description;
    @Basic
    @Column(name = "requires")
    private String requires;
    @Basic
    @Column(name = "welfare")
    private String welfare;
    @Basic
    @Column(name = "created_date")
    private Date createdDate = new Date();
    @Basic
    @Column(name = "end_date")
    private Date endDate;
    @Basic
    @Column(name = "is_active")
    private boolean isActive;
    @OneToMany(mappedBy = "job")
    private List<AppliedJob> appliedJobs;
}
