package iss4u.ehr.backoffice.radiography.controllers;

import iss4u.ehr.backoffice.radiography.human_resources.entities.User;
import iss4u.ehr.backoffice.radiography.human_resources.repositories.UserRepository;
import iss4u.ehr.backoffice.radiography.entities.Notification;
import iss4u.ehr.backoffice.radiography.repositories.NotificationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/notifications")
public class NotificationController {

    @Autowired
    private NotificationRepository notificationRepository;

    @Autowired
    private UserRepository userRepository;

    @GetMapping
    public List<Notification> getAllNotifications() {
        return notificationRepository.findAll();
    }

    @GetMapping("/user/{userKy}")
    public List<Notification> getNotificationsByUser(@PathVariable Long userKy) {
        User user = userRepository.findByUserKy(userKy);
        if (user != null) {
            return notificationRepository.findByRecipient(user);
        } else {
            return new ArrayList<>();
        }
    }

    @PutMapping("/{notificationKy}")
    public ResponseEntity<Notification> markNotificationAsRead(@PathVariable Long notificationKy) {
        Notification notification = notificationRepository.findByNotificationKy(notificationKy);
        if (notification != null) {
            notification.setNotificationStatus(true);
            notificationRepository.save(notification);
            return new ResponseEntity<>(notification, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping
    public ResponseEntity<Notification> createNotification(@RequestBody Notification notification) {
        Notification savedNotification = notificationRepository.save(notification);
        return new ResponseEntity<>(savedNotification, HttpStatus.CREATED);
    }


}
