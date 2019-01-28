package com.joh.esms.service;

import java.util.List;

import com.joh.esms.domain.model.ProductD;
import com.joh.esms.model.Product;

public interface ProductService {

	Product save(Product product);

	List<ProductD> findStock();

	void delete(int id);

	Product findOne(int id);

	Product update(Product product);

	ProductD findProductByCode(String code);

	Iterable<Product> findAll();

	ProductD findProductByProductStepUpId(int productStepUpId);

}
