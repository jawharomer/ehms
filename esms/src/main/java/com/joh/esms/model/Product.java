package com.joh.esms.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.Valid;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.joh.esms.validator.ProductValidation;

@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })

@Entity
@Table(name = "PRODUCTS")
public class Product {

	@Min(groups = { ProductValidation.Update.class }, value = 0)
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "I_PRODUCT")
	private int id;

	@NotBlank(groups = { ProductValidation.Insert.class }, message = "product code is null")
	@Column(name = "PRODUCT_CODE", unique = true)
	private String code;

	@NotBlank(groups = { ProductValidation.Insert.class }, message = "product name is null")
	@Column(name = "PRODUCT_NAME")
	private String name;

	@Valid
	@NotNull(groups = { ProductValidation.Insert.class }, message = "unit type is null")
	@ManyToOne()
	@JoinColumn(name = "I_PRODUCT_UNIT_TYPE")
	private ProductUnitType productUnitType;

	@Valid()
	@NotNull(message = "category is null")
	@ManyToOne()
	@JoinColumn(name = "I_PRODUCT_CATEGORY", nullable = false)
	private ProductCategory productCategory;

	@Column(name = "PACKET_SIZE")
	private Integer packetSize;

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "I_PRODUCT")
	private List<ProductPriceCategory> productPriceCategories = new ArrayList<>();

	@Column(name = "PRICE")
	private Double price;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public ProductUnitType getProductUnitType() {
		return productUnitType;
	}

	public void setProductUnitType(ProductUnitType productUnitType) {
		this.productUnitType = productUnitType;
	}

	public ProductCategory getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(ProductCategory productCategory) {
		this.productCategory = productCategory;
	}

	public Integer getPacketSize() {
		return packetSize;
	}

	public void setPacketSize(Integer packetSize) {
		this.packetSize = packetSize;
	}

	public List<ProductPriceCategory> getProductPriceCategories() {
		return productPriceCategories;
	}

	public void setProductPriceCategories(List<ProductPriceCategory> productPriceCategories) {
		this.productPriceCategories = productPriceCategories;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", code=" + code + ", name=" + name + ", productUnitType=" + productUnitType
				+ ", productCategory=" + productCategory + ", packetSize=" + packetSize + ", productPriceCategories="
				+ productPriceCategories + ", price=" + price + "]";
	}

}
