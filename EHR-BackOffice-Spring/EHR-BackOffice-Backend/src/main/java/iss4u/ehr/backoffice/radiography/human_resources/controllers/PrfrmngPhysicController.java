package iss4u.ehr.backoffice.radiography.human_resources.controllers;

import iss4u.ehr.backoffice.radiography.human_resources.entities.PrfrmngPhysic;
import iss4u.ehr.backoffice.radiography.human_resources.repositories.PrfrmngPhysicRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/radiography/prfrmng-physic")
public class PrfrmngPhysicController {

    @Autowired
    private PrfrmngPhysicRepository prfrmngPhysicRepository;

    @PostMapping
    public ResponseEntity<PrfrmngPhysic> createPrfrmngPhysic(@RequestBody PrfrmngPhysic prfrmngPhysic) {
        prfrmngPhysicRepository.save(prfrmngPhysic);
        return new ResponseEntity<>(prfrmngPhysic, HttpStatus.CREATED);
    }
    @GetMapping
    public List<PrfrmngPhysic> getAllPrfrmngPhysicians() {
        return prfrmngPhysicRepository.findAll();
    }
}
