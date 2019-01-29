<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<div id="edit-product-container">

	<sf:form id="editProductForm" method="POST" commandName="product"
		onsubmit="modalEditProduct(event)">
		<sf:input path="id" type="hidden" />
		<table>
			<tbody>
				<tr>
					<td class="text-left"><spring:message code="editProduct.code" /></td>
					<td><sf:input class="form-control" path="code" /></td>
					<td><sf:errors path="code" /></td>
				</tr>

				<tr>
					<td class="text-left"><spring:message code="editProduct.name" /></td>
					<td><sf:input class="form-control" path="name" /></td>
					<td><sf:errors path="name" /></td>
				</tr>

				<tr>
					<td class="text-left"><spring:message
							code="editProduct.unitType" /></td>
					<td><select id="productUnit" onchange="changeProductUnit()"
						class="form-control" name="productUnitType[id]">
							<option value=""><spring:message
									code="editProduct.choose" /></option>
							<c:forEach items="${productUnitTypes}" var="item">
								<c:if test="${product.productUnitType.id==item.id}">
									<option selected="selected" value="${item.id}">${item.name}</option>
								</c:if>
								<c:if test="${product.productUnitType.id!=item.id}">
									<option value="${item.id}">${item.name}</option>
								</c:if>
							</c:forEach>


					</select></td>



					<td><sf:errors path="productUnitType" /></td>
				</tr>


				<tr>
					<td class="text-left"><spring:message
							code="editProduct.packetSize" /></td>
					<td><sf:input type="number" class="form-control"
							path="packetSize" /></td>
					<td><sf:errors path="packetSize" /></td>
				</tr>

				<tr>
					<td class="text-left"><spring:message
							code="editProduct.category" /></td>
					<td><select class="form-control" name="productCategory[id]">
							<option value="">Choose</option>
							<c:forEach items="${productCategories}" var="item">
								<c:if test="${product.productCategory.id==item.id}">
									<option selected="selected" value="${item.id}">${item.name}</option>
								</c:if>
								<c:if test="${product.productCategory.id!=item.id}">
									<option value="${item.id}">${item.name}</option>
								</c:if>
							</c:forEach>

					</select></td>
					<td><sf:errors path="productCategory" /> <sf:errors
							path="productCategory.id" /></td>
				</tr>

				<tr class="text-info">
					<td class="text-left"><spring:message code="addProduct.price" /></td>
					<td><sf:input type="number" class="form-control" path="price" /></td>
					<td><sf:errors path="price" /></td>
				</tr>


				<c:forEach items="${product.productPriceCategories}" var="item"
					varStatus="loop">
					<tr class="text-info">
						<td class="text-left">${item.priceCategory.name}</td>
						<td><input
							name="productPriceCategories[${loop.index}][priceCategory[id]]"
							value="${item.priceCategory.id}" type="hidden"> <input
							class="form-control"
							name="productPriceCategories[${loop.index}][price]" type="number"
							value="${item.price}"></td>
					</tr>
				</c:forEach>

				<tr>
					<td><button class="btn btn-warning" type="submit">
							<i class="fa fa-edit"></i>
						</button></td>
				</tr>

			</tbody>

		</table>


	</sf:form>

</div>


<script>
	var csrf = '${_csrf.token}';

	function changeProductUnit() {
		console.log("changeProductUnit->fired");
		var unitType = $('#productUnit option:selected').val();
		console.log("unitType=" + unitType);
		if (unitType != 1) {
			$("#packetSize").val("");
			$("#packetSize").prop('disabled', true);
		} else {
			$("#packetSize").prop('disabled', false);
		}

	}

	function modalEditProduct(event) {
		console.log("modalEditProduct->fired");
		event.preventDefault();
		var data = $("#editProductForm").serializeJSON({
			useIntKeysAsArrayIndex : true
		});
		console.log("data=", data);
		$.ajax({
			type : "POST",
			url : "<c:url value="/products/update"/>",
			data : JSON.stringify(data),
			headers : {
				"X-CSRF-TOKEN" : csrf
			},
			contentType : "application/json",
			success : function(response) {
				$("#modal-body").html(response);
			},
			error : function(response) {
				$("#modal-body").html(response.responseText);
			}
		});
	}
</script>