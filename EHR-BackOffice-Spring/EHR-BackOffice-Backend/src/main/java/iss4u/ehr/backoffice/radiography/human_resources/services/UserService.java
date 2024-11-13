package iss4u.ehr.backoffice.radiography.human_resources.services;

import iss4u.ehr.backoffice.radiography.human_resources.entities.User;

import java.util.List;

public interface UserService {
    List<User> retrieveUsers();
}
