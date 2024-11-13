package iss4u.ehr.backoffice.radiography.human_resources.services.implementation;

import iss4u.ehr.backoffice.radiography.human_resources.entities.Staff;
import iss4u.ehr.backoffice.radiography.human_resources.repositories.StaffRepository;
import iss4u.ehr.backoffice.radiography.human_resources.services.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.List;
import java.util.Optional;
@Service
public class StaffServiceImpl implements StaffService {
    private final StaffRepository staffRepository;

    @Autowired
    public StaffServiceImpl(StaffRepository staffRepository) {
        this.staffRepository = staffRepository;
    }

    @Override
    public void create(Staff staff) {
        staffRepository.save(staff);
    }

    @Override
    public List<Staff> retrieveStaffs() {
        return staffRepository.findAll();
    }

    @Override
    public Optional<Staff> getStaffByKy(Long staffKy) {
        return staffRepository.findById(staffKy);
    }

    @Override
    public void update(Long staffKy, Staff updatedStaff) {
        Staff existingStaff = staffRepository.findById(staffKy)
                .orElseThrow(() -> new EntityNotFoundException("Staff with id " + staffKy + " not found"));

        // Update the properties
        existingStaff.setUserImage(updatedStaff.getUserImage());
        existingStaff.setFirstName(updatedStaff.getFirstName());
        existingStaff.setLastName(updatedStaff.getLastName());
        existingStaff.setCvlStatus(updatedStaff.getCvlStatus());
        existingStaff.setMaidenName(updatedStaff.getMaidenName());
        existingStaff.setNationality(updatedStaff.getNationality());
        existingStaff.setGender(updatedStaff.getGender());
        existingStaff.setBirthDate(updatedStaff.getBirthDate());
        existingStaff.setUserUnxTmUpdt(updatedStaff.getUserUnxTmUpdt());

        staffRepository.save(existingStaff);

    }

    @Override
    public void delete(Long staffKy) {
        staffRepository.deleteById(staffKy);
    }
}
