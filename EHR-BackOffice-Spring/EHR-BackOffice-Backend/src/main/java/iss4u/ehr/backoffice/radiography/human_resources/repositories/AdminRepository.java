package iss4u.ehr.backoffice.radiography.human_resources.repositories;

import iss4u.ehr.backoffice.radiography.human_resources.entities.Administrator;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AdminRepository extends JpaRepository<Administrator, Long> {
}
