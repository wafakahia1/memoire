package iss4u.ehr.backoffice.radiography.entities;

import iss4u.ehr.backoffice.radiography.human_resources.entities.RfrntPhysic;
import lombok.*;

import javax.persistence.*;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Getter
@Setter
@Entity
@Table(name = "SharedExamLink")
public class SharedExamLink {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="Shared_Exam_Ky", nullable=false)
    private Long sharedExamKy;

    @ManyToOne
    @JoinColumn(name = "exam_id")
    private Study study;

    @ManyToOne
    @JoinColumn(name = "rfrntphysic_id")
    private RfrntPhysic rfrntPhysic;
}
