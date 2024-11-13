package iss4u.ehr.backoffice.radiography.repositories;

import iss4u.ehr.backoffice.radiography.entities.SharedExamLink;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SharedExamLinkRepository extends JpaRepository<SharedExamLink, Long> {
}
