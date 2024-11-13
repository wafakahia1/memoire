package iss4u.ehr.backoffice.radiography.controllers;

import iss4u.ehr.backoffice.radiography.entities.Message;
import iss4u.ehr.backoffice.radiography.human_resources.entities.User;
import iss4u.ehr.backoffice.radiography.human_resources.repositories.UserRepository;
import iss4u.ehr.backoffice.radiography.services.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.web.bind.annotation.*;

import javax.persistence.EntityNotFoundException;
import java.util.List;

@RestController
@RequestMapping("/messages")
public class MessageController {

    @Autowired
    private MessageService messageService;

    @Autowired
    private UserRepository userRepository;

    @PostMapping("/send")
    public ResponseEntity<Message> sendMessage(@RequestBody Message message) {
        Message savedMessage = messageService.saveMessage(message);
        return new ResponseEntity<>(savedMessage, HttpStatus.CREATED);
    }

    @GetMapping("/between/{senderId}/{receiverId}")
    public ResponseEntity<List<Message>> getMessagesBetweenUsers(@PathVariable Long senderId, @PathVariable Long receiverId) {

        User sender = userRepository.findById(senderId).orElseThrow(() -> new EntityNotFoundException("User not found"));
        User receiver = userRepository.findById(receiverId).orElseThrow(() -> new EntityNotFoundException("User not found"));

        List<Message> messages = messageService.getMessagesBetweenUsers(sender, receiver);
        return new ResponseEntity<>(messages, HttpStatus.OK);
    }

}
