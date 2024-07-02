package com.techjobs.services.interfaces;

import com.techjobs.dtos.AppliedJobDTO;
import com.techjobs.exceptions.DataNotFoundException;
import com.techjobs.models.AppliedJob;
import com.techjobs.models.Company;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface IAppliedJobService {
    List<AppliedJob> getAll();
    Page<AppliedJob> getAllByJobId(int jobId, Pageable pageable) throws DataNotFoundException;
    List<AppliedJob> getAllByUserId(int userId) throws DataNotFoundException;
    AppliedJob getById(int id) throws DataNotFoundException;
    AppliedJob create(AppliedJobDTO appliedJobDTO) throws DataNotFoundException;
    AppliedJob update(AppliedJobDTO appliedJobDTO, int id) throws DataNotFoundException;
    void delete(int id) throws DataNotFoundException;
    List<Object> statisticalCandidateAppliedJob();
    List<Object> statisticalCandidateAppliedByMonth(String year);
}
