<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
	<meta name="author" content="AdminKit">
	<meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="shortcut icon" href="img/icons/icon-48x48.png" />

	<link rel="canonical" href="https://demo-basic.adminkit.io/" />

	<title>AdminKit Demo - Bootstrap 5 Admin Templateee</title>

	<link href="${pageContext.request.contextPath}/admin/css/app.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<!-- 눈누 - 한산스네오 레귤러 폰트 -->
	<style type="text/css">
	
		@font-face {
		    font-family: 'SpoqaHanSansNeo-Regular';
		    	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SpoqaHanSansNeo-Regular.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		
		body {
			font-family: 'SpoqaHanSansNeo-Regular';
		}

	</style>
<style>
	td{height: 80px; width: 20%;}
</style>
<body>
	<div class="wrapper">
    <!-- adminKit : 시작 -->
    	<c:import url="partial\\adminKit.jsp"/>
    <!-- adminKit : 끝 -->
	<div class="main">
    <!-- adminKit : 시작 -->
    	<c:import url="partial\\\\adminBanner.jsp"/>
    <!-- adminKit : 끝 -->
	
		<main class="content">
			<div class="container-fluid p-0">
	
				<h1 class="h3 mb-3"><strong>상세 보기</strong></h1>
					<div class="row">
						<div>
							<div class="card flex-fill">
								<div class="card-header">
	
									<h5 class="card-title mb-0">Latest Activity</h5>
								</div>
								<table class="table table-hover my-0">
									<thead>
										<tr>
											<th>체험 번호</th>
											<th>사업자 번호</th>
											<th>체험 이름</th>
											<th>체험 시작 날짜</th>
											<th>체험 끝 날짜</th>
										</tr>
									</thead>
										<tr>
											<td>${activity.activityNo}</td>
										    <td>${activity.hostNo}</td>
										    <td>${activity.activityName}</td>
										    <td>${activity.activityOpenDate}</td>
										    <td>${activity.activityCloseDate}</td>
										</tr>
										
									<thead>
										<tr>
											<th>체험 가격</th>
											<th>체험 여는시간</th>
											<th>체험 닫는시간</th>
											<th>ActivityMaxT</th>
											<th>ActivityMaxP</th>
										<tr>
									</thead>
										<tr>
									 		<td>${activity.activityPrice}</td>
										    <td>${activity.activityOpenHour}</td>
										    <td>${activity.activityCloseHour}</td>
										    <td>${activity.activityMaxT}</td>
										    <td>${activity.activityMaxP}</td>
										</tr>
									
									<thead>
										<tr>
											<th>체험 설명</th>
											<th>공개 여부</th>
											<th>승인 여부</th>
											<th>CreateDate</th>
											<th>UpdateDate</th>
										</tr>
									</thead>
										<tr>
										    <td>${activity.activityDescription}</td>
										    <td>${activity.activityState}</td>
										    <td>${activity.activityStateAdmin}</td>
										    <td>${activity.createDate}</td>
										    <td>${activity.updateDate}</td>
										</tr>
									</table>
									<br>
								<div style="text-align: center;"><a class="btn btn-info" href="${pageContext.request.contextPath}/admin/activityUpdate?activityNo=${activity.activityNo}">수정하기</a></div>
								<br>
							</div>
						</div>
					</div>
				</div>
			</main>
	
    <!-- adminFooter : 시작 -->
    	<c:import url="partial\\\\adminFooter.jsp"/>
    <!-- adminFooter : 끝 -->
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/admin/js/app.js"></script>

</body>

</html>