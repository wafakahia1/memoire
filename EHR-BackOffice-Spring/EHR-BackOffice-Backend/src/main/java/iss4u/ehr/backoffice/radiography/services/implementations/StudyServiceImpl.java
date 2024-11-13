package iss4u.ehr.backoffice.radiography.services.implementations;

import iss4u.ehr.backoffice.radiography.human_resources.entities.Patient;
import iss4u.ehr.backoffice.radiography.human_resources.entities.PrfrmngPhysic;
import iss4u.ehr.backoffice.radiography.human_resources.entities.RfrntPhysic;
import iss4u.ehr.backoffice.radiography.human_resources.repositories.PatientRepository;
import iss4u.ehr.backoffice.radiography.human_resources.repositories.PrfrmngPhysicRepository;
import iss4u.ehr.backoffice.radiography.human_resources.repositories.RfrntPhysicRepository;
import iss4u.ehr.backoffice.radiography.entities.*;
import iss4u.ehr.backoffice.radiography.entities.Object;
import iss4u.ehr.backoffice.radiography.repositories.NotificationRepository;
import iss4u.ehr.backoffice.radiography.repositories.StudyRepository;
import iss4u.ehr.backoffice.radiography.services.StudyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.*;

@Service
public class StudyServiceImpl implements StudyService {

    private final StudyRepository studyRepository;
    private final RfrntPhysicRepository rfrntPhysicRepository;
    private final PrfrmngPhysicRepository prfrmngPhysicRepository;
    private final PatientRepository patientRepository;
    private final NotificationRepository notificationRepository;

    @Autowired
    public StudyServiceImpl(StudyRepository studyRepository, RfrntPhysicRepository rfrntPhysicRepository, PrfrmngPhysicRepository prfrmngPhysicRepository, PatientRepository patientRepository, NotificationRepository notificationRepository) {
        this.studyRepository = studyRepository;
        this.rfrntPhysicRepository = rfrntPhysicRepository;
        this.prfrmngPhysicRepository = prfrmngPhysicRepository;
        this.patientRepository = patientRepository;
        this.notificationRepository = notificationRepository;
    }

    @Override
    public void create(Study study) {
        studyRepository.save(study);

        Notification notification0 = new Notification();
        notification0.setNotificationMessage("A new study has been created!");
        notification0.setNotificationStatus(false);
        notification0.setNotificationColor("nfc-purple");
        notification0.setNotificationIcon("create_new_folder");
        notification0.setNotificationUnxTmCrt(new Date());
        notification0.setRecipient(study.getRfrntPhysic());
        notificationRepository.save(notification0);

        Notification notification1 = new Notification();
        notification1.setNotificationMessage("A new study has been created!");
        notification1.setNotificationStatus(false);
        notification1.setNotificationColor("nfc-purple");
        notification1.setNotificationIcon("create_new_folder");
        notification1.setNotificationUnxTmCrt(new Date());
        notification1.setRecipient(study.getPrfrmngPhysic());
        notificationRepository.save(notification1);
    }

    @Override
    public List<Study> retrieveStudies() {
        return studyRepository.findByStudyRcrdSts(1);
    }

    @Override
    public List<Study> retrieveStudiesByUserKy(Long userKy) {
        Optional<RfrntPhysic> rfrntPhysic = rfrntPhysicRepository.findById(userKy);
        Optional<PrfrmngPhysic> prfrmngPhysic = prfrmngPhysicRepository.findById(userKy);
        Optional<Patient> patient = patientRepository.findById(userKy);

        List<Study> filteredStudies = new ArrayList<>();

        if(rfrntPhysic.isPresent()){
            List<Study> rfrntPhysicFilteredStudies = new ArrayList<>();
            for (Study study : rfrntPhysic.get().getStudies()) {
                if (study.getStudyRcrdSts() == 1) {
                    rfrntPhysicFilteredStudies.add(study);
                }
            }
            return rfrntPhysicFilteredStudies;
        }

        if(prfrmngPhysic.isPresent()){
            List<Study> prfrmngPhysicFilteredStudies = new ArrayList<>();
            for (Study study : prfrmngPhysic.get().getStudies()) {
                if (study.getStudyRcrdSts() == 1) {
                    prfrmngPhysicFilteredStudies.add(study);
                }
            }
            return prfrmngPhysicFilteredStudies;
        }

        if(patient.isPresent()){
            List<Study> patientFilteredStudies = new ArrayList<>();
            for (Study study : patient.get().getStudies()) {
                if (study.getStudyRcrdSts() == 1) {
                    patientFilteredStudies.add(study);
                }
            }
            return patientFilteredStudies;
        }

        return filteredStudies;
    }

