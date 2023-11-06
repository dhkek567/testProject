<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath }/resources/assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/resources/assets/img/favicon.png">
<title>대덕인재개발원 CRUD 연습</title>
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
<link href="${pageContext.request.contextPath }/resources/assets/css/nucleo-icons.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/assets/css/nucleo-svg.css" rel="stylesheet" />
<script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
<link id="pagestyle" href="${pageContext.request.contextPath }/resources/assets/css/material-dashboard.css?v=3.0.4" rel="stylesheet" />
<script src="${pageContext.request.contextPath }/resources/assets/js/core/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
</head>
<c:if test="${not empty message }">
	<script type="text/javascript">
	alert("${message}");
	<c:remove var="message" scope="request"/>
	<c:remove var="message" scope="session"/>
	
	</script>
</c:if>
<body class="bg-gray-200">
	<main class="main-content  mt-0">
		<tiles:insertAttribute name="content"/>
	</main>
	<script src="${pageContext.request.contextPath }/resources/assets/js/material-dashboard.min.js?v=3.0.4"></script>
</body>
</html>