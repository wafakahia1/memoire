package iss4u.ehr.backoffice.radiography.repositories;

import iss4u.ehr.backoffice.radiography.entities.Report;
import iss4u.ehr.backoffice.radiography.entities.Study;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StudyRepository extends JpaRepository<Study, Long> {
    Study findByStudyKy(Long studyKy);
    List<Study> findByStudyRcrdSts(Integer studyRcrdSts);

    @Query("SELECT s FROM Study s WHERE s.studyStatus = 'In Progress'")
    List<Study> findStudiesInProgress();
}
