<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html class="no-js">
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>VOYAGE | addAccomBuilding</title>
		<meta name="description" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="shortcut icon" type="image/x-icon" href="${contextPath}/assets/img/favicon.ico">

		<!-- CSS here -->
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/owl.carousel.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/slicknav.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/flaticon.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/price_rangs.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/animate.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/magnific-popup.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/fontawesome-all.min.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/themify-icons.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/slick.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/nice-select.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
            
        <!-- calendar CSS -->
			<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
			<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
			<link rel="stylesheet" href="${contextPath}/calendar/css/style.css">
            
      		<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
      		<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
		
		 <!-- ?????? - ??????????????? ????????? ?????? -->
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
		
    </head>
    
    <body>
    <!-- Preloader Start -->
    <div id="preloader-active">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="preloader-inner position-relative">
                <div class="preloader-circle"></div>
                <div class="preloader-img pere-text">
                    <img src="${contextPath}/assets/img/logo/loder.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
    
    <header>
        <!-- Header Start -->
       <div class="header-area header-transparent">
            <div class="main-header">
               <div class="header-bottom  header-sticky">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <!-- Logo -->
                            <div class="col-xl-2 col-lg-2 col-md-1">
                                <div class="logo">
                                  <a href="${contextPath}/index" title="????????? ????????? ??????"><img src="${contextPath}/assets/img/logo/logo.png" alt="logo"></a>
                                </div>
                            </div>
                            <div class="col-xl-10 col-lg-10 col-md-8">
                                <!-- Main-menu -->
                                <div class="main-menu f-right d-none d-lg-block">
                                    <nav>
                                        <ul id="navigation">                                                                                                                                     
                                            <li><a href="${contextPath}/index">??????</a></li>
                                            <li><a href="${contextPath}/about">??????</a></li>
                                            <li><a href="${contextPath}/setProductCategory">??????</a>
                                                <ul class="submenu">
                                                    <li><a href="${contextPath}/getActivityProductList">??????</a></li>
                                                    <li><a href="${contextPath}/getAccomProductList">??????</a></li>
                                                </ul>
                                            </li>
										 	<li><a href="${contextPath}/setReviewCategory">??????</a>
                                                <ul class="submenu">
                                                    <li><a href="${contextPath}/getActivityReviewList">??????</a></li>
                                                    <li><a href="${contextPath}/getAccomReviewList">??????</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="#">????????????</a>
                                                <ul class="submenu">
                                                    <li><a href="${contextPath}/noticeList">????????????</a></li>
                                                    <li><a href="${contextPath}/qnaList">Q&A</a></li>
                                                    <c:if test="${loginMember.getMemberLevel() == 0}">
                                                    	<!-- ????????? ??????????????? ????????? member??? ???????????? -->
                                                    	<li><a href="${contextPath}/member/requestHost">???????????????</a></li>
                                                    </c:if>
                                                </ul>
                                            </li> 
                                           	<li><a href="#">????</a>
                                           		<ul class="submenu">
                                           			<li><a href="#">????</a></li>
                                           		</ul>
                                           	</li>
                                           	
                                           	<c:choose>
                                           		<c:when test="${empty loginMember}">
                                           			<li><a href="${contextPath}/login"><i class="ti-user">?????????</i></a>
			                                            <ul class="submenu">
			                                            	<li><a href="${contextPath}/login">?????????</a></li>
			                                                <li><a href="${contextPath}/addMember">????????????</a></li>
			                                            </ul>
		                                            </li>
                                           		</c:when>
                                           		
                                           		<c:when test="${loginMember.getMemberLevel() == 0}">
                                           			<li><a href="${contextPath}/member/selectMyProfile"><i class="ti-user">${loginMember.getMemberNickname()}</i></a>
			                                           	<ul class="submenu">
				                                            <li><a href="${contextPath}/member/selectMyProfile">????????????</a></li>
				                                            <li><a href="${contextPath}/member/selectMyOrderList">????????????</a></li>
				                                            <li><a href="${contextPath}/member/selectMyInterest">????????????</a></li>
				                                            <li><a href="${contextPath}/member/coupon">??????</a></li>
				                                            <li><a id="chatBtn" data-toggle="modal" data-target="#chatMain">??????</a></li>
				                                            <li><a href="${contextPath}/logout">????????????</a></li>
			                                            </ul>
		                                            </li>
                                           		</c:when>
                                           		
                                           		<c:when test="${loginMember.getMemberLevel() == 1}">
                                           			<li><a href="${contextPath}/member/selectMyProfile"><i class="ti-user">${loginMember.getMemberNickname()}</i></a>
			                                           	<ul class="submenu">
			                                           		<li><a href="${contextPath}/host/hostIndex">??????????????????</a></li>
				                                            <li><a href="${contextPath}/member/selectMyProfile">????????????</a></li>
				                                            <li><a href="${contextPath}/member/selectMyOrderList">????????????</a></li>
				                                            <li><a href="${contextPath}/member/selectMyInterest">????????????</a></li>
				                                            <li><a href="${contextPath}/member/coupon">??????</a></li>
				                                            <li><a id="chatBtn" data-toggle="modal" data-target="#chatMain">??????</a></li>
				                                            <li><a href="${contextPath}/logout">????????????</a></li>
			                                            </ul>
		                                            </li>
                                           		</c:when>
                                           		
                                           		<c:when test="${loginMember.getMemberLevel() == 2 && empty adminSession}">
                                           			<li><a href="${contextPath}/member/selectMyProfile"><i class="ti-user">${loginMember.getMemberNickname()}</i></a>
			                                           	<ul class="submenu">
			                                           		<li><a href="${contextPath}/addAdmin">?????????????????????</a></li>
				                                            <li><a href="${contextPath}/member/selectMyProfile">????????????</a></li>
				                                            <li><a href="${contextPath}/member/selectMyOrderList">????????????</a></li>
				                                            <li><a href="${contextPath}/member/selectMyInterest">????????????</a></li>
				                                            <li><a href="${contextPath}/member/coupon">??????</a></li>
				                                            <li><a id="chatBtn" data-toggle="modal" data-target="#chatMain">??????</a></li>
				                                            <li><a href="${contextPath}/logout">????????????</a></li>
			                                            </ul>
		                                            </li>
                                           		</c:when>
                                           		
                                           		<c:when test="${loginMember.getMemberLevel() == 2 && !empty adminSession}">
                                           			<li><a href="${contextPath}/member/selectMyProfile"><i class="ti-user">${loginMember.getMemberNickname()}</i></a>
			                                           	<ul class="submenu">
			                                           		<li><a href="${contextPath}/admin/adminIndex">??????????????????</a></li>
				                                            <li><a href="${contextPath}/member/selectMyProfile">????????????</a></li>
				                                            <li><a href="${contextPath}/member/selectMyOrderList">????????????</a></li>
				                                            <li><a href="${contextPath}/member/selectMyInterest">????????????</a></li>
				                                            <li><a href="${contextPath}/member/coupon">??????</a></li>
				                                            <li><a id="chatBtn" data-toggle="modal" data-target="#chatMain">??????</a></li>
				                                            <li><a href="${contextPath}/logout">????????????</a></li>
			                                            </ul>
		                                            </li>
                                           		</c:when>
                                           	</c:choose>
                                    	</ul>
                                    </nav>
                                </div>
                            </div>
                            <!-- Mobile Menu -->
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                                
                            </div>
                        </div>
                    </div>
               </div>
            </div>
       </div>
        <!-- Header End -->
    </header>
    
