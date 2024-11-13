package iss4u.ehr.backoffice.radiography.repositories;

import iss4u.ehr.backoffice.radiography.entities.Series;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SeriesRepository extends JpaRepository<Series, Long> {
    Series findBySeriesKy(Long seriesKy);
}
