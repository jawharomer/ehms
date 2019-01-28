package com.joh.esms.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;

@Table(name = "PRICE_CATEGORIES")
@Entity
public class PriceCategory {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "I_PRICE_CATEGORY")
	private int id;

	@NotBlank(message = "{priceCategory.name.blank}")
	@Column(name = "PRICE_CATEGORY_NAME", nullable = false, unique = true)
	private String name;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "PriceCategory [id=" + id + ", name=" + name + "]";
	}

}
