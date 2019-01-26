<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	var csrf = '${_csrf.token}';
</script>

<div>

	<h2>Stock</h2>

	<div id="cus-add-div">
		<button id="cus-btn-addstudent" onclick="getAddProduct()"
			type="button" class="btn btn-outline-primary" data-toggle="modal"
			data-target="#modal">ِAdd</button>
	</div>


	<table id="stockTable" class="display nowrap">
		<thead>
			<tr>
				<th>Code</th>
				<th>Name</th>
				<th>Scientific Name</th>
				<th>Category</th>
				<th>Country</th>
				<th>UnitType</th>
				<th>StockLevel</th>
				<th>Cost</th>
				<th>Price</th>
				<th>Packet Size</th>
				<th class="cus-not-export">Function</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${productDs}" var="productD">
				<tr>
					<td>${productD.code}</td>
					<td>${productD.name}</td>
					<td>${productD.scientificName}</td>
					<td>${productD.category}</td>
					<td>${productD.country}</td>
					<td>${productD.unitType}</td>
					<td>${productD.stockLevel}</td>
					<td>${productD.cost}</td>
					<td>${productD.price}</td>
					<td>${productD.packetSize}</td>
					<td>
						<div class="cus-table-function-div">
							<button class="btn btn-outline-danger btn-sm"
								data-product-id="${productD.productId}"
								onclick="deleteProduct(this)">
								<i class="fa fa-times"></i>
							</button>
							<button class="btn btn-outline-warning btn-sm"
								data-product-id="${productD.productId}"
								onclick="editProduct(this)">
								<i class="fa fa-edit"></i>
							</button>
							<a class="btn btn-sm btn-info" target="_blank"
								href="<c:url value="/orderProductStepUps/product/" />${productD.code}">
								<i class="fa fa-arrow-up"></i>
							</a>
						</div>
					</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<th>Code</th>
				<th>Name</th>
				<th>Scientific Name</th>
				<th>Category</th>
				<th>Country</th>
				<th>UnitType</th>
				<th>StockLevel</th>
				<th>Cost</th>
				<th>Price</th>
				<th>Packet Size</th>
				<th class="cus-not-search"></th>
			</tr>
		</tfoot>


	</table>


</div>




