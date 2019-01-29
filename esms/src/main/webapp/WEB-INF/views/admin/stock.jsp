<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div>

	<h2>
		<spring:message code="stock.title" />
	</h2>

	<div id="cus-add-div">
		<button id="cus-btn-addstudent" onclick="getAddProduct()"
			type="button" class="btn btn-success" data-toggle="modal"
			data-target="#modal">
			<i class="fa fa-plus"></i>
		</button>
	</div>


	<table id="stockTable" class="display nowrap">
		<thead>
			<tr>
				<th><spring:message code="stock.code" /></th>
				<th><spring:message code="stock.name" /></th>
				<th><spring:message code="stock.category" /></th>
				<th><spring:message code="stock.unitType" /></th>
				<th><spring:message code="stock.stockLevel" /></th>
				<th><spring:message code="stock.cost" /></th>
				<th><spring:message code="stock.packetSize" /></th>
				<th><spring:message code="stock.price" /></th>
				<th class="cus-not-export"><spring:message
						code="stock.function" /></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${productDs}" var="productD">
				<tr>
					<td>${productD.code}</td>
					<td>${productD.name}</td>
					<td>${productD.category}</td>
					<td>${productD.unitType}</td>
					<td>${productD.stockLevel}</td>
					<td>${productD.cost}</td>
					<td>${productD.packetSize}</td>
					<td>${productD.price}</td>
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
				<th>Category</th>
				<th>UnitType</th>
				<th>StockLevel</th>
				<th>Cost</th>
				<th>Packet Size</th>
				<th>Price</th>
				<th class="cus-not-search"></th>
			</tr>
		</tfoot>


	</table>


</div>




