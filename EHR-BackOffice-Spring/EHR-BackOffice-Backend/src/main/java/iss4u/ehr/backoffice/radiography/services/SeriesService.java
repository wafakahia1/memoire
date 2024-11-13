package iss4u.ehr.backoffice.radiography.services;


import iss4u.ehr.backoffice.radiography.entities.Object;
import iss4u.ehr.backoffice.radiography.entities.Series;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

public interface SeriesService {

    void create(Series series);

    List<Series> retrieveSeries();

    Optional<Series> getSeriesByKy(Long seriesKy);

    Series update(Long seriesKy, Series updatedSeries);

    void delete(Long seriesKy);

    Object addObjectToSeries(Series series, Object object);

    List<String> getObjectPathsBySeries(Long seriesKy);
}
