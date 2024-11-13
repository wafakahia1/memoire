package iss4u.ehr.backoffice.radiography.services.implementations;

import iss4u.ehr.backoffice.radiography.entities.Object;
import iss4u.ehr.backoffice.radiography.entities.Report;
import iss4u.ehr.backoffice.radiography.entities.ReportVersion;
import iss4u.ehr.backoffice.radiography.repositories.ObjectRepository;
import iss4u.ehr.backoffice.radiography.repositories.ReportRepository;
import iss4u.ehr.backoffice.radiography.repositories.ReportVersionRepository;
import iss4u.ehr.backoffice.radiography.services.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class ReportServiceImpl implements ReportService {
    private final ReportRepository reportRepository;
    private final ObjectRepository objectRepository;
    private final ReportVersionRepository reportVersionRepository;

    @Autowired
    public ReportServiceImpl(ReportRepository reportRepository, ObjectRepository objectRepository, ReportVersionRepository reportVersionRepository) {
        this.reportRepository = reportRepository;
        this.objectRepository = objectRepository;
        this.reportVersionRepository = reportVersionRepository;
    }

    @Override
    public List<Report> retrieveReports() {
        return reportRepository.findAll();
    }

    @Override
    public Optional<Report> getReportByKy(Long reportKy) {
        return reportRepository.findById(reportKy);
    }

    @Override
    public Object addObjectToReport(Report report, Object object) {
        report.getObjects().add(object);
        object.setReport(report);
        reportRepository.save(report);
        return object;
    }

    @Override
    public void delete(Long reportKy) {
        reportRepository.deleteById(reportKy);
//        Report report = reportRepository.findByReportKy(reportKy);
//        this.archiveReport(reportKy);
//        reportRepository.save(report);
    }

    @Override
    public void archiveReport(Long reportKy) {
        Report report = reportRepository.findById(reportKy)
                .orElseThrow(() -> new EntityNotFoundException("Report not found"));

        report.setReportRcrdSts(0);
        reportRepository.save(report);
    }

    @Override
    public Report updateReport(Long reportKy, Report updatedReport) {
        Report existingReport = reportRepository.findById(reportKy)
                .orElseThrow(() -> new EntityNotFoundException("Report with id " + reportKy + " not found"));

        ReportVersion reportVersion = new ReportVersion();
        reportVersion.setReportVersionLabel(existingReport.getReportLabel());
        reportVersion.setReportVersionType(existingReport.getReportType());
        reportVersion.setReportVersionComment(existingReport.getReportComment());
        reportVersion.setReportVersionImpression(existingReport.getReportImpression());
        reportVersion.setReportVersionFindings(existingReport.getReportFindings());
        reportVersion.setReportVersionPath(existingReport.getReportPath());
        reportVersion.setReportVersionStatus(existingReport.getReportStatus());
        reportVersion.setReportVersionSigned(existingReport.getIsSigned());
        reportVersion.setReportVersionUnxTmSign(existingReport.getReportUnxTmSign());
        reportVersion.setReportVersionUnxTmCrt(existingReport.getReportUnxTmCrt());
        reportVersion.setReportVersionUnxTmUpdt(existingReport.getReportUnxTmUpdt());
        reportVersion.setReportVersionRcrdSts(1);
        reportVersion.setReport(existingReport);
        reportVersionRepository.save(reportVersion);

        // Détachez les objets associés du rapport existant
        for (Object obj : existingReport.getObjects()) {
            obj.setReport(null);
        }

        if (updatedReport.getReportLabel() != null) {
            existingReport.setReportLabel(updatedReport.getReportLabel());
        }

        if (updatedReport.getReportComment() != null) {
            existingReport.setReportComment(updatedReport.getReportComment());
        }

        if (updatedReport.getReportFindings() != null) {
            existingReport.setReportFindings(updatedReport.getReportFindings());
        }

        if (updatedReport.getReportImpression() != null) {
            existingReport.setReportImpression(updatedReport.getReportImpression());
        }

        if (updatedReport.getReportStatus() != null) {
            existingReport.setReportStatus(updatedReport.getReportStatus());
        }

        if (updatedReport.getReportAccessNmbr() != null) {
            existingReport.setReportAccessNmbr(updatedReport.getReportAccessNmbr());
        }

        if (updatedReport.getObjects() != null) {
            for (Object obj : updatedReport.getObjects()) {
                    obj.setReport(existingReport);
            }

            existingReport.setObjects(updatedReport.getObjects());

        }

        existingReport.setReportUnxTmUpdt(new Date());

        // Sauvegarde le rapport mis à jour
        reportRepository.save(existingReport);

        // Supprimez les objets associés à null
        objectRepository.deleteAll(objectRepository.findAllObjectsWithNullReport());
        return existingReport;
    }

    @Override
    public Report signReport(Long reportKy) {
        Report existingReport = reportRepository.findById(reportKy)
                .orElseThrow(() -> new EntityNotFoundException("Report with id " + reportKy + " not found"));
        existingReport.setIsSigned(true);
        existingReport.setReportUnxTmSign(new Date());
        reportRepository.save(existingReport);
        return existingReport;
    }

    @Override
    public List<ReportVersion> getReportVersionsByReportKy(Long reportKy) {
        Report report = reportRepository.findById(reportKy)
                .orElseThrow(() -> new EntityNotFoundException("Report with id " + reportKy + " not found"));

        return report.getReportVersions();
    }

}

