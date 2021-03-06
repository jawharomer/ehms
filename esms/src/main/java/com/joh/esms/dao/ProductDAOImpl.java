package com.joh.esms.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.joh.esms.domain.model.ProductD;

public class ProductDAOImpl implements ProductDAOExt {

	@PersistenceContext
	private EntityManager em;

	@Override
	public List<ProductD> findStock() {
		List<ProductD> productDs = new ArrayList<>();

		Query query = em.createNativeQuery("SELECT P.I_PRODUCT,P.PRODUCT_CODE,P.PRODUCT_NAME,PUT.UNIT_TYPE_NAME,\n"
				+ "IFNULL(SUM(QUANTITY-SOLD_QUANTITY),0) AS STOCK_LEVEL,\n"
				+ "ROUND(SUM(PAYMENT_AMOUNT)/SUM(QUANTITY),3) as COST,P.PRICE,PC.CATEGORY_NAME AS CATEGORY,PACKET_SIZE\n"
				+ "FROM PRODUCTS P LEFT OUTER JOIN PRODUCT_UNIT_TYPES PUT USING(I_PRODUCT_UNIT_TYPE) LEFT OUTER JOIN PRODUCT_CATEGORIES PC USING(I_PRODUCT_CATEGORY) \n"
				+ "LEFT OUTER JOIN PRODUCT_STEPUPS PS ON P.I_PRODUCT=PS.I_PRODUCT AND QUANTITY-SOLD_QUANTITY AND (EXPIRATION_DATE>CURDATE() OR EXPIRATION_DATE IS NULL) GROUP BY P.I_PRODUCT\n"
				+ "ORDER BY PRODUCT_CODE");

		List<Object[]> resultList = query.getResultList();

		for (Object row[] : resultList) {
			ProductD productD = new ProductD();

			productD.setProductId((Integer) row[0]);
			productD.setCode((String) row[1]);
			productD.setName((String) row[2]);
			productD.setUnitType((String) row[3]);
			productD.setStockLevel(Integer.parseInt("" + row[4]));
			productD.setCost((Double) row[5]);
			productD.setPrice((Double) row[6]);
			productD.setCategory((String) row[7]);
			if (row[8] != null)
				productD.setPacketSize((Integer) row[8]);

			productDs.add(productD);
		}
		return productDs;
	}

	@Override
	public ProductD findProductByCode(String productCode) {

		Query query = em.createNativeQuery(
				"SELECT P.I_PRODUCT,P.PRODUCT_CODE,P.PRODUCT_NAME,PUT.UNIT_TYPE_NAME,IFNULL(SUM(QUANTITY-SOLD_QUANTITY),0) AS STOCK_LEVEL,ROUND(SUM(PAYMENT_AMOUNT)/SUM(QUANTITY),3) as COST,PACKET_SIZE \n"
						+ "    FROM\n" + "PRODUCTS  P \n" + "    LEFT OUTER JOIN\n"
						+ "PRODUCT_UNIT_TYPES PUT USING(I_PRODUCT_UNIT_TYPE)   \n" + "    LEFT OUTER JOIN\n"
						+ "PRODUCT_STEPUPS PS ON P.I_PRODUCT=PS.I_PRODUCT AND QUANTITY-SOLD_QUANTITY>0 AND EXPIRATION_DATE>CURDATE()\n"
						+ "    WHERE PRODUCT_CODE=?1   GROUP BY\n" + "P.I_PRODUCT;");

		query.setParameter(1, productCode);
		// System.out.println(query);

		Object[] row = (Object[]) query.getSingleResult();

		ProductD productD = new ProductD();

		productD.setProductId((Integer) row[0]);
		productD.setCode((String) row[1]);
		productD.setName((String) row[2]);
		productD.setUnitType((String) row[3]);
		productD.setStockLevel(Integer.parseInt("" + row[4]));
		productD.setCost((Double) row[5]);
		if (row[6] != null)
			productD.setPacketSize((Integer) row[6]);

		return productD;

	}

	@Override
	public ProductD findProductByProductStepUpId(int productStepUpId) {

		Query query = em.createNativeQuery(
				"SELECT P.I_PRODUCT,P.PRODUCT_CODE,P.PRODUCT_NAME,PUT.UNIT_TYPE_NAME,IFNULL(QUANTITY-SOLD_QUANTITY,0) AS STOCK_LEVEL,ROUND(PAYMENT_AMOUNT/QUANTITY,3) as COST,PACKET_SIZE,I_PRODUCT_STEPUP\n"
						+ "FROM PRODUCTS  P        \n" + "INNER JOIN PRODUCT_STEPUPS PS \n"
						+ "ON P.I_PRODUCT=PS.I_PRODUCT  AND QUANTITY-SOLD_QUANTITY>0 AND PS.I_PRODUCT_STEPUP=?1 \n"
						+ "LEFT OUTER JOIN PRODUCT_UNIT_TYPES PUT USING(I_PRODUCT_UNIT_TYPE) ;");

		query.setParameter(1, productStepUpId);

		Object[] row = (Object[]) query.getSingleResult();

		ProductD productD = new ProductD();

		productD.setProductId((Integer) row[0]);
		productD.setCode((String) row[1]);
		productD.setName((String) row[2]);
		productD.setUnitType((String) row[3]);
		productD.setStockLevel(Integer.parseInt("" + row[4]));
		productD.setCost((Double) row[5]);
		if (row[6] != null)
			productD.setPacketSize((Integer) row[6]);

		productD.setProductStepUpId(Integer.parseInt("" + row[7]));

		return productD;

	}
}
