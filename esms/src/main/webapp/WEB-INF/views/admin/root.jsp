<%@page import="java.util.Date"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<jsp:useBean id="now" class="java.util.Date" />
<c:set var="tomorrow"
	value="<%=new Date(new Date().getTime() + 60 * 60 * 24 * 1000)%>" />

<fmt:formatDate var="currentDate" value="${now}" pattern="yyyy-MM-dd" />
<fmt:formatDate var="tomorrow" value="${tomorrow}" pattern="yyyy-MM-dd" />

<section id="admin-body">
	<section id="section-right" class="card">
		<ul class="list-group">
			<sec:authorize access="hasAnyRole('ADMIN', 'SALE')">

				<li class="list-group-item"><a
					href="<c:url value="/adminRoot" />"><spring:message
							code="layout.dashboard" /> </a></li>
				<!-- 
				<li class="list-group-item"><a
					href="<c:url value="/customerOrders/add"/>">Sale Point</a></li>

				<li class="list-group-item"><a
					href="<c:url value="/customerOrders"/>?from=${currentDate}&to=${tomorrow}">
						Customer Orders</a></li>
						 -->
			</sec:authorize>
			<sec:authorize access="hasAnyRole('ADMIN')">
				<li class="list-group-item"><a
					href="<c:url value="/adminStock"/>"><spring:message
							code="layout.stock" /> </a></li>
				<li class="list-group-item"><a
					href="<c:url value="/productCategories"/>"><spring:message
							code="layout.productCategory" /></a></li>
				<li class="list-group-item"><a
					href="<c:url value="/priceCategories"/>"> <spring:message
							code="layout.priceCategory" /></a></li>

				<li class="list-group-item"><a
					href="<c:url value="/orderProductStepUps/add"/>"> <spring:message
							code="layout.order" />
				</a></li>
				<li class="list-group-item"><a
					href="<c:url value="/orderProductStepUps"/>?from=${currentDate}&to=${tomorrow}">
						<spring:message code="layout.viewOrders" />
				</a></li>

				<li class="list-group-item"><a href="<c:url value="/vendors"/>">
						<spring:message code="layout.vendors" /></a></li>

				<!--  
				<li class="list-group-item"><a href="<c:url value="/doctors"/>">Doctors</a></li>
				<li class="list-group-item"><a
					href="<c:url value="/productStepUps/search/expirationDate"/>?from=${currentDate}&to=${tomorrow}">
						Stock By Expiration</a></li>



				<li class="text-info list-group-item"><a
					href="<c:url value="/customerOrders/sold"/>?from=${currentDate}&to=${tomorrow}">
						Product Sold</a></li>
				<li class="list-group-item"><a
					href="<c:url value="/customerOrders/return"/>">Return Product</a></li>
              -->
			</sec:authorize>

		</ul>
	</section>

	<section id="main-content">

		<tiles:insertAttribute name="adminBody" />

	</section>

</section>