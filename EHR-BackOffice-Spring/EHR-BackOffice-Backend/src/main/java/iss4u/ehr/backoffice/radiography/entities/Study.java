package iss4u.ehr.backoffice.radiography.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import iss4u.ehr.backoffice.radiography.human_resources.entities.Patient;
import iss4u.ehr.backoffice.radiography.human_resources.entities.PrfrmngPhysic;
import iss4u.ehr.backoffice.radiography.human_resources.entities.RfrntPhysic;
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
@Table(name = "Study")
public class Study {
    @Id

    @Column(name="Study_Ky", nullable=false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long studyKy;

    @Column(name="Study_Label", nullable=false, unique = true)
    private String studyLabel;

    @Column(name="Study_Desc", nullable=false)
    private String studyDesc ;

    @Column(name="Study_Comment", nullable=false)
    private String studyComment ;

    @Column(name="Study_AETitle", nullable=false)
    private String studyAetitle ;

    @Column(name="Study_Type", nullable=false)
    private String studyType;

    @Column(name="Study_Status", nullable=false)
    private String studyStatus;

    @Column(name="Study_Priority", nullable=false)
    private String studyPriority;

    @Column(name="Study_Note", columnDefinition="TEXT")
    private String studyNote;

    @Column(name="Study_Date")
    private Date studyDate;

//    @Column(name="End_Date")
//    private Date endDate;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="Study_UnxTmCrt", nullable=false)
    private Date studyUnxTmCrt ;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="Study_UnxTmUpdt", nullable=false)
    private Date studyUnxTmUpdt;

    @Column(name="Study_RcrdSts", nullable=false)
    private Integer studyRcrdSts ;


    // STUDY RELATIONSHIP

    @OneToMany(mappedBy = "study", cascade = CascadeType.ALL)
    private List<Series> listOfSeries ;

    @OneToMany(mappedBy = "study", cascade = CascadeType.ALL)
    private List<Report> reports ;

    @ManyToOne
    @JoinColumn(name = "RfrntPhysic_Ref", referencedColumnName = "User_Ky")
    private RfrntPhysic rfrntPhysic;

    @ManyToOne
    @JoinColumn(name = "PrfrmngPhysic_Ref", referencedColumnName = "User_Ky")
    private PrfrmngPhysic prfrmngPhysic;

    @ManyToOne
    @JoinColumn(name = "Patient_Ref", referencedColumnName = "User_Ky")
    private Patient patient;

    @JsonIgnore
    @OneToMany(mappedBy = "study")
    private List<SharedExamLink> sharedExamLinks;

}
