package com.techjobs.services.interfaces;

import com.techjobs.dtos.JobDTO;
import com.techjobs.exceptions.DataNotFoundException;
import com.techjobs.models.AppliedJob;
import com.techjobs.models.Job;
import com.techjobs.models.Job;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;

import java.util.List;

public interface IJobService {
    Page<Job> searchJobs(String address,String type,String contract,String name,Float salaryMin,Float salaryMax,PageRequest pageRequest);
    Job getById(int id) throws DataNotFoundException;

    Job create(JobDTO jobDTO) throws DataNotFoundException;
    Job update(JobDTO jobDTO,int id) throws DataNotFoundException;
    void delete(int id) throws DataNotFoundException;
}
