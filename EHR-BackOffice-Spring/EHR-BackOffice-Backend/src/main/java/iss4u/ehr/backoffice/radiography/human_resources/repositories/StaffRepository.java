package iss4u.ehr.backoffice.radiography.human_resources.repositories;

import iss4u.ehr.backoffice.radiography.human_resources.entities.Staff;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StaffRepository extends JpaRepository<Staff, Long> {
}
