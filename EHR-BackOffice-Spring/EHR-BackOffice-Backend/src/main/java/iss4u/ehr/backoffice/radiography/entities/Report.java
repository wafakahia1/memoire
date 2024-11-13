package iss4u.ehr.backoffice.radiography.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
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
@Table(name = "Report")
public class Report {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="Report_Ky", nullable=false)
    private Long reportKy ;

    @Column(name="Report_Label", nullable=false)
    private String reportLabel ;

    @Column(name="Report_Type", nullable=false)
    private String reportType ; // text record

    @Column(name="Report_Comment", length = 1000)
    private String reportComment ;

    @Column(name="Report_Impression", length = 1000)
    private String reportImpression ;

    @Column(name="Report_findings", length = 1000)
    private String reportFindings ;

    @Lob
    @Column(name = "Report_path")
    private String reportPath;

    @Column(name="Report_status", nullable=false)
    private String reportStatus ; // DRAFT OR FINAL

    @Column(name="Report_version")
    private String reportVersion ;

    @Column(name="Report_Signed")
    private Boolean isSigned ;

    @Column(name="Report_Access_Nmbr")
    private Integer reportAccessNmbr ; // 0 or 1

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="Report_UnxTmSign")
    private Date reportUnxTmSign ;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="Report_UnxTmCrt", nullable=false)
    private Date reportUnxTmCrt ;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="Report_UnxTmUpdt", nullable=false)
    private Date reportUnxTmUpdt;

    @Column(name="Report_RcrdSts", nullable=false)
    private Integer reportRcrdSts ;

    @Column(name="Generated_By")
    private Long generatorKy ; // invited radio key

    // REPORT RELATIONSHIP

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "Study_Ref")
    private Study study;

    @OneToMany(mappedBy = "report", cascade = CascadeType.ALL)
    private List<Object> objects ;

    @OneToMany(mappedBy = "report", cascade = CascadeType.ALL)
    private List<ReportVersion> reportVersions;

    @PrePersist
    public void prePersist() {
        this.reportVersion = "0.0";
        this.isSigned = false;
    }

    @PreUpdate
    public void preUpdate() {
         // Split the version into major and minor parts
            String[] parts = this.reportVersion.split("\\.");
            int major = Integer.parseInt(parts[0]);
            int minor = Integer.parseInt(parts[1]);

            // Increment the minor part and update the version
            minor++;
            this.reportVersion = major + "." + minor;
        }
}
