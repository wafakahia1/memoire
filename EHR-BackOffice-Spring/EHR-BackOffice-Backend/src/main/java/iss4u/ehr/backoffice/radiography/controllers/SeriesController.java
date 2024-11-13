package iss4u.ehr.backoffice.radiography.controllers;

import iss4u.ehr.backoffice.radiography.entities.Object;
import iss4u.ehr.backoffice.radiography.entities.Series;
import iss4u.ehr.backoffice.radiography.entities.Study;
import iss4u.ehr.backoffice.radiography.services.SeriesService;
import iss4u.ehr.backoffice.radiography.services.StudyService;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.EntityNotFoundException;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/radiography/series")
public class SeriesController {
    @Autowired
    private SeriesService seriesService;

    @Autowired
    private StudyService studyService;

    @PostMapping
    public ResponseEntity<Series> createSeries(@RequestBody Series series) {
        seriesService.create(series);
        return new ResponseEntity<>(series, HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<Series>> getAllSeries() {
        List<Series> seriesList = seriesService.retrieveSeries();
        return new ResponseEntity<>(seriesList, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Series> getSeriesById(@PathVariable("id") Long seriesId) {
        Optional<Series> series = seriesService.getSeriesByKy(seriesId);
        return series.map(value -> new ResponseEntity<>(value, HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @PutMapping("/{seriesKy}")
    public ResponseEntity<Series> updateSeries(@PathVariable Long seriesKy, @RequestBody Series updatedSeries) {
        try {
            Series result = seriesService.update(seriesKy, updatedSeries);
            return ResponseEntity.ok(result); // Return the updated series with a 200 (OK) status
        } catch (EntityNotFoundException ex) {
            return ResponseEntity.notFound().build();
        } catch (Exception ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }


    @DeleteMapping("/{id}")
    public ResponseEntity<HttpStatus> deleteSeries(@PathVariable("id") Long seriesId) {
        Optional<Series> existingSeries = seriesService.getSeriesByKy(seriesId);
        if (existingSeries.isPresent()) {
            seriesService.delete(seriesId);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("/{seriesKy}/add-object")
    public ResponseEntity<Object> addObjectToSeries(@PathVariable("seriesKy") Long seriesKy, @RequestBody Object object) {
        Optional<Series> series = seriesService.getSeriesByKy(seriesKy);
        if (series.isPresent()) {
            Object addedObject = seriesService.addObjectToSeries(series.get(), object);
            return new ResponseEntity<>(addedObject, HttpStatus.CREATED);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

//    @PostMapping("/add-file")
//    @ResponseBody
//    public ResponseEntity<Object> handleFileUpload(@RequestParam("seriesKy") Long seriesKy,
//                                                   @RequestParam("file") MultipartFile file,
//                                                   @RequestParam(value = "objectLabelInput", required = false) String objectLabelInput) throws FileUploadException {
//        Optional<Series> seriesOptional = seriesService.getSeriesByKy(seriesKy);
//        if (seriesOptional.isPresent()) {
//            Series series = seriesOptional.get();
//            Object object = seriesService.uploadFile(series, file, objectLabelInput);
//            return new ResponseEntity<>(object, HttpStatus.CREATED);
//        } else {
//            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
//        }
//    }

    @GetMapping("/object-paths/{seriesKy}")
    public ResponseEntity<List<String>> getObjectPathsForSeries(@PathVariable Long seriesKy) {
        List<String> objectPaths = seriesService.getObjectPathsBySeries(seriesKy);
        return new ResponseEntity<>(objectPaths, HttpStatus.OK);
    }

}
