package com.techjobs.repositories;

import com.techjobs.models.Company;
import com.techjobs.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CompanyRepository extends JpaRepository<Company,Integer> {
}
