package iss4u.ehr.backoffice.radiography.repositories;

import iss4u.ehr.backoffice.radiography.entities.Object;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ObjectRepository extends JpaRepository<Object, Long> {
    Object findByObjectKy(Long objectKy);

    @Query("SELECT o FROM Object o WHERE o.report IS NULL AND o.series IS NULL")
    List<Object> findAllObjectsWithNullReport();
}
