package com.joh.esms.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joh.esms.dao.UserDAO;
import com.joh.esms.model.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;

	public User findByUserName(String userName) {
		return userDAO.findByUserName(userName);
	}

}
