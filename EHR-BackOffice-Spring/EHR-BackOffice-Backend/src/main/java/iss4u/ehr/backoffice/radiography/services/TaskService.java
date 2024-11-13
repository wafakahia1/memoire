package iss4u.ehr.backoffice.radiography.services;


import iss4u.ehr.backoffice.radiography.human_resources.entities.User;
import iss4u.ehr.backoffice.radiography.entities.Task;

import java.util.List;
import java.util.Optional;

public interface TaskService {

    void create(Task task);

    List<Task> retrieveTasks();

    List<Task> getTaskByUserKy(Long userKy);

    Optional<Task> getTaskByKy(Long taskKy);

    void update(Long taskKy, Task updatedTask);

    void delete(Long taskKy);

    List<Task> getTasksAssignedToUser(User user);
}
