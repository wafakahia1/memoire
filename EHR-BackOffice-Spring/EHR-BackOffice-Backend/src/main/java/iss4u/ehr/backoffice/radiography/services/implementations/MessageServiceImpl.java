package iss4u.ehr.backoffice.radiography.services.implementations;

import iss4u.ehr.backoffice.radiography.entities.Message;
import iss4u.ehr.backoffice.radiography.human_resources.entities.User;
import iss4u.ehr.backoffice.radiography.repositories.MessageRepository;
import iss4u.ehr.backoffice.radiography.services.MessageService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {

    private final MessageRepository messageRepository;

    public MessageServiceImpl(MessageRepository messageRepository) {
        this.messageRepository = messageRepository;
    }

    @Override
    public Message saveMessage(Message message) {
        return messageRepository.save(message);
    }

    @Override
    public List<Message> getMessagesBetweenUsers(User sender, User receiver) {
        return messageRepository.findBySenderAndReceiver(sender, receiver);
    }
}
