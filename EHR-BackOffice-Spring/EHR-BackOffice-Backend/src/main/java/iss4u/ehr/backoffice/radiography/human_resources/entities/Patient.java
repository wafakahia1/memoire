package iss4u.ehr.backoffice.radiography.human_resources.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import iss4u.ehr.backoffice.radiography.entities.Study;
import lombok.*;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Getter
@Setter
@Entity
@Table(name = "Patient")
@EqualsAndHashCode(callSuper = false)
public class Patient extends User {

    @JsonIgnore
    @OneToMany(mappedBy = "patient")
    private List<Study> studies;
}
