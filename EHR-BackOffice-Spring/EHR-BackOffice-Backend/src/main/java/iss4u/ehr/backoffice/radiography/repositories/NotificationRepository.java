package iss4u.ehr.backoffice.radiography.repositories;

import iss4u.ehr.backoffice.radiography.human_resources.entities.User;
import iss4u.ehr.backoffice.radiography.entities.Notification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NotificationRepository extends JpaRepository<Notification, Long> {
    List<Notification> findByRecipient(User recipient);
    Notification findByNotificationKy(Long notificationKy);
}