    @Override
    public List<Study> retrieveAllStudies() {
        return studyRepository.findAll();
    }

    @Override
    public List<Study> retrieveAllStudiesByUserKy(Long userKy) {
        Optional<RfrntPhysic> rfrntPhysic = rfrntPhysicRepository.findById(userKy);
        Optional<PrfrmngPhysic> prfrmngPhysic = prfrmngPhysicRepository.findById(userKy);
        Optional<Patient> patient = patientRepository.findById(userKy);


        List<Study> filteredStudies = new ArrayList<>();

        if(rfrntPhysic.isPresent()){
            return new ArrayList<>(rfrntPhysic.get().getStudies());
        }
        if(prfrmngPhysic.isPresent()){
            return new ArrayList<>(prfrmngPhysic.get().getStudies());
        }
        if(patient.isPresent()){
            return new ArrayList<>(patient.get().getStudies());
        }

        return filteredStudies;
    }

    @Override
    public List<Study> retrieveArchivedStudies() {
        return studyRepository.findByStudyRcrdSts(0);
    }

    @Override
    public List<Study> retrieveArchivedStudiesByUserKy(Long userKy) {
        RfrntPhysic rfrntPhysic = rfrntPhysicRepository.findById(userKy)
                .orElseThrow(() -> new EntityNotFoundException("User with id " + userKy + " not found"));

        List<Study> allStudies = rfrntPhysic.getStudies();
        List<Study> filteredStudies = new ArrayList<>();

        for (Study study : allStudies) {
            if (study.getStudyRcrdSts() == 0) {
                filteredStudies.add(study);
            }
        }
        return filteredStudies;
    }

    @Override
    public List<Study> getStudiesInProgress() {
        return studyRepository.findStudiesInProgress();
    }

    @Override
    public List<Study> getStudiesInProgressByUserKy(Long userKy) {
        RfrntPhysic rfrntPhysic = rfrntPhysicRepository.findById(userKy)
                .orElseThrow(() -> new EntityNotFoundException("User with id " + userKy + " not found"));

        List<Study> allStudies = rfrntPhysic.getStudies();
        List<Study> filteredStudies = new ArrayList<>();

        for (Study study : allStudies) {
            if (Objects.equals(study.getStudyStatus(), "In Progress")) {
                filteredStudies.add(study);
            }
        }
        return filteredStudies;
    }

    @Override
    public List<Report> getReportsForStudy(Long studyKy) {
        return studyRepository.findByStudyKy(studyKy).getReports();
    }

    @Override
    public Optional<Study> getStudyByKy(Long studyKy) {
        return studyRepository.findById(studyKy);
    }

