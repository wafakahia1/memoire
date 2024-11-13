package iss4u.ehr.backoffice.radiography.human_resources.services;

import iss4u.ehr.backoffice.radiography.human_resources.entities.Patient;

import java.util.List;
import java.util.Optional;

public interface PatientService {

    Patient create(Patient patient);

    List<Patient> retrievePatients();

    Optional<Patient> getPatientByKy(Long patientKy);

    Patient update(Long patientKy, Patient updatedPatient);

    void delete(Long patientKy);

}
