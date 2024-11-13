package iss4u.ehr.backoffice.radiography.repositories;

import iss4u.ehr.backoffice.radiography.entities.Report;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReportRepository extends JpaRepository<Report, Long> {
    Report findByReportKy(Long reportKy);
}
