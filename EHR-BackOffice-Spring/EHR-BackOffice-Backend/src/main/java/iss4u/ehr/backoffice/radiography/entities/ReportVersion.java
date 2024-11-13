package iss4u.ehr.backoffice.radiography.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import javax.persistence.*;
import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Getter
@Setter
@Entity
@Table(name = "ReportVersion")
public class ReportVersion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Report_Version_Ky", nullable = false)
    private Long reportVersionKy;

    @Column(name = "Report_Version_Label", nullable = false)
    private String reportVersionLabel;

    @Column(name = "Report_Version_Type", nullable = false)
    private String reportVersionType;

    @Column(name = "Report_Version_Comment", length = 1000)
    private String reportVersionComment;

    @Column(name = "Report_Version_Impression", length = 1000)
    private String reportVersionImpression;

    @Column(name = "Report_Version_findings", length = 1000)
    private String reportVersionFindings;

    @Column(name = "Report_Version_path")
    private String reportVersionPath;

    @Column(name = "Report_Version_status", nullable = false)
    private String reportVersionStatus;

    @Column(name = "Report_Version_Signed")
    private Boolean reportVersionSigned;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "Report_Version_UnxTmSign")
    private Date reportVersionUnxTmSign;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "Report_Version_UnxTmCrt", nullable = false)
    private Date reportVersionUnxTmCrt;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "Report_Version_UnxTmUpdt", nullable = false)
    private Date reportVersionUnxTmUpdt;

    @Column(name = "Report_Version_RcrdSts", nullable = false)
    private Integer reportVersionRcrdSts;

    // RelationShip...

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "Report_Ref")
    private Report report;
}

