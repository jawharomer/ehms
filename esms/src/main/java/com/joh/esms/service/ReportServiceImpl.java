package com.joh.esms.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.joh.esms.dao.ReportDAO;
import com.joh.esms.domain.model.DoctorCustomerOrderD;
import com.joh.esms.domain.model.NotificationD;

@Service
public class ReportServiceImpl implements ReportService {
	@Autowired
	private ReportDAO reportDAO;

	@Override
	public List<DoctorCustomerOrderD> findDoctorCustomerOrder(int doctorId,Date from, Date to) {
		return reportDAO.findDoctorCustomerOrder(doctorId,from, to);
	}
	
	
	@Override
	public List<NotificationD> findAdminNotifications() {
		return reportDAO.findAdminNotifications();
	}
	

}
