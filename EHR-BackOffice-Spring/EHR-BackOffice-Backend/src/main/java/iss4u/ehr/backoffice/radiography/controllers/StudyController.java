package iss4u.ehr.backoffice.radiography.controllers;

import iss4u.ehr.backoffice.radiography.entities.Report;
import iss4u.ehr.backoffice.radiography.entities.Series;
import iss4u.ehr.backoffice.radiography.entities.Study;
import iss4u.ehr.backoffice.radiography.entities.Object;
import iss4u.ehr.backoffice.radiography.services.StudyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.persistence.EntityNotFoundException;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/radiography/study")
@CrossOrigin
public class StudyController {
    @Autowired
    private StudyService studyService;

    @PostMapping
    public ResponseEntity<Study> createStudy(@RequestBody Study study) {
        studyService.create(study);
        return new ResponseEntity<>(study, HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<Study>> getAllStudies() {
        List<Study> studies = studyService.retrieveStudies();
        return new ResponseEntity<>(studies, HttpStatus.OK);
    }

    @GetMapping("/byUserKy/{userKy}")
    public ResponseEntity<List<Study>> retrieveStudiesByUserKy(@PathVariable("userKy") Long userKy) {
        List<Study> studies = studyService.retrieveStudiesByUserKy(userKy);
        return new ResponseEntity<>(studies, HttpStatus.OK);
    }

    @GetMapping("/archived&Unarchived")
    public ResponseEntity<List<Study>> retrieveAllStudies() {
        List<Study> studies = studyService.retrieveAllStudies();
        return new ResponseEntity<>(studies, HttpStatus.OK);
    }

    @GetMapping("/archived&Unarchived/{userKy}")
    public ResponseEntity<List<Study>> retrieveAllStudiesByUserKy(@PathVariable("userKy") Long userKy) {
        List<Study> studies = studyService.retrieveAllStudiesByUserKy(userKy);
        return new ResponseEntity<>(studies, HttpStatus.OK);
    }


    @GetMapping("/archived")
    public ResponseEntity<List<Study>> getAllArchivedStudies() {
        List<Study> studies = studyService.retrieveArchivedStudies();
        return new ResponseEntity<>(studies, HttpStatus.OK);
    }

    @GetMapping("/archived/{userKy}")
    public ResponseEntity<List<Study>> retrieveArchivedStudiesByUserKy(@PathVariable("userKy") Long userKy) {
        List<Study> studies = studyService.retrieveArchivedStudiesByUserKy(userKy);
        return new ResponseEntity<>(studies, HttpStatus.OK);
    }

    @GetMapping("/in-progress")
    public List<Study> getStudiesInProgress() {
        return studyService.getStudiesInProgress();
    }

    @GetMapping("/in-progress/{userKy}")
    public List<Study> getStudiesInProgressByUserKy(@PathVariable("userKy") Long userKy) {
        return studyService.getStudiesInProgressByUserKy(userKy);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Study> getStudyById(@PathVariable("id") Long studyId) {
        Optional<Study> study = studyService.getStudyByKy(studyId);
        return study.map(value -> new ResponseEntity<>(value, HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @PutMapping("/{studyKy}")
    public ResponseEntity<Study> updateStudy(@PathVariable Long studyKy, @RequestBody Study updatedStudy) {
        try {
            studyService.update(studyKy, updatedStudy);
            return ResponseEntity.ok().build(); // Return 200 (OK) without a body
        } catch (EntityNotFoundException ex) {
            return ResponseEntity.notFound().build();
        } catch (Exception ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @DeleteMapping("/{studyKy}")
    public ResponseEntity<HttpStatus> deleteStudy(@PathVariable("studyKy") Long studyKy) {
        Optional<Study> existingStudy = studyService.getStudyByKy(studyKy);
        if (existingStudy.isPresent()) {
            studyService.delete(studyKy);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/arch/{studyKy}")
    public ResponseEntity<HttpStatus> deleteStudyDef(@PathVariable("studyKy") Long studyKy) {
        Optional<Study> existingStudy = studyService.getStudyByKy(studyKy);
        if (existingStudy.isPresent()) {
            studyService.deleteDef(studyKy);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("/{studyKy}/add-series")
    public ResponseEntity<Series> addSeriesToStudy(@PathVariable("studyKy") Long studyKy, @RequestBody Series series) {
        Optional<Study> study = studyService.getStudyByKy(studyKy);
        if (study.isPresent()) {
            Series addedSeries = studyService.addSeriesToStudy(study.get(), series); // Assuming this method returns the Series with seriesKy
            return new ResponseEntity<>(addedSeries, HttpStatus.CREATED);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping("/{studyKy}/add-report")
    public ResponseEntity<Report> addReportToStudy(@PathVariable("studyKy") Long studyKy, @RequestBody Report report) {
        Optional<Study> study = studyService.getStudyByKy(studyKy);
        if (study.isPresent()) {
            Report addedReport = studyService.addReportToStudy(study.get(), report);
            return new ResponseEntity<>(addedReport, HttpStatus.CREATED);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PutMapping("/unarchive/{studyKy}")
    public ResponseEntity<Study> unarchiveStudy(@PathVariable Long studyKy) {
        studyService.unarchiveStudy(studyKy);
        //return ResponseEntity.ok("Study unarchived successfully");
        return ResponseEntity.ok().build(); // Return 200 (OK) without a body
    }

    @GetMapping("/reports/{studyKy}")
    public ResponseEntity<List<Report>> getReportsForStudy(@PathVariable Long studyKy) {
        List<Report> reports = studyService.getReportsForStudy(studyKy);
        return ResponseEntity.ok(reports);
    }

    @PostMapping("/{studyKy}/add-report-with-objects")
    public ResponseEntity<Report> addReportWithObjectsToStudy(@PathVariable("studyKy") Long studyKy, @RequestBody Report report) {
        Optional<Study> study = studyService.getStudyByKy(studyKy);
        if (study.isPresent()) {
            Report addedReport = studyService.addReportWithObjectsToStudy(study.get(), report);
            return new ResponseEntity<>(addedReport, HttpStatus.CREATED);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("/allSeries/{studyKy}")
    public ResponseEntity<List<Series>> getAllSeriesByStudyKey(@PathVariable Long studyKy) {
        List<Series> seriesList = studyService.getAllSeriesByStudyKey(studyKy);
        return new ResponseEntity<>(seriesList, HttpStatus.OK);
    }
}
