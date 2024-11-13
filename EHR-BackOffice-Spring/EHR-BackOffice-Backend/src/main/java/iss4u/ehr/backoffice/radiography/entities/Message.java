package iss4u.ehr.backoffice.radiography.entities;

import iss4u.ehr.backoffice.radiography.human_resources.entities.User;
import lombok.*;

import javax.persistence.*;
import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Getter
@Setter
@Entity
@Table(name = "Message")
public class Message {
    @Id
    @Column(name = "MessageKy", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long messageKy;

    @Column(name = "Content", nullable = false)
    private String content;

    @ManyToOne
    private User sender;

    @ManyToOne
    private User receiver;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="Sent_Date", nullable=false)
    private Date sentDate;
}
