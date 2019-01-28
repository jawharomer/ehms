package com.joh.esms.service;

import com.joh.esms.model.Doctor;

public interface DoctorService {

	Iterable<Doctor> findAll();

	Doctor save(Doctor doctor);

	void delete(int id);

	Doctor findOne(int id);

	Doctor update(Doctor doctor);


}
