<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ taglib prefix='fn' uri='http://java.sun.com/jsp/jstl/functions'%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="currentDate" value="${now}" pattern="yyyy-MM-dd" />


<div>

	<h2>Price Categories</h2>

	<div class="add-new-doctor-div">
		<button class="btn btn-outline-primary"
			onclick="getAddingPriceCategory()">Add</button>
	</div>

	<table class="table">
		<thead>
			<tr>
				<td>Doctor Name</td>
				<td>Doctor Phone</td>
				<td>Profit</td>
				<td>Function</td>
			</tr>
		</thead>
		<tbody>


			<c:forEach items="${priceCategories}" var="item">
				<tr>
					<td>${item.id}</td>
					<td>${item.name}</td>
					<td>
						<div>
							<button class="btn btn-outline-danger"
								onclick="deletePriceCategory(${item.id})">
								<i class="fa fa-times"></i>
							</button>
							<button class="btn btn-outline-warning"
								onclick="getEditingPriceCategory(${item.id})">
								<i class="fa fa-edit"></i>
							</button>
						</div>
					</td>


				</tr>
			</c:forEach>

		</tbody>

	</table>

</div>





