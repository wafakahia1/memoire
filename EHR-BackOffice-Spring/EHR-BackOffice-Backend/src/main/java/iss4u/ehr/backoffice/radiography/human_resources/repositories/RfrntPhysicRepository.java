package iss4u.ehr.backoffice.radiography.human_resources.repositories;

import iss4u.ehr.backoffice.radiography.entities.Study;
import iss4u.ehr.backoffice.radiography.human_resources.entities.RfrntPhysic;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RfrntPhysicRepository extends JpaRepository<RfrntPhysic, Long> {
}
