package com.joh.esms.service;

import java.util.List;

import javax.persistence.EntityNotFoundException;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.joh.esms.dao.PriceCategoryDAO;
import com.joh.esms.dao.ProductDAO;
import com.joh.esms.domain.model.ProductD;
import com.joh.esms.exception.CusDataIntegrityViolationException;
import com.joh.esms.exception.ItemExistsException;
import com.joh.esms.model.PriceCategory;
import com.joh.esms.model.Product;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO productDAO;

	@Autowired
	private PriceCategoryDAO priceCategoryDAO;

	@Override
	public Product findOne(int id) {
		return productDAO.findOne(id);
	}

	@Override
	public Iterable<Product> findAll() {
		return productDAO.findAll();
	}

	@Override
	@Transactional
	public Product save(Product product) {

		if (product.getProductUnitType() != null && product.getProductUnitType().getId() == 1
				&& (product.getPacketSize() == null || product.getPacketSize() <= 0)) {
			throw new CusDataIntegrityViolationException("Packet size is not set");
		} else {
			product.setPacketSize(null);
		}

		try {
			product.getProductPriceCategories().removeIf(e -> e.getPrice() == null || e.getPrice() == 0);

			// pack id=1
			if (product.getProductUnitType().getId() != null && product.getProductUnitType().getId() != 1) {
				product.setPacketSize(null);
			}
			return productDAO.save(product);
		} catch (DataIntegrityViolationException e) {
			throw new ItemExistsException(e.getMessage());
		}
	}

	@Override
	@Transactional
	public List<ProductD> findStock() {
		return productDAO.findStock();
	}

	@Override
	@Transactional
	public void delete(int id) {
		productDAO.delete(id);
	}

	@Override
	@Transactional
	public Product update(Product product) {
		// This line will check this student is exit
		// then it will update it
		productDAO.findOne(product.getId());
		// pack id=1
		if (product.getProductUnitType() != null && product.getProductUnitType().getId() == 1
				&& (product.getPacketSize() == null || product.getPacketSize() <= 0)) {
			throw new CusDataIntegrityViolationException("Packet size is not set");
		} else {
			product.setPacketSize(null);
		}
		
		return productDAO.save(product);
	}

	@Override
	public ProductD findProductByCode(String code) {
		try {
			return productDAO.findProductByCode(code);
		} catch (EmptyResultDataAccessException e) {
			throw new EntityNotFoundException();
		}

	}

	@Override
	public ProductD findProductByProductStepUpId(int productStepUpId) {
		try {
			return productDAO.findProductByProductStepUpId(productStepUpId);
		} catch (EmptyResultDataAccessException e) {
			throw new EntityNotFoundException();
		}

	}

}
