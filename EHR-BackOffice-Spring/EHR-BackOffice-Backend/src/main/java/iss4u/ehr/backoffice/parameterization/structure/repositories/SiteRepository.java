package iss4u.ehr.backoffice.parameterization.structure.repositories;

import iss4u.ehr.backoffice.parameterization.structure.entities.Site;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SiteRepository extends JpaRepository<Site, Long> {
    Site findBySiteNm(String siteNm);
}
