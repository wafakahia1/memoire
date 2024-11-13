package iss4u.ehr.backoffice.radiography.services;


import iss4u.ehr.backoffice.radiography.entities.Object;
import iss4u.ehr.backoffice.radiography.entities.Report;
import iss4u.ehr.backoffice.radiography.entities.Series;
import iss4u.ehr.backoffice.radiography.entities.Study;

import java.util.List;
import java.util.Optional;

public interface StudyService {

    void create(Study study);

    List<Study> retrieveStudies();// unarchived studies

    List<Study> retrieveStudiesByUserKy(Long userKy);// unarchived studies

    List<Study> retrieveAllStudies(); // unarchived and archived studies

    List<Study> retrieveAllStudiesByUserKy(Long userKy); // unarchived and archived studies

    Optional<Study> getStudyByKy(Long studyKy);

    void update(Long studyKy, Study updatedStudy);

    void delete(Long studyKy);

    Series addSeriesToStudy(Study study, Series series);

    Report addReportToStudy(Study study, Report report);

    void archiveStudy(Long studyKy);

    void unarchiveStudy(Long studyKy);

    void deleteDef(Long studyKy);

    List<Study> retrieveArchivedStudies();

    List<Study> retrieveArchivedStudiesByUserKy(Long userKy);

    List<Study> getStudiesInProgress();

    List<Study> getStudiesInProgressByUserKy(Long userKy);

    List<Report> getReportsForStudy(Long studyKy);

    Report addReportWithObjectsToStudy(Study study, Report report);

    List<Series> getAllSeriesByStudyKey(Long studyKey);
}
