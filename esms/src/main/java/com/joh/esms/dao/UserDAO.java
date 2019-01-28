package com.joh.esms.dao;

import org.springframework.data.repository.CrudRepository;

import com.joh.esms.model.User;

public interface UserDAO extends CrudRepository<User, Integer> {

	User findByUserName(String userName);
}
