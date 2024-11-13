package iss4u.ehr.backoffice.radiography.controllers;

import iss4u.ehr.backoffice.radiography.entities.Object;
import iss4u.ehr.backoffice.radiography.services.ObjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.persistence.EntityNotFoundException;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/radiography/object")
public class ObjectController {
    @Autowired
    private ObjectService objectService;

    @PostMapping
    public ResponseEntity<Object> createObject(@RequestBody Object object) {
        objectService.create(object);
        return new ResponseEntity<>(object, HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<Object>> getAllObjects() {
        List<Object> objects = objectService.retrieveObjects();
        return new ResponseEntity<>(objects, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Object> getObjectById(@PathVariable("id") Long objectId) {
        Optional<Object> objects = objectService.getObjectByKy(objectId);
        return objects.map(value -> new ResponseEntity<>(value, HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @PutMapping("/{objectKy}")
    public ResponseEntity<Object> updateObject(@PathVariable Long objectKy, @RequestBody Object updatedObject) {
        try {
            objectService.update(objectKy, updatedObject);
            return ResponseEntity.ok().build(); // Return 200 (OK) without a body
        } catch (EntityNotFoundException ex) {
            return ResponseEntity.notFound().build();
        } catch (Exception ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<HttpStatus> deleteObject(@PathVariable("id") Long objectId) {
        Optional<Object> optionalObject = objectService.getObjectByKy(objectId);
        if (optionalObject.isPresent()) {
            objectService.delete(objectId);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PutMapping("/{objectKy}/updateResult")
    public ResponseEntity<Object> updateObjectResult(@PathVariable Long objectKy, @RequestBody String result) {
        try {
            objectService.updateObjResult(objectKy, result);
            return ResponseEntity.ok().build(); // Return 200 (OK) without a body
        } catch (EntityNotFoundException ex) {
            return ResponseEntity.notFound().build();
        } catch (Exception ex) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
}
