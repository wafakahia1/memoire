package iss4u.ehr.backoffice.radiography.human_resources.repositories;

import iss4u.ehr.backoffice.radiography.human_resources.entities.PrfrmngPhysic;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PrfrmngPhysicRepository extends JpaRepository<PrfrmngPhysic, Long> {
}
