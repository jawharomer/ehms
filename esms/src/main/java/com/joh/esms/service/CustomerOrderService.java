package com.joh.esms.service;

import java.util.Date;
import java.util.List;

import com.joh.esms.model.CustomerOrder;

public interface CustomerOrderService {

	CustomerOrder save(CustomerOrder customerOrder);

	CustomerOrder findOne(int id);

	CustomerOrder update(CustomerOrder customerOrder);

	List<CustomerOrder> findAllByOrderTimeBetween(Date from, Date to);

	void delete(int id);

	CustomerOrder saveReturn(CustomerOrder customerOrder);

}
