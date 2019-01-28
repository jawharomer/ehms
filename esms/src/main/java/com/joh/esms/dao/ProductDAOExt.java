package com.joh.esms.dao;

import java.util.List;

import com.joh.esms.domain.model.ProductD;

public interface ProductDAOExt {

	List<ProductD> findStock();


	ProductD findProductByCode(String productCode);


	ProductD findProductByProductStepUpId(int productStepUpId);
}
