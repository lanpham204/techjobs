package com.techjobs.models;

import jakarta.persistence.*;
import lombok.*;

import java.util.Objects;

@Entity
@Table(name = "informations")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
public class Information {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id")
    private int id;
    @ManyToOne
    @JoinColumn(name = "id_user")
    private User user;
    @Basic
    @Column(name = "fullname")
    private String fullname;
    @Basic
    @Column(name = "email")
    private String email;
    @Basic
    @Column(name = "cv")
    private String cv;
    @Basic
    @Column(name = "description")
    private String description;


}
