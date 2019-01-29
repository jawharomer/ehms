<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="currentDate" value="${now}" pattern="yyyy-MM-dd" />


<script>
	var csrf = '${_csrf.token}';
</script>


<div ng-app="adminProductCategories"
	ng-controller="adminProductCategories" class="admin-doctors">
	
	<h2>
		<spring:message code="productCategories.title" />
	</h2>
	

	<div class="py-1">
		<button class="btn btn-success" ng-click="getAddingProductCategory()">
			<i class="fa fa-plus"></i>
		</button>
	</div>

	<table class="table table-bordered">
		<thead>
			<tr>
				<td>#</td>
				<td><spring:message code="productCategories.name" /></td>
				<td><spring:message code="productCategories.function" /></td>
			</tr>
		</thead>
		<tbody>


			<c:forEach items="${productCategories}" var="item">
				<tr>
					<td>${item.id}</td>
					<td>${item.name}</td>
					<td>
						<div>
							<button class="btn btn-danger"
								ng-click="deleteProductCategory(${item.id})">
								<i class="fa fa-times"></i>
							</button>
							<button class="btn btn-warning"
								ng-click="editProductCategory(${item.id})">
								<i class="fa fa-edit"></i>
							</button>
						</div>
					</td>


				</tr>
			</c:forEach>

		</tbody>

	</table>

</div>





