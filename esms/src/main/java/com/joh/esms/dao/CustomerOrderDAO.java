package com.joh.esms.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.joh.esms.model.CustomerOrder;

public interface CustomerOrderDAO extends CrudRepository<CustomerOrder, Integer>, CustomerOrderDAOExt {
	List<CustomerOrder> findAllByOrderTimeBetween(Date from, Date to);
}
