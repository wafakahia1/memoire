package iss4u.ehr.backoffice.radiography.human_resources.controllers;

import iss4u.ehr.backoffice.radiography.human_resources.entities.Patient;
import iss4u.ehr.backoffice.radiography.human_resources.entities.RfrntPhysic;
import iss4u.ehr.backoffice.radiography.human_resources.repositories.RfrntPhysicRepository;
import iss4u.ehr.backoffice.radiography.human_resources.services.RfrntPhysicService;
import iss4u.ehr.backoffice.radiography.entities.Study;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.persistence.EntityNotFoundException;
import java.util.List;

@RestController
@RequestMapping("/radiography/rfrnt-physic")
public class RfrntPhysicController {

    @Autowired
    private RfrntPhysicService rfrntPhysicService;
    @Autowired
    private RfrntPhysicRepository rfrntPhysicRepository;

    @PostMapping
    public RfrntPhysic createRfrntPhysic(@RequestBody RfrntPhysic rfrntPhysic) {
        return rfrntPhysicRepository.save(rfrntPhysic);
    }
    @GetMapping
    public List<RfrntPhysic> getAllRfrntPhysicians() {
        return rfrntPhysicService.retrieveRfrntPhysicians();
    }

    @GetMapping("/{rfrntPhysicId}/studies")
    public List<Study> getStudiesByRfrntPhysicId(@PathVariable Long rfrntPhysicId) {
        return rfrntPhysicService.getStudiesByRfrntPhysicKy(rfrntPhysicId);
    }

    @GetMapping("/{rfrntPhysicId}/patients")
    public List<Patient> getPatientsByRfrntPhysicId(@PathVariable Long rfrntPhysicId) {
        return rfrntPhysicService.getPatientsByRfrntPhysicKy(rfrntPhysicId);
    }

    @GetMapping("/{rfrntPhysicId}/shared-studies")
    public List<Study> getSharedStudiesByRfrntPhysicId(@PathVariable Long rfrntPhysicId) {
        return rfrntPhysicService.getSharedStudiesByRfrntPhysicKy(rfrntPhysicId);
    }

    @PostMapping("/shareExams/{rfrntPhysicKy}")
    public RfrntPhysic shareExamsWithRfrntPhysic(@RequestBody List<Study> studies, @PathVariable Long rfrntPhysicKy) {
        return rfrntPhysicService.shareExamsWithRfrntPhysic(studies, rfrntPhysicKy);
    }

    @GetMapping("/{userKy}")
    public RfrntPhysic getRfrntPhysicByKy(@PathVariable Long userKy) {
        return rfrntPhysicService.getRfrntPhysicByKy(userKy);
    }

}
