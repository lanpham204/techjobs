package com.techjobs.repositories;

import com.techjobs.models.Company;
import com.techjobs.models.Job;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface JobRepository extends JpaRepository<Job,Integer> {
    @Query("SELECT j from Job j where " +
            "(:address is null or :address = '' or j.address like %:address%) " +
            "and (:type is null or :type = '' or j.type like %:type%) " +
            "and (:contract is null or :contract = '' or j.contract like %:contract%) " +
            "and (:keyword is null or :keyword = '' or j.name like %:keyword% or j.description like %:keyword% " +
            "or j.requires like %:keyword% or j.welfare like %:keyword%) " +
            "and (:salary_min is null or :salary_min = 0 or j.salaryMin >= :salary_min) " +
            "and (:salary_max is null or :salary_max = 0 or j.salaryMax <= :salary_max)")
    Page<Job> searchJobs(@Param("address") String address,
                         @Param("type") String type,
                         @Param("contract") String contract,
                         @Param("keyword") String keyword,
                         @Param("salary_min") Float salaryMin,
                         @Param("salary_max") Float salaryMax,
                         Pageable pageable);

}