    @Override
    public void update(Long studyKy, Study updatedStudy) {
        Study existingStudy = studyRepository.findById(studyKy)
                .orElseThrow(() -> new EntityNotFoundException("Study with id " + studyKy + " not found"));

        // Update the properties
        existingStudy.setStudyLabel(updatedStudy.getStudyLabel());
        existingStudy.setStudyDesc(updatedStudy.getStudyDesc());
        existingStudy.setStudyComment(updatedStudy.getStudyComment());
        existingStudy.setRfrntPhysic(updatedStudy.getRfrntPhysic());
        existingStudy.setPrfrmngPhysic(updatedStudy.getPrfrmngPhysic());
        existingStudy.setStudyAetitle(updatedStudy.getStudyAetitle());
        existingStudy.setStudyType(updatedStudy.getStudyType());
        existingStudy.setStudyStatus(updatedStudy.getStudyStatus());
        existingStudy.setStudyPriority(updatedStudy.getStudyPriority());
        existingStudy.setStudyNote(updatedStudy.getStudyNote());
        existingStudy.setStudyDate(updatedStudy.getStudyDate());


        existingStudy.setStudyUnxTmUpdt(updatedStudy.getStudyUnxTmUpdt());

        studyRepository.save(existingStudy);

        Notification notification0 = new Notification();
        notification0.setNotificationMessage("An update has been made to the exam!");
        notification0.setNotificationStatus(false);
        notification0.setNotificationColor("nfc-blue");
        notification0.setNotificationIcon("update");
        notification0.setNotificationUnxTmCrt(new Date());
        notification0.setRecipient(existingStudy.getRfrntPhysic());
        notificationRepository.save(notification0);

        Notification notification1 = new Notification();
        notification1.setNotificationMessage("An update has been made to the exam!");
        notification1.setNotificationStatus(false);
        notification1.setNotificationColor("nfc-blue");
        notification1.setNotificationIcon("update");
        notification1.setNotificationUnxTmCrt(new Date());
        notification1.setRecipient(existingStudy.getPrfrmngPhysic());
        notificationRepository.save(notification1);
    }

    @Override
    public void delete(Long studyKy) {
        Study study = studyRepository.findByStudyKy(studyKy);
        this.archiveStudy(studyKy);
        studyRepository.save(study);
    }

    @Override
    public Series addSeriesToStudy(Study study, Series series) {
        study.getListOfSeries().add(series);
        series.setStudy(study);
        studyRepository.save(study);

        Notification notification = new Notification();
        notification.setNotificationMessage("A new stack has been added to the exam! " + study.getStudyLabel());
        notification.setNotificationStatus(false);
        notification.setNotificationColor("nfc-red");
        notification.setNotificationIcon("local_pharmacy");
        notification.setNotificationUnxTmCrt(new Date());
        notification.setRecipient(study.getRfrntPhysic());
        notificationRepository.save(notification);

        return series;
    }

    @Override
    public Report addReportToStudy(Study study, Report report) {
        study.getReports().add(report);
        report.setStudy(study);
        studyRepository.save(study);
        return report;
    }

    @Override
    public void archiveStudy(Long studyKy) {
        // "Interpreted"
        Study study = studyRepository.findById(studyKy)
                .orElseThrow(() -> new EntityNotFoundException("Study not found"));

        study.setStudyRcrdSts(0);
        study.setStudyStatus("Archived");
        studyRepository.save(study);
    }

    @Override
    public void unarchiveStudy(Long studyKy) {
        Study study = studyRepository.findById(studyKy)
                .orElseThrow(() -> new EntityNotFoundException("Study not found"));

        study.setStudyRcrdSts(1);
        study.setStudyStatus("Pending Review");
        studyRepository.save(study);
    }

    @Override
    public void deleteDef(Long studyKy) {
        studyRepository.deleteById(studyKy);
    }

    @Override
    public Report addReportWithObjectsToStudy(Study study, Report report) {
        study.getReports().add(report);
        report.setStudy(study);

        // Set the reference to the report in each object
        if(report.getObjects() != null && !report.getObjects().isEmpty()){
            for (Object obj : report.getObjects()) {
                obj.setReport(report);
            }
        }

        studyRepository.save(study);
        return report;
    }

    @Override
    public List<Series> getAllSeriesByStudyKey(Long studyKey) {
        Study study = studyRepository.findById(studyKey)
                .orElseThrow(() -> new EntityNotFoundException("Study not found with key: " + studyKey));

        return study.getListOfSeries();
    }
}
