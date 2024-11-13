package iss4u.ehr.backoffice.radiography.human_resources.services.implementation;

import iss4u.ehr.backoffice.radiography.entities.SharedExamLink;
import iss4u.ehr.backoffice.radiography.human_resources.entities.Patient;
import iss4u.ehr.backoffice.radiography.human_resources.entities.RfrntPhysic;
import iss4u.ehr.backoffice.radiography.human_resources.repositories.RfrntPhysicRepository;
import iss4u.ehr.backoffice.radiography.human_resources.services.RfrntPhysicService;
import iss4u.ehr.backoffice.radiography.entities.Study;
import iss4u.ehr.backoffice.radiography.repositories.SharedExamLinkRepository;
import iss4u.ehr.backoffice.radiography.repositories.StudyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.ArrayList;
import java.util.List;

@Service
public class RfrntPhysicServiceImpl implements RfrntPhysicService {
    private final RfrntPhysicRepository rfrntPhysicRepository;
    private final StudyRepository studyRepository;
    private final SharedExamLinkRepository sharedExamLinkRepository;
    @Autowired
    public RfrntPhysicServiceImpl(RfrntPhysicRepository rfrntPhysicRepository, StudyRepository studyRepository, SharedExamLinkRepository sharedExamLinkRepository) {
        this.rfrntPhysicRepository = rfrntPhysicRepository;
        this.studyRepository = studyRepository;
        this.sharedExamLinkRepository = sharedExamLinkRepository;
    }

    @Override
    public List<RfrntPhysic> retrieveRfrntPhysicians() {
        return rfrntPhysicRepository.findAll();
    }

    @Override
    public List<Study> getStudiesByRfrntPhysicKy(Long rfrntPhysicKy) {
        RfrntPhysic rfrntPhysic = rfrntPhysicRepository.findById(rfrntPhysicKy).orElseThrow(() -> new EntityNotFoundException("Physician with id " + rfrntPhysicKy + " not found"));
        if (rfrntPhysic != null) {
            return rfrntPhysic.getStudies();
        }
        return null;
    }

    @Override
    public List<Patient> getPatientsByRfrntPhysicKy(Long rfrntPhysicKy) {
        RfrntPhysic rfrntPhysic = rfrntPhysicRepository.findById(rfrntPhysicKy).orElseThrow(() -> new EntityNotFoundException("Physician with id " + rfrntPhysicKy + " not found"));
        if (rfrntPhysic != null) {
            List<Study> studies = rfrntPhysic.getStudies();
            List<Patient> patients = new ArrayList<>();

            for (Study study : studies) {
                patients.add(study.getPatient());
            }

            return patients;
        }
        return null;
    }

    @Override
    public List<Study> getSharedStudiesByRfrntPhysicKy(Long rfrntPhysicKy) {
        RfrntPhysic rfrntPhysic = rfrntPhysicRepository.findById(rfrntPhysicKy)
                .orElseThrow(() -> new EntityNotFoundException("Physician with id " + rfrntPhysicKy + " not found"));

        if (rfrntPhysic != null) {
            List<SharedExamLink> sharedExamLinks = rfrntPhysic.getSharedExamLinks();
            List<Study> sharedStudies = new ArrayList<>();

            for (SharedExamLink sharedExamLink : sharedExamLinks) {
                if(sharedExamLink.getRfrntPhysic().equals(rfrntPhysic)){
                    sharedStudies.add(sharedExamLink.getStudy());
                }
            }
            return sharedStudies;
        }
        return null;
    }

    @Override
    public RfrntPhysic shareExamsWithRfrntPhysic(List<Study> studies, Long rfrntPhysicKy) {
        RfrntPhysic rfrntPhysic = rfrntPhysicRepository.findById(rfrntPhysicKy)
                .orElseThrow(() -> new EntityNotFoundException("Physician with id " + rfrntPhysicKy + " not found"));

        List<SharedExamLink> sharedExamLinks = sharedExamLinkRepository.findAll();

        if (rfrntPhysic != null) {
            for (Study study : studies) {
                boolean alreadyShared = rfrntPhysic.getSharedExamLinks().stream()
                        .anyMatch(sharedExamL -> sharedExamL.getStudy().equals(study));

                if(!alreadyShared){
                    SharedExamLink sharedExamLink = new SharedExamLink();
                    sharedExamLink.setRfrntPhysic(rfrntPhysic);
                    sharedExamLink.setStudy(study);
                    sharedExamLinkRepository.save(sharedExamLink);
                    }
                }
            rfrntPhysicRepository.save(rfrntPhysic);
            }

        return rfrntPhysic;
    }

    @Override
    public RfrntPhysic getRfrntPhysicByKy(Long userKy) {
        return rfrntPhysicRepository.findById(userKy).orElseThrow(() -> new EntityNotFoundException("Physician with id " + userKy + " not found"));
    }
}
