<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<body>
	<div class="wrapper">
    <!-- adminKit : 시작 -->
    	<c:import url="partial\\adminKit.jsp"/>
    <!-- adminKit : 끝 -->
	<div class="main">
    <!-- adminKit : 시작 -->
    	<c:import url="partial\\adminBanner.jsp"/>
    <!-- adminKit : 끝 -->
		
		<!-- 메인(중앙) -->
		<main class="content">
			<div class="container-fluid p-0">
	
				<h1 class="h3 mb-3"><strong>관리자</strong> 문의 게시판</h1>
				
				<div class="row">
					<div class="col-12 col-lg-8 col-xxl-9 d-flex">
						<div class="card flex-fill">
							<div class="card-header">
								<h3 class="h3 mb-3">문의글 목록</h3>
							</div>
							<table class="table table-hover my-0">
								<thead>
									<tr>
										<th>No</th>
										<th>Nickname</th>
										<th>Title</th>
										<th>createDate</th>
										<th>updateDate</th>
										<th>Detail</th>
									</tr>
								</thead>
								<tbody> 
									<c:forEach items="${qnaList}" var="q" >
										<tr>
									        <td>${q.qnaNo}</td>
									        <td>${q.memberNickname}</td>
									        <td>${q.qnaTitle}</td>
									        <td>${q.createDate}</td>
									        <td>${q.updateDate}</td>
									        <td><a href="${pageContext.request.contextPath}/admin/adminQnaOne?qnaNo=${q.qnaNo}" class="btn">상세 내용</a></td>
									    </tr>
								    </c:forEach>
								</tbody>
							</table>
							
						</div>
					</div>
				</div>
			</div>
		</main>
		<!-- 페이징 -->
             <div class="container">
                <ul class="nav justify-content-center bg-light">
                   <c:if test="${beginRow > (ROW_PER_PAGE * 10)}">
                      <li><a href="${pageContext.request.contextPath}/admin/adminQnaList?currentPage=${pageNo-1}">&lt;</a></li>
                   </c:if>
                   <c:set var="doneLoop" value="false"></c:set>
                   <c:forEach var="f" begin="${pageNo}" end="${pageNo + 9}">
                      <c:if test="${not doneLoop}">
                         <c:choose>
                            <c:when test="${currentPage == f}">
                               <li class="active"><span>${f}</span></li>
                            </c:when>
                            <c:otherwise>
                               <li><a class="nav-link active" href="${pageContext.request.contextPath}/admin/adminQnaList?currentPage=${f}">${f}</a></li>
                            </c:otherwise>
                         </c:choose>
                         <c:if test="${f == lastPage}">
                            <c:set var="doneLoop" value="true"></c:set>
                         </c:if>
                      </c:if>
                   </c:forEach>
                   <c:if test="${currentPage + 10 <= lastPage}">
                      <li><a class="nav-link active" href="${pageContext.request.contextPath}/admin/adminQnaList?currentPage=${pageNo+10}">&gt;</a></li>
                   </c:if>
                </ul>
          </div> 
    <!-- adminFooter : 시작 -->
    	<c:import url="partial\\adminFooter.jsp"/>
    <!-- adminFooter : 끝 -->

		</div>
	</div>
	
	<script src="${pageContext.request.contextPath}/admin/js/app.js"></script>
	
	
	
	<!-- 원본 차트 가짜데이터 --> 
	<script>
	document.addEventListener("DOMContentLoaded", function() {
		var ctx = document.getElementById("chartjs-dashboard-line").getContext("2d");
		var gradient = ctx.createLinearGradient(0, 0, 0, 225);
		gradient.addColorStop(0, "rgba(215, 227, 244, 1)");
		gradient.addColorStop(1, "rgba(215, 227, 244, 0)");
		// Line chart
		new Chart(document.getElementById("chartjs-dashboard-line"), {
			type: "line",
			data: {
				labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
				datasets: [{
					label: "Sales ($)",
					fill: true,
					backgroundColor: gradient,
					borderColor: window.theme.primary,
					data: [
						2115,
						1562,
						1584,
						1892,
						1587,
						1923,
						2566,
						2448,
						2805,
						3438,
						2917,
						3327
					]
				}]
			},
			options: {
				maintainAspectRatio: false,
				legend: {
					display: false
				},
				tooltips: {
					intersect: false
				},
				hover: {
					intersect: true
				},
				plugins: {
					filler: {
						propagate: false
					}
				},
				scales: {
					xAxes: [{
						reverse: true,
						gridLines: {
							color: "rgba(0,0,0,0.0)"
						}
					}],
					yAxes: [{
						ticks: {
							stepSize: 1000
						},
						display: true,
						borderDash: [3, 3],
						gridLines: {
							color: "rgba(0,0,0,0.0)"
						}
					}]
				}
			}
		});
	});
	</script>
	<script>
	document.addEventListener("DOMContentLoaded", function() {
		// Pie chart
		new Chart(document.getElementById("chartjs-dashboard-pie"), {
			type: "pie",
			data: {
				labels: ["Chrome", "Firefox", "IE"],
				datasets: [{
					data: [4306, 3801, 1689],
					backgroundColor: [
						window.theme.primary,
						window.theme.warning,
						window.theme.danger
					],
					borderWidth: 5
				}]
			},
			options: {
				responsive: !window.MSInputMethodContext,
				maintainAspectRatio: false,
				legend: {
					display: false
				},
				cutoutPercentage: 75
			}
		});
	});
	</script>
	<script>
	document.addEventListener("DOMContentLoaded", function() {
		// Bar chart
		new Chart(document.getElementById("chartjs-dashboard-bar"), {
			type: "bar",
			data: {
				labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
				datasets: [{
					label: "This year",
					backgroundColor: window.theme.primary,
					borderColor: window.theme.primary,
					hoverBackgroundColor: window.theme.primary,
					hoverBorderColor: window.theme.primary,
					data: [54, 67, 41, 55, 62, 45, 55, 73, 60, 76, 48, 79],
					barPercentage: .75,
					categoryPercentage: .5
				}]
			},
			options: {
				maintainAspectRatio: false,
				legend: {
					display: false
				},
				scales: {
					yAxes: [{
						gridLines: {
							display: false
						},
						stacked: false,
						ticks: {
							stepSize: 20
						}
					}],
					xAxes: [{
						stacked: false,
						gridLines: {
							color: "transparent"
						}
					}]
				}
			}
		});
	});
	</script>
	<script>
	document.addEventListener("DOMContentLoaded", function() {
		var markers = [{
				coords: [31.230391, 121.473701],
				name: "Shanghai"
			},
			{
				coords: [28.704060, 77.102493],
				name: "Delhi"
			},
			{
				coords: [6.524379, 3.379206],
				name: "Lagos"
			},
			{
				coords: [35.689487, 139.691711],
				name: "Tokyo"
			},
			{
				coords: [23.129110, 113.264381],
				name: "Guangzhou"
			},
			{
				coords: [40.7127837, -74.0059413],
				name: "New York"
			},
			{
				coords: [34.052235, -118.243683],
				name: "Los Angeles"
			},
			{
				coords: [41.878113, -87.629799],
				name: "Chicago"
			},
			{
				coords: [51.507351, -0.127758],
				name: "London"
			},
			{
				coords: [40.416775, -3.703790],
				name: "Madrid "
			}
		];
		var map = new jsVectorMap({
			map: "world",
			selector: "#world_map",
			zoomButtons: true,
			markers: markers,
			markerStyle: {
				initial: {
					r: 9,
					strokeWidth: 7,
					stokeOpacity: .4,
					fill: window.theme.primary
				},
				hover: {
					fill: window.theme.primary,
					stroke: window.theme.primary
				}
			},
			zoomOnScroll: false
		});
		window.addEventListener("resize", () => {
			map.updateSize();
		});
	});
	</script>
	<script>
	document.addEventListener("DOMContentLoaded", function() {
		var date = new Date(Date.now() - 5 * 24 * 60 * 60 * 1000);
		var defaultDate = date.getUTCFullYear() + "-" + (date.getUTCMonth() + 1) + "-" + date.getUTCDate();
		document.getElementById("datetimepicker-dashboard").flatpickr({
			inline: true,
			prevArrow: "<span title=\"Previous month\">&laquo;</span>",
			nextArrow: "<span title=\"Next month\">&raquo;</span>",
			defaultDate: defaultDate
		});
	});
	
	</script>
	
</body>

</html>