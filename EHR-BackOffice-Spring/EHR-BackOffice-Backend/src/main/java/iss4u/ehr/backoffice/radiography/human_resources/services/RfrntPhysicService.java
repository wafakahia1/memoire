package iss4u.ehr.backoffice.radiography.human_resources.services;

import iss4u.ehr.backoffice.radiography.human_resources.entities.Patient;
import iss4u.ehr.backoffice.radiography.human_resources.entities.RfrntPhysic;
import iss4u.ehr.backoffice.radiography.entities.Study;

import java.util.List;

public interface RfrntPhysicService {
    List<RfrntPhysic> retrieveRfrntPhysicians();
    List<Study> getStudiesByRfrntPhysicKy(Long rfrntPhysicId);
    List<Patient> getPatientsByRfrntPhysicKy(Long rfrntPhysicId);
    List<Study> getSharedStudiesByRfrntPhysicKy(Long rfrntPhysicId);
    RfrntPhysic shareExamsWithRfrntPhysic(List<Study> studies,Long rfrntPhysicId);
    RfrntPhysic getRfrntPhysicByKy(Long userKy);
}
