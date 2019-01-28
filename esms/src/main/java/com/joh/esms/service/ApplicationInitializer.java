package com.joh.esms.service;

import java.util.Collection;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

import com.joh.esms.controller.AppController;
import com.joh.esms.model.ProductUnitType;

@Component
public class ApplicationInitializer {

	private static final Logger logger = Logger.getLogger(ApplicationInitializer.class);

	@Autowired
	private ProductUnitTypeService productUnitTypeService;

	@EventListener(ContextRefreshedEvent.class)
	public void contextRefreshedEvent() {
		logger.info("Insert component into database");

	
		if (((Collection<ProductUnitType>) productUnitTypeService.findAll()).size() == 0) {
			ProductUnitType productUnitType1 = new ProductUnitType();
			productUnitType1.setName("رزمة");

			ProductUnitType productUnitType2 = new ProductUnitType();
			productUnitType2.setName("قطعة");

			productUnitTypeService.save(productUnitType1);
			productUnitTypeService.save(productUnitType2);
		}
	}
}