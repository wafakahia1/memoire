package iss4u.ehr.backoffice.radiography.services;

import iss4u.ehr.backoffice.radiography.entities.Object;

import java.util.List;
import java.util.Optional;

public interface ObjectService {

    void create(Object object);

    List<Object> retrieveObjects();

    Optional<Object> getObjectByKy(Long objectKy);

    void update(Long objectKy, Object updatedObject);

    void updateObjResult(Long objectKy, String result);

    void delete(Long objectKy);
}
