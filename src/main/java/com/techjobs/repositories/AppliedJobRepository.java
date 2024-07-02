package com.techjobs.repositories;

import com.techjobs.models.AppliedJob;
import com.techjobs.models.Information;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Objects;

public interface AppliedJobRepository extends JpaRepository<AppliedJob,Integer> {
    Page<AppliedJob> findByJobId(int jobId, Pageable pageable);
    List<AppliedJob> findByUserId(int userId);
    @Query("SELECT a.job.name,count(a.id) FROM AppliedJob a " +
            "group by a.job.name")
    List<Object> statisticalCandidateAppliedJob();
    @Query("SELECT month(a.time),count(a.id) FROM AppliedJob a " +
            "where year(a.time) = :year "+
            "group by month(a.time)" +
            "order by month(a.time) asc")
    List<Object> statisticalCandidateAppliedByMonth(@Param("year") String year);
}
