package iss4u.ehr.backoffice.radiography.human_resources.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import iss4u.ehr.backoffice.radiography.entities.Notification;
import iss4u.ehr.backoffice.radiography.entities.Task;
import lombok.*;
import javax.persistence.*;
import java.util.Date;
import java.util.List;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Getter
@Setter
@Entity
@Table(name = "User")
public class User {
    @Id

    @Column(name="User_Ky", nullable=false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long userKy;

    @Lob
    @Column(name="User_Image")
    private String userImage;

    @Column(name="Last_Name", nullable=false)
    private String lastName;

    @Column(name="First_Name", nullable=false)
    private String firstName;

    @Column(name="User_Name", nullable=false, unique = true)
    private String userName;

    @Column(name="User_Password", nullable=false)
    private String userPassword;

    @Column(name="User_Id", nullable=false, unique = true) // unique identifier (ssn)
    private String userId ;

    @Column(name="Maiden_Name")
    private String maidenName;

    @Column(name="Birth_Date", nullable=false)
    private Date birthDate;

    @Column(name="Gender", nullable=false)
    private String gender;

    @Column(name="civil_status", nullable=false)
    private String cvlStatus;

    @Column(name="nationality")
    private String nationality;

    @Column(name="User_Role", nullable=false)
    private String userRole;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="User_UnxTmCrt", nullable=false)
    private Date userUnxTmCrt ;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="User_UnxTmUpdt", nullable=false)
    private Date userUnxTmUpdt;

    @Column(name="User_RcrdSts", nullable=false)
    private Integer userRcrdSts ;

    @JsonIgnore
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
    private List<Task> tasks ;

    // Define a relationship between User and Notification
    @JsonIgnore
    @OneToMany(mappedBy = "recipient", cascade = CascadeType.ALL)
    private List<Notification> notifications;
}
