<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<c:set var="preCache"><%=2/*LocalDateTime.now()*/%></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html;UTF-8">
<meta charset="UTF-8" />
<title><tiles:getAsString name="title" /></title>
<tiles:importAttribute name="requiredCSSFiles" />
<c:if test="${!empty requiredCSSFiles}">
	<c:forEach var="item" items="${requiredCSSFiles}">
		<c:if test="${pageContext.response.locale=='ar'&& item=='bootstrap'}">
			<c:set var="item" value="bootstrap_rtl" />
		</c:if>
		<link href="<c:url value="/resources/css/${item}.css?${preCache}" />"
			rel="stylesheet"></link>
	</c:forEach>
</c:if>

<tiles:importAttribute name="rightToLeftCSS" />
<c:if test="${pageContext.response.locale=='ar'&&!empty rightToLeftCSS}">
	<link
		href="<c:url value="/resources/css/${rightToLeftCSS}.css?${preCache}" />"
		rel="stylesheet"></link>
</c:if>

<style type="text/css">
@font-face {
	font-family: "NotoKufiArabicBold";
	src: url("<c:url value='/resources/fonts/NotoKufiArabic-Bold.woff'/>")
		format('woff');
}

@font-face {
	font-family: "NotoKufiArabic";
	src: url("<c:url value='/resources/fonts/NotoKufiArabic.woff'/>")
		format('woff');
}

body {
	font-family: NotoKufiArabic !important;
}
</style>

</head>
<body>



	<section id="view-port">

		<header id="header">
			<tiles:insertAttribute name="header" />
		</header>

		<section id="site-content">
			<tiles:insertAttribute name="body" />
		</section>


		<footer id="footer">
			<tiles:insertAttribute name="footer" />
		</footer>

	</section>


	<tiles:importAttribute name="requiredJSFiles" />
	<c:if test="${!empty requiredJSFiles}">
		<c:forEach var="item" items="${requiredJSFiles}">
			<c:choose>
				<c:when test="${item=='jsLang'}">
					<script type="text/javascript"
						src="<c:url value='/${item}.js?${preCache}' />"></script>
				</c:when>
				<c:otherwise>
					<script type="text/javascript"
						src="<c:url value='/resources/js/${item}.js?${preCache}' />"></script>
				</c:otherwise>
			</c:choose>

		</c:forEach>
	</c:if>


	<!-- Modal -->
	<div class="modal fade" id="modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLongTitle" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body" id="modal-body"></div>
			</div>
		</div>
	</div>

</body>
</html>