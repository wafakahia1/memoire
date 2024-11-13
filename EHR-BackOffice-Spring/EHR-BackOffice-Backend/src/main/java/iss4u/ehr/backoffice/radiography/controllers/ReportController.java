package iss4u.ehr.backoffice.radiography.controllers;

import iss4u.ehr.backoffice.radiography.entities.Object;
import iss4u.ehr.backoffice.radiography.entities.Report;
import iss4u.ehr.backoffice.radiography.entities.ReportVersion;
import iss4u.ehr.backoffice.radiography.entities.Study;
import iss4u.ehr.backoffice.radiography.services.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.persistence.EntityNotFoundException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/radiography/report")
public class ReportController {
    @Autowired
    private ReportService reportService;

    @GetMapping
    public ResponseEntity<List<Report>> getAllReports() {
        List<Report> reports = reportService.retrieveReports();
        return new ResponseEntity<>(reports, HttpStatus.OK);
    }

    @PostMapping("/{reportKy}/add-object")
    public ResponseEntity<Object> addObjectToReport(@PathVariable("reportKy") Long reportKy, @RequestBody Object object) {
        Optional<Report> report = reportService.getReportByKy(reportKy);
        if (report.isPresent()) {
            Object addedObject = reportService.addObjectToReport(report.get(), object);
            return new ResponseEntity<>(addedObject, HttpStatus.CREATED);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/{reportKy}")
    public ResponseEntity<HttpStatus> deleteReport(@PathVariable("reportKy") Long reportKy) {
        Optional<Report> existingReport = reportService.getReportByKy(reportKy);
        if (existingReport.isPresent()) {
            reportService.delete(reportKy);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PutMapping("/{reportKy}")
    public ResponseEntity<Report> updateReport(@PathVariable Long reportKy, @RequestBody Report updatedReport) {
        try {
            Report updated = reportService.updateReport(reportKy, updatedReport);
            return ResponseEntity.ok(updated);
        } catch (EntityNotFoundException ex) {
            return ResponseEntity.notFound().build();
        } catch (Exception ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @PutMapping("/{reportKy}/sign")
    public ResponseEntity<Report> signReport(@PathVariable Long reportKy) {
        try {
            Report signed = reportService.signReport(reportKy);
            return ResponseEntity.ok(signed);
        } catch (EntityNotFoundException ex) {
            return ResponseEntity.notFound().build();
        } catch (Exception ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping("/{reportKy}/versions")
    public ResponseEntity<List<ReportVersion>> getReportVersionsByReportKy(@PathVariable("reportKy") Long reportKy) {
        List<ReportVersion> reportVersions = reportService.getReportVersionsByReportKy(reportKy);
        if (reportVersions.isEmpty()) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(reportVersions, HttpStatus.OK);
    }


}
