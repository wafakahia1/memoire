package iss4u.ehr.backoffice.radiography.services.implementations;

import iss4u.ehr.backoffice.radiography.entities.Object;
import iss4u.ehr.backoffice.radiography.repositories.ObjectRepository;
import iss4u.ehr.backoffice.radiography.services.ObjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class ObjectServiceImpl implements ObjectService {

    private final ObjectRepository objectRepository;

    @Autowired
    public ObjectServiceImpl(ObjectRepository objectRepository) {
        this.objectRepository = objectRepository;
    }

    @Override
    public void create(Object object) {
        objectRepository.save(object);
    }

    @Override
    public List<Object> retrieveObjects() {
        return objectRepository.findAll();
    }

    @Override
    public Optional<Object> getObjectByKy(Long objectKy) {
        return objectRepository.findById(objectKy);
    }

    @Override
    public void update(Long objectKy, Object updatedObject) {
        Object existingObject = objectRepository.findById(objectKy)
                .orElseThrow(() -> new EntityNotFoundException("Object with id " + objectKy + " not found"));

        // Update the properties
        existingObject.setObjectLabel(updatedObject.getObjectLabel());
        existingObject.setObjectPath(updatedObject.getObjectPath());
        existingObject.setObjectTp(updatedObject.getObjectTp());
        existingObject.setObjectUnxTmUpdt(updatedObject.getObjectUnxTmUpdt());

        objectRepository.save(existingObject);
    }

    @Override
    public void updateObjResult(Long objectKy, String result) {
        Object existingObject = objectRepository.findById(objectKy)
                .orElseThrow(() -> new EntityNotFoundException("Object with id " + objectKy + " not found"));

        // Update the properties
        existingObject.setCovidResult(result);
        existingObject.setObjectUnxTmUpdt(new Date());

        objectRepository.save(existingObject);
    }

    @Override
    public void delete(Long objectKy) {
        objectRepository.deleteById(objectKy);
    }
}
