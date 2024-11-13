package iss4u.ehr.backoffice.radiography.config;

import iss4u.ehr.backoffice.parameterization.material_resources.repositories.EquipmentRepository;
import iss4u.ehr.backoffice.parameterization.material_resources.repositories.RoomGrpRepository;
import iss4u.ehr.backoffice.parameterization.material_resources.repositories.RoomRepository;
import iss4u.ehr.backoffice.parameterization.structure.entities.*;
import iss4u.ehr.backoffice.parameterization.structure.repositories.*;
import iss4u.ehr.backoffice.radiography.entities.Object;
import iss4u.ehr.backoffice.radiography.entities.Series;
import iss4u.ehr.backoffice.radiography.entities.Study;
import iss4u.ehr.backoffice.radiography.human_resources.entities.*;
import iss4u.ehr.backoffice.radiography.human_resources.repositories.*;
import iss4u.ehr.backoffice.radiography.repositories.ObjectRepository;
import iss4u.ehr.backoffice.radiography.repositories.SeriesRepository;
import iss4u.ehr.backoffice.radiography.repositories.StudyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import com.github.javafaker.Faker;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.TimeUnit;

@Component
public class DataInitializer implements ApplicationRunner {
    //radiology
    private final StudyRepository studyRepository;
    private final SeriesRepository seriesRepository;
    private final ObjectRepository objectRepository;
    //human resource
    private final StaffRepository staffRepository;
    private final RfrntPhysicRepository rfrntPhysicRepository;
    private final PrfrmngPhysicRepository prfrmngPhysicRepository;
    private final SecretaryRepository secretaryRepository;
    private final PatientRepository patientRepository;
    private final AdminRepository adminRepository;
    //structure
    private final SiteGrpRepository siteGrpRepository;
    private final SiteRepository siteRepository;
    private final ServiceRepository serviceRepository;
    private final ServiceAreaRepository serviceAreaRepository;
    private final ExploitationUnitRepository exploitationUnitRepository;
    //material resource
    private final RoomGrpRepository roomGrpRepository;
    private final RoomRepository roomRepository;
    private final EquipmentRepository equipmentRepository;

    @Autowired
    public DataInitializer(
            StaffRepository staffRepository1, StudyRepository studyRepository, SeriesRepository seriesRepository, RfrntPhysicRepository rfrntPhysicRepository, PrfrmngPhysicRepository prfrmngPhysicRepository, PatientRepository patientRepository, ObjectRepository objectRepository, SecretaryRepository secretaryRepository, AdminRepository adminRepository, SiteGrpRepository siteGrpRepository, SiteRepository siteRepository, ServiceRepository serviceRepository, ServiceAreaRepository serviceAreaRepository, ExploitationUnitRepository exploitationUnitRepository, RoomGrpRepository roomGrpRepository, RoomRepository roomRepository, EquipmentRepository equipmentRepository) {
        this.staffRepository = staffRepository1;
        this.studyRepository = studyRepository;
        this.seriesRepository = seriesRepository;
        this.rfrntPhysicRepository = rfrntPhysicRepository;
        this.prfrmngPhysicRepository = prfrmngPhysicRepository;
        this.patientRepository = patientRepository;
        this.objectRepository = objectRepository;
        this.secretaryRepository = secretaryRepository;
        this.adminRepository = adminRepository;
        this.siteGrpRepository = siteGrpRepository;
        this.siteRepository = siteRepository;
        this.serviceRepository = serviceRepository;
        this.serviceAreaRepository = serviceAreaRepository;
        this.exploitationUnitRepository = exploitationUnitRepository;
        this.roomGrpRepository = roomGrpRepository;
        this.roomRepository = roomRepository;
        this.equipmentRepository = equipmentRepository;
    }

