package iss4u.ehr.backoffice.radiography.human_resources.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import iss4u.ehr.backoffice.radiography.entities.Task;
import lombok.*;

import javax.persistence.*;
import java.util.*;

@AllArgsConstructor
@Data
@Getter
@Setter
@Entity
@Table(name = "Staff")
public class Staff extends User {

    // Constructeur : Appel de constructeur de la classe parente User
    public Staff() {
        super();
    }

    // the radiologist can assign a task to any staff member
    @JsonIgnore
    @OneToMany(mappedBy = "assignedTo", cascade = CascadeType.ALL)
    private List<Task> tasks ;

}
