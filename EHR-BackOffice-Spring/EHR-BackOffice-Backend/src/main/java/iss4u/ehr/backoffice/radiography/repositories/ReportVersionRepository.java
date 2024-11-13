package iss4u.ehr.backoffice.radiography.repositories;

import iss4u.ehr.backoffice.radiography.entities.ReportVersion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ReportVersionRepository extends JpaRepository<ReportVersion, Long> {
}
