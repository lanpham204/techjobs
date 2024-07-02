package com.techjobs.models;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "companies")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class Company {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;
    @Basic
    @Column(name = "name")
    private String name;
    @Basic
    @Column(name = "images")
    private String images;
    @Basic
    @Column(name = "email")
    private String email;
    @Basic
    @Column(name = "website")
    private String website;
    @Basic
    @Column(name = "phone_number")
    private String phoneNumber;
    @Basic
    @Column(name = "address")
    private String address;
    @Basic
    @Column(name = "description")
    private String description;


}
