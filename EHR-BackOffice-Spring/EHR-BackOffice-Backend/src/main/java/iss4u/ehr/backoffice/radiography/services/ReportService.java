package iss4u.ehr.backoffice.radiography.services;

import iss4u.ehr.backoffice.radiography.entities.Object;
import iss4u.ehr.backoffice.radiography.entities.Report;
import iss4u.ehr.backoffice.radiography.entities.ReportVersion;

import java.util.List;
import java.util.Optional;

public interface ReportService {
    List<Report> retrieveReports();
    Optional<Report> getReportByKy(Long reportKy);
    Object addObjectToReport(Report report, Object object);
    void delete(Long reportKy);
    void archiveReport(Long reportKy);
    Report updateReport(Long reportKy, Report updatedReport);
    Report signReport(Long reportKy);
    List<ReportVersion> getReportVersionsByReportKy(Long reportKy);
}
