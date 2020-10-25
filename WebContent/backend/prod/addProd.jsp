<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
	
	<head>
	
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport"
			content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="">
	
		<title>我是標題</title>
	</head>

	<body id="page-top">
	
		<div id="wrapper">
	
			<%@include file="/backend/bar/backBarSide.jsp"%>
	
			<div id="content-wrapper" class="d-flex flex-column">		
	
				<div id="content">
	
					<!-- Topbar -->
					<%@include file="/backend/bar/backBarTop.jsp"%>
	
					<div class="container-fluid">				
						<!--============================自定義內容start ================================================== -->
						
	
	

					</div> <!--END OF container-fluid-->
					
					
					
					<%@include file="/backend/prod/addProd123.jsp"%>
					
					
				    </div> <!--END OF content-->
				
<!--====================================== 自定義內容end ================================================== -->		
				<%@include file="/backend/bar/footer.jsp"%>
				
			</div><!--END OF content-wrapper -->
		</div><!--END OF wrapper -->
	
		<script>
		<!--JavaScript內容-->
		</script>
						
	</body>
	
</html>