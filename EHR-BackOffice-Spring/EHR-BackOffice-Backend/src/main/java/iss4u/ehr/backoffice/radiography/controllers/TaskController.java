package iss4u.ehr.backoffice.radiography.controllers;

import iss4u.ehr.backoffice.radiography.human_resources.entities.User;
import iss4u.ehr.backoffice.radiography.human_resources.repositories.UserRepository;
import iss4u.ehr.backoffice.radiography.entities.Task;
import iss4u.ehr.backoffice.radiography.services.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/radiography/tasks")
public class TaskController {
    @Autowired
    private TaskService taskService;

    @Autowired
    private UserRepository userRepository;

    @PostMapping
    public ResponseEntity<Task> createTask(@RequestBody Task task) {
        taskService.create(task);
        return new ResponseEntity<>(task, HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<Task>> getAllTasks() {
        List<Task> tasks = taskService.retrieveTasks();
        return new ResponseEntity<>(tasks, HttpStatus.OK);
    }

    @GetMapping("/{taskKy}")
    public ResponseEntity<Task> getTaskById(@PathVariable Long taskKy) {
        Optional<Task> task = taskService.getTaskByKy(taskKy);
        return task.map(value -> new ResponseEntity<>(value, HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @PutMapping("/{taskKy}")
    public ResponseEntity<Void> updateTask(@PathVariable Long taskKy, @RequestBody Task updatedTask) {
        taskService.update(taskKy, updatedTask);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @DeleteMapping("/{taskKy}")
    public ResponseEntity<Void> deleteTask(@PathVariable Long taskKy) {
        taskService.delete(taskKy);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @GetMapping("/tasksByUser/{userKy}")
    public List<Task> getTaskByUserKy(@PathVariable Long userKy) {
        return taskService.getTaskByUserKy(userKy);
    }

    @GetMapping("/assignedTo/{userKy}")
    public ResponseEntity<List<Task>> getTasksAssignedToUser(@PathVariable Long userKy) {
        User user = userRepository.findByUserKy(userKy);
        if (user == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        List<Task> tasks = taskService.getTasksAssignedToUser(user);
        return new ResponseEntity<>(tasks, HttpStatus.OK);
    }
}

