package com.techjobs.services;

import com.techjobs.dtos.JobDTO;
import com.techjobs.exceptions.DataNotFoundException;
import com.techjobs.models.Company;
import com.techjobs.models.Job;
import com.techjobs.repositories.CompanyRepository;
import com.techjobs.repositories.JobRepository;
import com.techjobs.services.interfaces.IJobService;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class JobService implements IJobService {
    private final JobRepository jobRepository;
    private final CompanyRepository companyRepository;
    private final ModelMapper modelMapper;
    @Override
    public Page<Job> searchJobs(String address, String type, String contract, String keyword, Float salaryMin, Float salaryMax, PageRequest pageRequest) {
        return jobRepository.searchJobs(address,type,contract,keyword,salaryMin,salaryMax,pageRequest);
    }

    @Override
    public Job getById(int id) throws DataNotFoundException {
        return jobRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException("Cannot found job with id: " + id));
    }

    @Override
    public Job create(JobDTO jobDTO) throws DataNotFoundException {
        Company company = companyRepository.findById(jobDTO.getCompanyId())
                .orElseThrow(() -> new DataNotFoundException("Cannot found company with id: " + jobDTO.getCompanyId()));
        modelMapper.typeMap(JobDTO.class,Job.class).addMappings(mp -> mp.skip(Job::setId));
        Job job = modelMapper.map(jobDTO, Job.class);
        job.setType(jobDTO.getTypes().toString());
        job.setCompany(company);
        return jobRepository.save(job);
    }

    @Override
    public Job update(JobDTO jobDTO, int id) throws DataNotFoundException {
        Company company = companyRepository.findById(jobDTO.getCompanyId())
                .orElseThrow(() -> new DataNotFoundException("Cannot found company with id: " + jobDTO.getCompanyId()));
        modelMapper.typeMap(JobDTO.class,Job.class).addMappings(mp -> mp.skip(Job::setId));
        Job job = getById(id);
        modelMapper.map(jobDTO,job);
        StringBuilder typeBuilder = new StringBuilder();
        jobDTO.getTypes().forEach(s -> typeBuilder.append(s+" ,"));
        job.setType(typeBuilder.toString());
        job.setCompany(company);
        return jobRepository.save(job);
    }

    @Override
    public void delete(int id) throws DataNotFoundException {
        Job job = getById(id);
        jobRepository.delete(job);
    }
}
