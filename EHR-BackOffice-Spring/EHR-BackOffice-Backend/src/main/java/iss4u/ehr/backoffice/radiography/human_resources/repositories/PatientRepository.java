package iss4u.ehr.backoffice.radiography.human_resources.repositories;

import iss4u.ehr.backoffice.radiography.human_resources.entities.Patient;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PatientRepository extends JpaRepository<Patient, Long> {
    Patient findByUserKy(Long userKy);
    List<Patient> findByUserRcrdSts(Integer userRcrdSts);
}