    @Override
    public void run(ApplicationArguments args) {
        Faker faker = new Faker();

        List<String> imagesUrlFemale = new ArrayList<>();
        imagesUrlFemale.add("https://www.upgradebox.info/img/business-woman.png");
        imagesUrlFemale.add("https://th.bing.com/th/id/OIP.7IIei-KOE5vG6Y68f4wtzAHaE8?pid=ImgDet&w=612&h=408&rs=1");
        imagesUrlFemale.add("https://th.bing.com/th/id/OIP.uYww7za57z4nhRJY5fCjbAHaHa?pid=ImgDet&w=700&h=700&rs=1");
        imagesUrlFemale.add("https://th.bing.com/th/id/OIP._Mt2V3PdVLgAEhD6AGay0gAAAA?pid=ImgDet&w=420&h=442&rs=1");
        imagesUrlFemale.add("https://th.bing.com/th/id/OIP.0X4pFgekSrD_ZnVvb8v86QHaHv?pid=ImgDet&w=624&h=652&rs=1");


        List<String> imagesUrlMale = new ArrayList<>();
        imagesUrlMale.add("https://w7.pngwing.com/pngs/902/963/png-transparent-business-automobile-salesperson-human-resource-management-xing-business-blue-human-resource-management-people-thumbnail.png");
        imagesUrlMale.add("https://w7.pngwing.com/pngs/360/1018/png-transparent-businessperson-consultant-business-service-people-necktie-thumbnail.png");
        imagesUrlMale.add("https://p7.hiclipart.com/preview/344/1022/446/small-business-home-business-printing-wordpress-election-campaign-thumbnail.jpg");
        imagesUrlMale.add("https://p7.hiclipart.com/preview/836/129/84/stock-photography-arm-royalty-free-handsome-carriage-thumbnail.jpg");
        imagesUrlMale.add("https://psggroup.ru/wp-content/uploads/2017/11/home4_about.jpg");


        // S868724
        List<String> stack1 = new ArrayList<>();
        stack1.add("iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115108611_52_S868724_I1221049.dcm");
        stack1.add("iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115108623_47_S868724_I1221049.dcm");
        stack1.add("iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115109018_72_S868724_I1221049.dcm");
        stack1.add("iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115110416_58_S868724_I1221049.dcm");
        stack1.add("iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115112140_60_S868724_I1221049.dcm");
        stack1.add("iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115112215_45_S868724_I1221049.dcm");
        stack1.add("iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115112454_73_S868724_I1221049.dcm");
        stack1.add("iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115114340_79_S868724_I1221049.dcm");
        stack1.add("iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115114529_88_S868724_I1221049.dcm");
        stack1.add("iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115115192_48_S868724_I1221049.dcm");
        stack1.add("iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115115356_69_S868724_I1221049.dcm");
        stack1.add("iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115115864_53_S868724_I1221049.dcm");
        stack1.add("iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115117088_71_S868724_I1221049.dcm");
        stack1.add("iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115117207_81_S868724_I1221049.dcm");
        stack1.add("iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115118015_74_S868724_I1221049.dcm");
        stack1.add("iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115118222_54_S868724_I1221049.dcm");
        stack1.add("iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115118263_64_S868724_I1221049.dcm");
        stack1.add("iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115118575_86_S868724_I1221049.dcm");
        stack1.add("iss-4u.com/dicom/dataset01/ADNI4-DICOM-nano-10514/002_S_0413/Axial_3TE_T2_STAR/2019-08-27_09_39_37.0/S868724/ADNI_002_S_0413_MR_Axial_3TE_T2_STAR__br_raw_20190828115119407_49_S868724_I1221049.dcm");

        List<String> nationalities = new ArrayList<>();
        nationalities.add("American");
        nationalities.add("British");
        nationalities.add("Canadian");
        nationalities.add("French");
        nationalities.add("German");
        nationalities.add("Spanish");
        nationalities.add("Italian");
        nationalities.add("Japanese");
        nationalities.add("Chinese");
        nationalities.add("Indian");

        List<String> maritalStatusOptions = new ArrayList<>();
        maritalStatusOptions.add("Single");
        maritalStatusOptions.add("Married");
        maritalStatusOptions.add("Divorced");
        maritalStatusOptions.add("Widowed");
        maritalStatusOptions.add("Separated");
        maritalStatusOptions.add("Domestic Partnership");
        maritalStatusOptions.add("Annulled");
        maritalStatusOptions.add("Cohabiting");
        maritalStatusOptions.add("Common-Law Marriage");


        List<Staff> staffList = new ArrayList<>();
        for(int i = 0; i < 5; i++){
            Staff staff = new Staff();
            staff.setLastName(faker.name().lastName());
            staff.setFirstName(faker.name().firstName());
            staff.setUserName(faker.internet().emailAddress());
            // Create a BCryptPasswordEncoder
            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
            // Hash the password
            String password = encoder.encode("password");
            staff.setUserPassword(password);
            staff.setMaidenName(faker.name().lastName());
            staff.setBirthDate(faker.date().birthday());
            staff.setGender(faker.demographic().sex());

            if(staff.getGender().equals("Male")){
                staff.setUserImage(imagesUrlMale.get(faker.number().numberBetween(0, imagesUrlMale.size()-1)));
            }else{
                staff.setUserImage(imagesUrlFemale.get(faker.number().numberBetween(0, imagesUrlFemale.size()-1)));
            }

            staff.setCvlStatus(maritalStatusOptions.get(faker.number().numberBetween(0, maritalStatusOptions.size()-1)));
            staff.setNationality(nationalities.get(faker.number().numberBetween(0, nationalities.size()-1)));
            staff.setUserRole("Physician");
            staff.setUserUnxTmCrt(new Date());
            staff.setUserUnxTmUpdt(new Date());
            staff.setUserRcrdSts(faker.number().numberBetween(1, 2));
            // SSN
            int sexNum = Objects.equals(staff.getGender(), "Male") ? 1 : 2;
            String birthYear = String.valueOf(staff.getBirthDate().getYear());
            String birthMonth = String.format("%02d", staff.getBirthDate().getMonth());
            String birthDay = String.format("%02d", staff.getBirthDate().getDate());
            String identifier = String.valueOf(i);
            String ssn = sexNum +'-'+ birthYear +'-'+  birthMonth +'-'+  birthDay +'-'+  identifier;
            staff.setUserId(ssn);
            staffRepository.save(staff);
            staffList.add(staff);
        }

        List<Patient> patientList = new ArrayList<>();
        for(int i = 0; i < 20; i++) {
            Patient patient = new Patient();
            patient.setLastName(faker.name().lastName());
            patient.setFirstName(faker.name().firstName());
            patient.setUserName(faker.internet().emailAddress());
            // Create a BCryptPasswordEncoder
            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
            // Hash the password
            String password = encoder.encode("password");
            patient.setUserPassword(password);
            patient.setMaidenName(faker.name().lastName());
            patient.setBirthDate(faker.date().birthday());
            patient.setGender(faker.demographic().sex());
            if(patient.getGender().equals("Male")){
                patient.setUserImage(imagesUrlMale.get(faker.number().numberBetween(0, imagesUrlMale.size()-1)));
            }else{
                patient.setUserImage(imagesUrlFemale.get(faker.number().numberBetween(0, imagesUrlFemale.size()-1)));
            }
            patient.setCvlStatus(maritalStatusOptions.get(faker.number().numberBetween(0, maritalStatusOptions.size()-1)));
            patient.setNationality(nationalities.get(faker.number().numberBetween(0, nationalities.size()-1)));
            patient.setUserRole("Patient");
            patient.setUserUnxTmCrt(new Date());
            patient.setUserUnxTmUpdt(new Date());
            patient.setUserRcrdSts(faker.number().numberBetween(1, 2));
            // SSN
            int sexNum = Objects.equals(patient.getGender(), "Male") ? 1 : 2;
            String birthYear = String.format("%02d", patient.getBirthDate().getYear() % 100);
            String birthMonth = String.format("%02d", patient.getBirthDate().getMonth());
            String birthDay = String.format("%02d", patient.getBirthDate().getDate());
            String identifier = String.valueOf(i);
            String ssn = sexNum + "-" + birthYear + "-" + birthMonth + "-" + birthDay + "-" + identifier;
            patient.setUserId(ssn);
            patientRepository.save(patient);
            patientList.add(patient);
        }

        List<RfrntPhysic> rfrntPhysicList = new ArrayList<>();
        List<String> signatures = new ArrayList<>();
        signatures.add("https://www.freepnglogos.com/uploads/signature-png/signature-mohammad-png-19.png");
        signatures.add("https://2.bp.blogspot.com/-eh9Y_rw1oxs/WHvBWrFQeGI/AAAAAAAAAI4/ozizwcWAzakKIg1i6bbbXF8GRQiVODAMwCLcB/s1600/Screenshot_59.png");
        signatures.add("https://th.bing.com/th/id/OIP.PxLLLFR_tGzPnZ9ChYEVqwAAAA?pid=ImgDet&rs=1");
        signatures.add("https://th.bing.com/th/id/OIP.LFMIOeZxCqIrIYYkbv9LEQHaHA?pid=ImgDet&rs=1");
        signatures.add("https://editorial-adarve.com/wp-content/uploads/2020/05/firma-1024x733.jpg");

        List<String> specializations = new ArrayList<>();
        specializations.add("Neuroradiology");
        specializations.add("Musculoskeletal");
        specializations.add("Pediatric");
        specializations.add("Abdominal");
        specializations.add("Chest");
        specializations.add("Cardiovascular");
        specializations.add("Breast Imaging");
        specializations.add("Interventional");
        specializations.add("Nuclear Medicine");
        specializations.add("Emergency");
        specializations.add("Body Imaging");
        specializations.add("Gastrointestinal");
        specializations.add("Genitourinary");
        specializations.add("Head and Neck");
        specializations.add("Thoracic");
        specializations.add("Vascular");
        specializations.add("Women's Imaging");


        List<String> qualifications = new ArrayList<>();
        qualifications.add("Doctor of Medicine (M.D.)");
        qualifications.add("Doctor of Osteopathic Medicine (D.O.)");
        qualifications.add("Board Certified in Radiology");
        qualifications.add("Fellowship in Neuroradiology");
        qualifications.add("Fellowship in Musculoskeletal Radiology");
        qualifications.add("Fellowship in Pediatric Radiology");
        qualifications.add("Fellowship in Nuclear Medicine");
        qualifications.add("Interventional Radiology Certification");
        qualifications.add("Continuing Medical Education (CME)");
        qualifications.add("Research and Publications");
        qualifications.add("Hospital Privileges");

        for(int i = 0; i < 5; i++) {
            RfrntPhysic rfrntPhysic = new RfrntPhysic();
            rfrntPhysic.setLastName(faker.name().lastName());
            rfrntPhysic.setFirstName(faker.name().firstName());
            rfrntPhysic.setUserName(faker.internet().emailAddress());
            // Create a BCryptPasswordEncoder
            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
            // Hash the password
            String password = encoder.encode("password");
            rfrntPhysic.setUserPassword(password);
            rfrntPhysic.setMaidenName(faker.name().lastName());
            rfrntPhysic.setBirthDate(faker.date().birthday());
            rfrntPhysic.setGender(faker.demographic().sex());
            if(rfrntPhysic.getGender().equals("Male")){
                rfrntPhysic.setUserImage(imagesUrlMale.get(faker.number().numberBetween(0, imagesUrlMale.size()-1)));
            }else{
                rfrntPhysic.setUserImage(imagesUrlFemale.get(faker.number().numberBetween(0, imagesUrlFemale.size()-1)));
            }
            rfrntPhysic.setCvlStatus(maritalStatusOptions.get(faker.number().numberBetween(0, maritalStatusOptions.size()-1)));
            rfrntPhysic.setNationality(nationalities.get(faker.number().numberBetween(0, nationalities.size()-1)));
            rfrntPhysic.setUserRole("Radiologist");
            rfrntPhysic.setSignature(signatures.get(i));
            rfrntPhysic.setUserUnxTmCrt(new Date());
            rfrntPhysic.setUserUnxTmUpdt(new Date());
            rfrntPhysic.setUserRcrdSts(faker.number().numberBetween(1, 2));
            // SSN
            int sexNum = Objects.equals(rfrntPhysic.getGender(), "Male") ? 1 : 2;
            String birthYear = String.format("%02d", rfrntPhysic.getBirthDate().getYear() % 100);
            String birthMonth = String.format("%02d", rfrntPhysic.getBirthDate().getMonth());
            String birthDay = String.format("%02d", rfrntPhysic.getBirthDate().getDate());
            String identifier = String.valueOf(i);
            String ssn = sexNum + "-" + birthYear + "-" + birthMonth + "-" + birthDay + "-" + identifier;
            rfrntPhysic.setUserId(ssn);

            // Set the additional attributes
            rfrntPhysic.setEmployeeId("EMP-RAD" + i);
            rfrntPhysic.setQualification(qualifications.get(faker.number().numberBetween(0, qualifications.size()-1)));
            rfrntPhysic.setSpecialization(specializations.get(faker.number().numberBetween(0, specializations.size()-1)));
            rfrntPhysic.setDateOfHire(faker.date().birthday());

            rfrntPhysicRepository.save(rfrntPhysic);
            rfrntPhysicList.add(rfrntPhysic);
        }

        List<String> technologistQualifications = new ArrayList<>();
        technologistQualifications.add("Associate's Degree in Radiologic Technology");
        technologistQualifications.add("Certified Radiologic Technologist (CRT)");
        technologistQualifications.add("Registered Technologist in Radiography (R.T.(R))");

        List<String> technologistSpecializations = new ArrayList<>();
        technologistSpecializations.add("X-ray Technologist");
        technologistSpecializations.add("MRI Technologist");
        technologistSpecializations.add("CT Technologist");
        technologistSpecializations.add("Ultrasound Technologist");

        List<PrfrmngPhysic> prfrmngPhysicList = new ArrayList<>();
        for(int i = 0; i < 5; i++) {
            PrfrmngPhysic prfrmngPhysic = new PrfrmngPhysic();
            prfrmngPhysic.setLastName(faker.name().lastName());
            prfrmngPhysic.setFirstName(faker.name().firstName());
            prfrmngPhysic.setUserName(faker.internet().emailAddress());
            // Create a BCryptPasswordEncoder
            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
            // Hash the password
            String password = encoder.encode("password");
            prfrmngPhysic.setUserPassword(password);
            prfrmngPhysic.setMaidenName(faker.name().lastName());
            prfrmngPhysic.setBirthDate(faker.date().birthday());
            prfrmngPhysic.setGender(faker.demographic().sex());
            if(prfrmngPhysic.getGender().equals("Male")){
                prfrmngPhysic.setUserImage(imagesUrlMale.get(faker.number().numberBetween(0, imagesUrlMale.size()-1)));
            }else{
                prfrmngPhysic.setUserImage(imagesUrlFemale.get(faker.number().numberBetween(0, imagesUrlFemale.size()-1)));
            }
            prfrmngPhysic.setCvlStatus(maritalStatusOptions.get(faker.number().numberBetween(0, maritalStatusOptions.size()-1)));
            prfrmngPhysic.setNationality(nationalities.get(faker.number().numberBetween(0, nationalities.size()-1)));
            prfrmngPhysic.setUserRole("Technologist");
            prfrmngPhysic.setUserUnxTmCrt(new Date());
            prfrmngPhysic.setUserUnxTmUpdt(new Date());
            prfrmngPhysic.setUserRcrdSts(faker.number().numberBetween(1, 2));
            // SSN
            int sexNum = Objects.equals(prfrmngPhysic.getGender(), "Male") ? 1 : 2;
            String birthYear = String.format("%02d", prfrmngPhysic.getBirthDate().getYear() % 100);
            String birthMonth = String.format("%02d", prfrmngPhysic.getBirthDate().getMonth());
            String birthDay = String.format("%02d", prfrmngPhysic.getBirthDate().getDate());
            String identifier = String.valueOf(i);
            String ssn = sexNum + "-" + birthYear + "-" + birthMonth + "-" + birthDay + "-" + identifier;
            prfrmngPhysic.setUserId(ssn);

            // Set the additional attributes
            prfrmngPhysic.setEmployeeId("EMP-RAD-TECH" + i);
            prfrmngPhysic.setQualification(technologistQualifications.get(faker.number().numberBetween(0, technologistQualifications.size()-1)));
            prfrmngPhysic.setSpecialization(technologistSpecializations.get(faker.number().numberBetween(0, technologistSpecializations.size()-1)));
            prfrmngPhysic.setDateOfHire(faker.date().birthday());

            prfrmngPhysicRepository.save(prfrmngPhysic);
            prfrmngPhysicList.add(prfrmngPhysic);
        }


        List<Study> fakeStudies = new ArrayList<>();
        //Date currentDate = new Date(); // Get the current date
        LocalDate currentDate = LocalDate.now();
        for (int i = 0; i < 50; i++) {
            Study study = new Study();
            study.setStudyDesc(faker.lorem().sentence());
            study.setStudyComment(faker.lorem().sentence(10));
            study.setRfrntPhysic(rfrntPhysicList.get(faker.number().numberBetween(0, rfrntPhysicList.size()-1)));
            study.setPrfrmngPhysic(prfrmngPhysicList.get(faker.number().numberBetween(0, prfrmngPhysicList.size()-1)));
            study.setPatient(patientList.get(faker.number().numberBetween(0, patientList.size()-1)));
            study.setStudyAetitle("AETitle" + i);
            study.setStudyType(faker.options().option("XRAY", "CT_SCAN", "MRI", "ULTRASOUND", "PET_SCAN", "MAMMOGRAPHY"));
            study.setStudyPriority(faker.options().option("Low", "Normal", "High"));

            // Assuming you have a StudyType enum or a way to represent the type of study
            String studyTypeLabel = study.getStudyType();
            // Assuming Patient class has methods like getFirstName(), getLastName(), and getId()
            String patientName = study.getPatient().getFirstName() + " " + study.getPatient().getLastName();
            String patientId = study.getPatient().getUserKy().toString();

            String studyLabel = "Exam " + (i + 1) + " - " + studyTypeLabel + " - " + patientName + " (" + patientId + ")";

            study.setStudyLabel(studyLabel);

            if (i >= 20 && i <= 30) {
                study.setStudyDate(new Date());
            }
            else{
                // Generate a random start date within the desired range
                study.setStudyDate(generateRandomDate(2022));
            }


            study.setStudyUnxTmCrt(new Date());
            study.setStudyUnxTmUpdt(new Date());
            study.setStudyRcrdSts(faker.number().numberBetween(0, 2));

            Date studyDateValue = study.getStudyDate();
            LocalDate studyDate = studyDateValue.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();

            if (study.getStudyRcrdSts() == 0) {
                study.setStudyStatus("Archived");
            }
            else{
                study.setStudyStatus(faker.options().option("In Progress","Pending Interpretation", "Interpreted", "Pending Review", "Report Sent"));
            }

            fakeStudies.add(study);
        }
        studyRepository.saveAll(fakeStudies);


        //series

        List<Series> fakeSeries = new ArrayList<>();
        for (int i = 0; i < 5; i++) {
            Series series = new Series();
            series.setSeriesLabel("Series " + (i + 1));
            series.setSeriesDesc(faker.lorem().sentence());
            series.setSeriesBodyPart(faker.animal().name());
            series.setSeriesDcmModality(faker.options().option("CT", "MRI", "X-ray"));
            series.setSeriesDlp(faker.number().numberBetween(100, 1000) + " mGy/cm");
            series.setSeriesUnxTmCrt(new Date());
            series.setSeriesUnxTmUpdt(new Date());
            series.setSeriesRcrdSts(faker.number().numberBetween(0, 2));

            Study randomStudy = fakeStudies.get(faker.number().numberBetween(0, fakeStudies.size()));
            series.setStudy(randomStudy);

            fakeSeries.add(series);
        }
        seriesRepository.saveAll(fakeSeries);

        List<Object> fakeObjects = new ArrayList<>();
        for (int i = 0; i < stack1.size(); i++) {
            String path = stack1.get(i);
            Object object = new Object();
            object.setObjectLabel("Object " + (i + 1));
            object.setObjectPath(path);
            object.setObjectTp("dcm");
            object.setObjectUnxTmCrt(new Date());
            object.setObjectUnxTmUpdt(new Date());
            object.setObjectRcrdSts(1);

            //Series randomSeries = fakeSeries.get(faker.number().numberBetween(0, fakeSeries.size()));
            Series randomSeries = fakeSeries.get(1);
            object.setSeries(randomSeries);

            fakeObjects.add(object);
        }
        objectRepository.saveAll(fakeObjects);


        List<Secretary> secretaries = new ArrayList<>();
        for(int i = 0; i < 5; i++) {
            Secretary secretary = new Secretary();
            secretary.setLastName(faker.name().lastName());
            secretary.setFirstName(faker.name().firstName());
            secretary.setUserName(faker.internet().emailAddress());
            // Create a BCryptPasswordEncoder
            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
            // Hash the password
            String password = encoder.encode("password");
            secretary.setUserPassword(password);
            secretary.setMaidenName(faker.name().lastName());
            secretary.setBirthDate(faker.date().birthday());
            secretary.setGender(faker.demographic().sex());
            if(secretary.getGender().equals("Male")){
                secretary.setUserImage(imagesUrlMale.get(faker.number().numberBetween(0, imagesUrlMale.size()-1)));
            }else{
                secretary.setUserImage(imagesUrlFemale.get(faker.number().numberBetween(0, imagesUrlFemale.size()-1)));
            }
            secretary.setCvlStatus(maritalStatusOptions.get(faker.number().numberBetween(0, maritalStatusOptions.size()-1)));
            secretary.setNationality(nationalities.get(faker.number().numberBetween(0, nationalities.size()-1)));
            secretary.setUserRole("Secretary");
            secretary.setUserUnxTmCrt(new Date());
            secretary.setUserUnxTmUpdt(new Date());
            secretary.setUserRcrdSts(faker.number().numberBetween(1, 2));
            // SSN
            int sexNum = Objects.equals(secretary.getGender(), "Male") ? 1 : 2;
            String birthYear = String.format("%02d", secretary.getBirthDate().getYear() % 100);
            String birthMonth = String.format("%02d", secretary.getBirthDate().getMonth());
            String birthDay = String.format("%02d", secretary.getBirthDate().getDate());
            String identifier = String.valueOf(i);
            String ssn = sexNum + "-" + birthYear + "-" + birthMonth + "-" + birthDay + "-" + identifier;
            secretary.setUserId(ssn);
            secretaryRepository.save(secretary);
            secretaries.add(secretary);
        }

        Administrator admin = new Administrator();
        admin.setLastName(faker.name().lastName());
        admin.setFirstName(faker.name().firstName());
        admin.setUserName(faker.internet().emailAddress());
        // Create a BCryptPasswordEncoder
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        // Hash the password
        String password = encoder.encode("password");
        admin.setUserPassword(password);
        admin.setMaidenName(faker.name().lastName());
        admin.setBirthDate(faker.date().birthday());
        admin.setGender(faker.demographic().sex());
        if(admin.getGender().equals("Male")){
            admin.setUserImage(imagesUrlMale.get(faker.number().numberBetween(0, imagesUrlMale.size()-1)));
        }else{
            admin.setUserImage(imagesUrlFemale.get(faker.number().numberBetween(0, imagesUrlFemale.size()-1)));
        }
        admin.setCvlStatus(maritalStatusOptions.get(faker.number().numberBetween(0, maritalStatusOptions.size()-1)));
        admin.setNationality(nationalities.get(faker.number().numberBetween(0, nationalities.size()-1)));
        admin.setUserRole("Admin");
        admin.setUserUnxTmCrt(new Date());
        admin.setUserUnxTmUpdt(new Date());
        admin.setUserRcrdSts(faker.number().numberBetween(1, 2));
        // SSN
        int sexNum = Objects.equals(admin.getGender(), "Male") ? 1 : 2;
        String birthYear = String.format("%02d", admin.getBirthDate().getYear() % 100);
        String birthMonth = String.format("%02d", admin.getBirthDate().getMonth());
        String birthDay = String.format("%02d", admin.getBirthDate().getDate());
        String identifier = "1";
        String ssn = sexNum + "-" + birthYear + "-" + birthMonth + "-" + birthDay + "-" + identifier;
        admin.setUserId(ssn);
        adminRepository.save(admin);
    }

    // Generates a random date within a specified year
    private static Date generateRandomDate(int year) {
        long startMillis = TimeUnit.DAYS.toMillis((long) (year - 1970) * 365);
        long endMillis = TimeUnit.DAYS.toMillis((long) (year - 1970 + 1) * 365);
        long randomMillisSinceEpoch = startMillis + (long) (Math.random() * (endMillis - startMillis));
        return new Date(randomMillisSinceEpoch);
    }
}
