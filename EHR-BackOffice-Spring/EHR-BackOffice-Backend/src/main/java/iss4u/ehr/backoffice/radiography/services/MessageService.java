package iss4u.ehr.backoffice.radiography.services;

import iss4u.ehr.backoffice.radiography.entities.Message;
import iss4u.ehr.backoffice.radiography.human_resources.entities.User;

import java.util.List;

public interface MessageService {
    public Message saveMessage(Message message);
    public List<Message> getMessagesBetweenUsers(User sender, User receiver);
}
