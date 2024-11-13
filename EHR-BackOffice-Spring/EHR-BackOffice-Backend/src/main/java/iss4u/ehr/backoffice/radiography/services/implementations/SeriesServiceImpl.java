package iss4u.ehr.backoffice.radiography.services.implementations;

import iss4u.ehr.backoffice.radiography.entities.Object;
import iss4u.ehr.backoffice.radiography.entities.Series;
import iss4u.ehr.backoffice.radiography.repositories.SeriesRepository;
import iss4u.ehr.backoffice.radiography.services.SeriesService;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EntityNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.*;

@Service
public class SeriesServiceImpl implements SeriesService {
    private final SeriesRepository seriesRepository;

    @Autowired
    public SeriesServiceImpl(SeriesRepository seriesRepository) {
        this.seriesRepository = seriesRepository;
    }

    @Override
    public void create(Series series) {
        seriesRepository.save(series);
    }

    @Override
    public List<Series> retrieveSeries() {
        return seriesRepository.findAll();
    }

    @Override
    public Optional<Series> getSeriesByKy(Long seriesKy) {
        return seriesRepository.findById(seriesKy);
    }

    @Override
    public Series update(Long seriesKy, Series updatedSeries) {
        Series existingSeries = seriesRepository.findById(seriesKy)
                .orElseThrow(() -> new EntityNotFoundException("Series with id " + seriesKy + " not found"));

        // Update the properties
        existingSeries.setSeriesLabel(updatedSeries.getSeriesLabel());
        existingSeries.setSeriesDesc(updatedSeries.getSeriesDesc());
        existingSeries.setSeriesBodyPart(updatedSeries.getSeriesBodyPart());
        existingSeries.setSeriesDcmModality(updatedSeries.getSeriesDcmModality());
        existingSeries.setSeriesDlp(updatedSeries.getSeriesDlp());
        existingSeries.setSeriesUnxTmUpdt(updatedSeries.getSeriesUnxTmUpdt());

        seriesRepository.save(existingSeries);
        return existingSeries;
    }

    @Override
    public void delete(Long seriesKy) {
        seriesRepository.deleteById(seriesKy);
    }

    @Override
    public Object addObjectToSeries(Series series, Object object) {
        series.getObjects().add(object);
        object.setSeries(series);
        seriesRepository.save(series);
        return object;
    }

    @Override
    public List<String> getObjectPathsBySeries(Long seriesKy) {
        Series series = seriesRepository.findById(seriesKy)
                .orElseThrow(() -> new EntityNotFoundException("Series not found with key: " + seriesKy));

        List<Object> objects = series.getObjects();
        List<String> objectPaths = new ArrayList<>();

        for (Object obj : objects) {
            objectPaths.add(obj.getObjectPath());
        }

        return objectPaths;
    }

}
