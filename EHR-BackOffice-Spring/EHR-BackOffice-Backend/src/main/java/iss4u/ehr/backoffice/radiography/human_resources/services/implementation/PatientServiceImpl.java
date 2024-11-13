package iss4u.ehr.backoffice.radiography.human_resources.services.implementation;

import iss4u.ehr.backoffice.radiography.human_resources.entities.Patient;
import iss4u.ehr.backoffice.radiography.human_resources.repositories.PatientRepository;
import iss4u.ehr.backoffice.radiography.human_resources.services.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.List;
import java.util.Optional;

@Service
public class PatientServiceImpl implements PatientService {
    private final PatientRepository patientRepository;

    @Autowired
    public PatientServiceImpl(PatientRepository patientRepository) {
        this.patientRepository = patientRepository;
    }

    @Override
    public Patient create(Patient patient) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        // Hash the password
        String password = encoder.encode(patient.getUserPassword());
        patient.setUserPassword(password);

        patientRepository.save(patient);
        return patient;
    }

    @Override
    public List<Patient> retrievePatients() {
        return patientRepository.findByUserRcrdSts(1);
    }

    @Override
    public Optional<Patient> getPatientByKy(Long patientKy) {
        return patientRepository.findById(patientKy);
    }

    @Override
    public Patient update(Long patientKy, Patient updatedPatient) {
        Patient existingPatient = patientRepository.findById(patientKy)
                .orElseThrow(() -> new EntityNotFoundException("Patient with id " + patientKy + " not found"));

        // Update the properties
        existingPatient.setUserImage(updatedPatient.getUserImage());
        existingPatient.setFirstName(updatedPatient.getFirstName());
        existingPatient.setLastName(updatedPatient.getLastName());
        existingPatient.setCvlStatus(updatedPatient.getCvlStatus());
        existingPatient.setMaidenName(updatedPatient.getMaidenName());
        existingPatient.setNationality(updatedPatient.getNationality());
        existingPatient.setGender(updatedPatient.getGender());
        existingPatient.setBirthDate(updatedPatient.getBirthDate());
        existingPatient.setUserUnxTmUpdt(updatedPatient.getUserUnxTmUpdt());

        existingPatient.setUserName(updatedPatient.getUserName());

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        // Hash the password
        String password = encoder.encode(updatedPatient.getUserPassword());
        existingPatient.setUserPassword(password);

        existingPatient.setUserId(updatedPatient.getUserId());

        patientRepository.save(existingPatient);

        return existingPatient;
    }

    @Override
    public void delete(Long patientKy) {
        Patient patient = patientRepository.findByUserKy(patientKy);
        patient.setUserRcrdSts(0);
        patientRepository.save(patient);
    }
}
