package iss4u.ehr.backoffice.radiography.human_resources.services.implementation;

import iss4u.ehr.backoffice.radiography.human_resources.entities.User;
import iss4u.ehr.backoffice.radiography.human_resources.repositories.UserRepository;
import iss4u.ehr.backoffice.radiography.human_resources.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    private final UserRepository userRepository;

    @Autowired
    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public List<User> retrieveUsers() {
        return userRepository.findAll();
    }
}
