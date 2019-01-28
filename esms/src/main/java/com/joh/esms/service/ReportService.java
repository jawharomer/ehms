package com.joh.esms.service;

import java.util.Date;
import java.util.List;

import com.joh.esms.domain.model.DoctorCustomerOrderD;
import com.joh.esms.domain.model.NotificationD;

public interface ReportService {

	List<DoctorCustomerOrderD> findDoctorCustomerOrder(int doctorId, Date from, Date to);

	List<NotificationD> findAdminNotifications();

}
