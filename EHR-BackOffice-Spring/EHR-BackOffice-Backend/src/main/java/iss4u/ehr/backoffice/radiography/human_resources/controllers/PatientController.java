package iss4u.ehr.backoffice.radiography.human_resources.controllers;

import iss4u.ehr.backoffice.radiography.human_resources.entities.Patient;
import iss4u.ehr.backoffice.radiography.human_resources.services.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/parameterization/patient")
public class PatientController {

    @Autowired
    private PatientService patientService;

    @PostMapping
    public ResponseEntity<Patient> createPatient(@RequestBody Patient patient) {
        // Assuming create method returns the created patient
        Patient createdPatient = patientService.create(patient);
        return ResponseEntity.status(HttpStatus.CREATED).body(createdPatient);
    }

    @GetMapping
    public ResponseEntity<List<Patient>> retrievePatients() {
        List<Patient> patients = patientService.retrievePatients();
        return new ResponseEntity<>(patients, HttpStatus.OK);
    }

    @GetMapping("/{patientKy}")
    public ResponseEntity<Patient> getPatientById(@PathVariable Long patientKy) {
        Optional<Patient> patient = patientService.getPatientByKy(patientKy);
        return patient.map(value -> new ResponseEntity<>(value, HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @PutMapping("/{patientKy}")
    public ResponseEntity<Patient> updatePatient(@PathVariable Long patientKy, @RequestBody Patient updatedPatient) {
        Patient updated = patientService.update(patientKy, updatedPatient);

        if (updated != null) {
            return ResponseEntity.ok(updated); // HttpStatus.OK
        } else {
            // Handle the case where the patient with the given ID is not found
            return ResponseEntity.notFound().build(); // HttpStatus.NOT_FOUND
        }
    }


    @DeleteMapping("/{patientKy}")
    public ResponseEntity<Void> deletePatient(@PathVariable Long patientKy) {
        patientService.delete(patientKy);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}
