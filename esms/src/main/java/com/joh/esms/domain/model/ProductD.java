package com.joh.esms.domain.model;

public class ProductD {

	private Integer productId;
	private String code;
	private String name;
	private String unitType;
	private Integer stockLevel;
	private Double cost;
	private Double price;
	private String category;
	private Integer packetSize;
	private Integer productStepUpId;

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUnitType() {
		return unitType;
	}

	public void setUnitType(String unitType) {
		this.unitType = unitType;
	}

	public Integer getStockLevel() {
		return stockLevel;
	}

	public void setStockLevel(Integer stockLevel) {
		this.stockLevel = stockLevel;
	}

	public Double getCost() {
		return cost;
	}

	public void setCost(Double cost) {
		this.cost = cost;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Integer getPacketSize() {
		return packetSize;
	}

	public void setPacketSize(Integer packetSize) {
		this.packetSize = packetSize;
	}

	public Integer getProductStepUpId() {
		return productStepUpId;
	}

	public void setProductStepUpId(Integer productStepUpId) {
		this.productStepUpId = productStepUpId;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "ProductD [productId=" + productId + ", code=" + code + ", name=" + name + ", unitType=" + unitType
				+ ", stockLevel=" + stockLevel + ", cost=" + cost + ", category=" + category + ", packetSize="
				+ packetSize + ", productStepUpId=" + productStepUpId + "]";
	}

}