<%--    	<c:import url="/WEB-INF/jsp/partial/banner.jsp"/> --%>
   	
	<main>
	
	<!-- Hero Start-->
    <div class="hero-area3 hero-overly2 d-flex align-items-center ">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-8 col-lg-9">
                    <div class="hero-cap text-center pt-50 pb-20">
                        <h2>?????? ??????</h2>
                    </div>
                    <!--Hero form -->
                
                </div>
            </div>
        </div>
    </div>
    <!--Hero End -->
	
	<form action="${pageContext.request.contextPath}/member/addAccomReservation" method="get" id="calendarForm">
		<input type="hidden" name="accomRoomNo" value="${accomRoomNo }">
		<input type="hidden" name="checkIn" id="checkIn" value="">
		<input type="hidden" name="checkOut" id="checkOut" value="">
		
		<section class="ftco-section" style="padding-top: 3%;">
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-md-6 text-center mb-3">
						<h2 class="heading-section" style="font-family: 'Sulphur Point',sans-serif; font-size: 2em;">Reservation Calendar</h2>
					</div>
				</div>
				<div class="row justify-content-center mb-2">
					<div class="col-md-3 text-center">
						<h6 class="heading-section" style="font-size: 1.5em;">check In : <span id="checkInDate"></span></h6>
					</div>
					<div class="col-md-3 text-center">
						<h6 class="heading-section" style="font-size: 1.5em;">check Out : <span id="checkOutDate"></span></h6>
					</div>
					<div class="col-md-3 text-center">
						<h6 class="heading-section" style="font-size: 1.5em;"><span id="days"></span> days</h6>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="calendar-section">
			        <div class="row no-gutters">
			          <div class="col-md-6">
				            <div class="calendar calendar-first" id="calendar_first">
				              <div class="calendar_header">
				                <button class="switch-month switch-left">
				                  <i class="fa fa-chevron-left"></i>
				                </button>
				                <h2></h2>
				                <button class="switch-month switch-right">
				                  <i class="fa fa-chevron-right"></i>
				                </button>
				              </div>
				              <div class="calendar_weekdays"></div>
				              <div class="calendar_content"></div>
				            </div>
		
				          </div>
				          <div class="col-md-6">
		
				            <div class="calendar calendar-second" id="calendar_second">
				              <div class="calendar_header">
				                <button class="switch-month switch-left">
				                  <i class="fa fa-chevron-left"></i>
				                </button>
				                <h2></h2>
				                <button class="switch-month switch-right">
				                  <i class="fa fa-chevron-right"></i>
				                </button>
				              </div>
				              <div class="calendar_weekdays"></div>
				              <div class="calendar_content"></div>
				            </div>            
			          </div>
	
			        </div> <!-- End Row -->
			            
			      </div> <!-- End Calendar -->
					</div>
				</div>
				
				<div class="wizard-footer">
					<div class="pull-right">
						<button class="calendarBtn" type="button" id="submitBtn">NEXT</button>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</section>
	</form>
	
	</main>
	<!--footer.jsp ??????  -->
    	<c:import url="/WEB-INF/jsp/partial/footer.jsp"/>
    <!--footer.jsp ???  -->
    
    <!-- Scroll Up -->
    <div id="back-top" >
        <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
    </div>
    
    <!-- JS here -->
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>    
    
		<!-- One Page, Animated-HeadLin -->
        <script src="${pageContext.request.contextPath}/assets/js/wow.min.js"></script>
		<!-- Jquery Plugins, main Jquery -->	
        <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
        
		<!-- calendar JS -->
		<script src="${pageContext.request.contextPath}/calendar/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/calendar/js/popper.js"></script>
		<script src="${pageContext.request.contextPath}/calendar/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/calendar/js/mainAccom.js"></script>
  
        <script type="text/javascript">
        // calendarForm ????????? ??????
        $('#submitBtn').click(function(){
        	// checkIn, checkOut ????????? ????????? ??????
        	if ($('#checkIn').val() == '' || $('#checkOut').val() == '') {
        		alert('????????? ???????????? ????????? ???????????????.');
        		return;
        	}
        	$('#calendarForm').submit();
        });
        </script>
</body>
</html>