package iss4u.ehr.backoffice.radiography.services.implementations;

import iss4u.ehr.backoffice.radiography.human_resources.entities.User;
import iss4u.ehr.backoffice.radiography.human_resources.repositories.UserRepository;
import iss4u.ehr.backoffice.radiography.entities.Notification;
import iss4u.ehr.backoffice.radiography.entities.Task;
import iss4u.ehr.backoffice.radiography.repositories.NotificationRepository;
import iss4u.ehr.backoffice.radiography.repositories.TaskRepository;
import iss4u.ehr.backoffice.radiography.services.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class TaskServiceImpl implements TaskService {

    private final TaskRepository taskRepository;

    private final UserRepository userRepository;

    private final NotificationRepository notificationRepository;

    @Autowired
    public TaskServiceImpl(TaskRepository taskRepository, UserRepository userRepository, NotificationRepository notificationRepository) {
        this.taskRepository = taskRepository;
        this.userRepository = userRepository;
        this.notificationRepository = notificationRepository;
    }


    @Override
    public void create(Task task) {
       taskRepository.save(task);
        Notification notification = new Notification();
        notification.setNotificationMessage("You have been assigned a new task!");
        notification.setNotificationStatus(false);
        notification.setNotificationUnxTmCrt(new Date());
        if(task.getAssignedTo() != null){
            notification.setRecipient(task.getAssignedTo());
        }
        notification.setNotificationColor("nfc-orange");
        notification.setNotificationIcon("event_available");
        notificationRepository.save(notification);
    }

    @Override
    public List<Task> retrieveTasks() {
        return taskRepository.findAll();
    }

    @Override
    public List<Task> getTaskByUserKy(Long userKy) {
        User user = userRepository.findById(userKy)
                .orElseThrow(() -> new EntityNotFoundException("User with id " + userKy + " not found"));

        return user.getTasks();
    }

    @Override
    public Optional<Task> getTaskByKy(Long taskKy) {
        return taskRepository.findById(taskKy);
    }

    @Override
    public void update(Long taskKy, Task updatedTask) {
        Task existingTask = taskRepository.findById(taskKy)
                .orElseThrow(() -> new EntityNotFoundException("Task with id " + taskKy + " not found"));

        // Update the properties
        existingTask.setTaskKy(taskKy);

        if(updatedTask.getTaskTitle() != null ){
            existingTask.setTaskTitle(updatedTask.getTaskTitle());
        }

        if(updatedTask.getTaskPriority() != null ){
            existingTask.setTaskPriority(updatedTask.getTaskPriority());
        }

        if(updatedTask.getDueDate() != null ){
            existingTask.setDueDate(updatedTask.getDueDate());
        }

        if(updatedTask.getEventDetails() != null ){
            existingTask.setEventDetails(updatedTask.getEventDetails());
        }

        if(updatedTask.getAssignedTo() != null ){
            existingTask.setAssignedTo(updatedTask.getAssignedTo());
        }

        if(updatedTask.getUser() != null ){
            existingTask.setUser(updatedTask.getUser());
        }

        if(updatedTask.getIsComplete() != null ){
            existingTask.setIsComplete(updatedTask.getIsComplete());
        }

        taskRepository.save(existingTask);
    }

    @Override
    public void delete(Long taskKy) {
        taskRepository.deleteById(taskKy);
    }

    public List<Task> getTasksAssignedToUser(User user) {
        return taskRepository.findByAssignedTo(user);
    }
}
