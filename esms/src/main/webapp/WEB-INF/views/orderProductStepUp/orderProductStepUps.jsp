<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
	var csrf = '${_csrf.token}';
	console.log("csrf=" + csrf);

	var reportTitle = '<fmt:formatDate value="${from}" pattern="yyyy-MM-dd"/>_To_<fmt:formatDate value="${to}" pattern="yyyy-MM-dd"/>';
</script>
<div ng-app="productStepUps" ng-controller="productStepUps">


	<h2>
		<spring:message code="orderPorductStepUps.title" />
	</h2>
	<hr>

	<div>
		<form action="<c:url value="/orderProductStepUps"/>">
			<table>

				<tr>
					<td class="text-left"><spring:message
							code="orderPorductStepUps.from" /></td>
					<td><input class="form-control" id="from" name="from"
						value="<fmt:formatDate pattern = "yyyy-MM-dd"  
         value = "${from}" />" /></td>
				</tr>
				<tr>
					<td class="text-left"><spring:message
							code="orderPorductStepUps.to" /></td>
					<td><input class="form-control" id="to" name="to"
						value="<fmt:formatDate pattern = "yyyy-MM-dd" 
         value = "${to}" />" /></td>
				</tr>
				<tr>
					<td><button class="btn btn-outline-info" type="submit">
							<spring:message code="orderPorductStepUps.view" />
						</button></td>
				</tr>
			</table>
			<hr>
		</form>

	</div>

	<div>

		<table id="productStepUpsTable" class="display">
			<thead>
				<tr>
					<th>#</th>
					<th><spring:message code="orderPorductStepUps.vendor" /></th>
					<th><spring:message code="orderPorductStepUps.time" /></th>
					<th><spring:message code="orderPorductStepUps.reference" /></th>
					<th><spring:message code="orderPorductStepUps.totalPayment" /></th>
					<th><spring:message code="orderPorductStepUps.discount" /></th>
					<th class="cus-not-export"><spring:message code="orderPorductStepUps.function" /></th>
				</tr>
			</thead>
			<tbody>
				<c:set var="sumTotalPayment" value="${0}" />
				<c:forEach items="${orderProductStepUps}" var="item">
					<tr>
						<td>${item.id}</td>
						<td>${item.vendor.fullName}</td>
						<td>${item.orderTime}</td>
						<td>${item.referecneInvoiceId}</td>
						<td><fmt:formatNumber value="${item.totalPaymentAmount}" /></td>
						<td>${item.discount}</td>
						<td>
							<div>
								<button class="btn btn-danger btn-sm"
									ng-click="deleteOrderProductStepUp(${item.id})">
									<i class="fa fa-times"></i>
								</button>

								<a href="<c:url value="/orderProductStepUps/edit/" />${item.id}"
									class="btn btn-warning btn-sm"> <i class="fa fa-edit"></i>
								</a>

							</div>
						</td>
					</tr>
					<c:set var="sumTotalPayment"
						value="${sumTotalPayment+item.totalPaymentAmount}" />

				</c:forEach>
				<tr class="text-info">
					<td>Total</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td><fmt:formatNumber type="number" maxFractionDigits="3"
							value="${sumTotalPayment}" /></td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>

			</tbody>
		</table>

	</div>

</div>