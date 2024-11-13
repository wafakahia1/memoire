package iss4u.ehr.backoffice.radiography.human_resources.services;


import iss4u.ehr.backoffice.radiography.human_resources.entities.Staff;

import java.util.List;
import java.util.Optional;

public interface StaffService {

    void create(Staff staff);

    List<Staff> retrieveStaffs();

    Optional<Staff> getStaffByKy(Long staffKy);

    void update(Long staffKy, Staff updatedStaff);

    void delete(Long staffKy);

    //List<StaffPassword> getStaffPasswords(Optional<Staff> staff);
}
