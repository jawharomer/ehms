package com.joh.esms.dao;

import org.springframework.data.repository.CrudRepository;

import com.joh.esms.model.Doctor;

public interface DoctorDAO extends CrudRepository<Doctor, Integer> {

}
