package com.techjobs.services;

import com.techjobs.dtos.AppliedJobDTO;
import com.techjobs.exceptions.DataNotFoundException;
import com.techjobs.models.AppliedJob;
import com.techjobs.models.Job;
import com.techjobs.models.User;
import com.techjobs.repositories.AppliedJobRepository;
import com.techjobs.repositories.JobRepository;
import com.techjobs.repositories.UserRepository;
import com.techjobs.services.interfaces.IAppliedJobService;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
@RequiredArgsConstructor
public class AppliedJobService implements IAppliedJobService {
    private final JobRepository jobRepository;
    private final AppliedJobRepository appliedJobRepository;
    private final UserRepository userRepository;
    private final ModelMapper modelMapper;
    @Override
    public List<AppliedJob> getAll() {
        return appliedJobRepository.findAll();
    }

    @Override
    public Page<AppliedJob> getAllByJobId(int jobId, Pageable pageable) throws DataNotFoundException {
        Job job = jobRepository.findById(jobId)
                .orElseThrow(() -> new DataNotFoundException("Cannot found job with id: " + jobId));
        return appliedJobRepository.findByJobId(jobId,pageable);
    }

    @Override
    public List<AppliedJob> getAllByUserId(int userId) throws DataNotFoundException {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new DataNotFoundException("Cannot found user with id: " +userId));
        return appliedJobRepository.findByUserId(userId);
    }

    @Override
    public AppliedJob getById(int id) throws DataNotFoundException {
        return appliedJobRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException("Cannot found applied job with id: " + id));
    }

    @Override
    public AppliedJob create(AppliedJobDTO appliedJobDTO) throws DataNotFoundException {
        Job job = jobRepository.findById(appliedJobDTO.getJobId())
                .orElseThrow(() -> new DataNotFoundException("Cannot found job with id: " + appliedJobDTO.getJobId()));
        User user = userRepository.findById(appliedJobDTO.getUserId())
                .orElseThrow(() -> new DataNotFoundException("Cannot found user with id: " + appliedJobDTO.getUserId()));
        AppliedJob appliedJob = AppliedJob.builder()
                .email(appliedJobDTO.getEmail())
                .fullname(appliedJobDTO.getFullname())
                .description(appliedJobDTO.getDescription())
                .job(job)
                .user(user)
                .time(appliedJobDTO.getTime())
                .isAccepted(appliedJobDTO.getIsAccepted())
                .cv(appliedJobDTO.getCv())
                .build();
        return appliedJobRepository.save(appliedJob);
    }

    @Override
    public AppliedJob update(AppliedJobDTO appliedJobDTO, int id) throws DataNotFoundException {
        Job job = jobRepository.findById(appliedJobDTO.getJobId())
                .orElseThrow(() -> new DataNotFoundException("Cannot found job with id: " + appliedJobDTO.getJobId()));
        User user = userRepository.findById(appliedJobDTO.getUserId())
                .orElseThrow(() -> new DataNotFoundException("Cannot found user with id: " + appliedJobDTO.getUserId()));
        AppliedJob appliedJob = getById(id);
        appliedJob.setJob(job);
        appliedJob.setUser(user);
        appliedJob.setIsAccepted(appliedJobDTO.getIsAccepted());
        appliedJob.setEmail(appliedJob.getEmail());
        appliedJob.setFullname(appliedJob.getFullname());
        appliedJob.setCv(appliedJob.getCv());
        appliedJob.setDescription(appliedJob.getDescription());
        return appliedJobRepository.save(appliedJob);
    }

    @Override
    public void delete(int id) throws DataNotFoundException {
        AppliedJob appliedJob = getById(id);
        appliedJobRepository.delete(appliedJob);
    }

    @Override
    public List<Object> statisticalCandidateAppliedJob() {
        return appliedJobRepository.statisticalCandidateAppliedJob();
    }

    @Override
    public List<Object> statisticalCandidateAppliedByMonth(String year) {
        return appliedJobRepository.statisticalCandidateAppliedByMonth(year);
    }
}
