package iss4u.ehr.backoffice.radiography.human_resources.controllers;

import iss4u.ehr.backoffice.radiography.human_resources.entities.User;
import iss4u.ehr.backoffice.radiography.human_resources.repositories.UserRepository;
import iss4u.ehr.backoffice.radiography.human_resources.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/users")
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepository;

    @GetMapping
    public ResponseEntity<List<User>> getAllUsers() {
        List<User> users = userService.retrieveUsers();
        return new ResponseEntity<>(users, HttpStatus.OK);
    }

    @GetMapping("/userName")
    public ResponseEntity<User> getUserByUserName(@RequestParam("userName") String userName) {
        User user = userRepository.findByUserName(userName);

        if (user != null) {
            return new ResponseEntity<>(user, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping("/getByUserKy/{userKy}")
    public ResponseEntity<User> getUserByUserKy(@PathVariable("userKy") Long userKy) {
        User user = userRepository.findByUserKy(userKy);

        if (user != null) {
            return new ResponseEntity<>(user, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}
