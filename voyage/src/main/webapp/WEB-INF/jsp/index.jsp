<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<title>Voyage</title>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="${contextPath}/assets/img/favicon.ico">

<!-- CSS here -->
    <link rel="stylesheet" href="${contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${contextPath}/assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${contextPath}/assets/css/slicknav.css">
    <link rel="stylesheet" href="${contextPath}/assets/css/flaticon.css">
    <link rel="stylesheet" href="${contextPath}/assets/css/animate.min.css">
    <link rel="stylesheet" href="${contextPath}/assets/css/magnific-popup.css">
    <link rel="stylesheet" href="${contextPath}/assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="${contextPath}/assets/css/themify-icons.css">
    <link rel="stylesheet" href="${contextPath}/assets/css/slick.css">
    <link rel="stylesheet" href="${contextPath}/assets/css/nice-select.css">
    <link rel="stylesheet" href="${contextPath}/assets/css/style.css">
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
    
    
    <c:import url="/WEB-INF/jsp/partial/banner.jsp"/>
    
    <main>

        <!-- Hero Area Start-->
        <div class="slider-area hero-overly">
            <div class="single-slider hero-overly  slider-height d-flex align-items-center">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-10 col-lg-9">
                            <!-- Hero Caption -->
                            <div class="hero__caption">
                                <span>Voy Age</span>
                                <h1>여행을 떠나고 싶으신가요?</h1>
                            </div>
                            <!--Hero form -->
                            <form name="Search" id="Search" method="get" action="#" class="search-box">
                                <div class="input-form">
                                    <input type="text" name="searchWord" id="searchWord" placeholder="여행지를 입력해주세요" onkeypress="enterSearch()">
                                </div>
                                <div class="select-form">
                                    <div class="select-itms">
                                        <select id="searchSelect">
                                            <option value="숙소">숙소</option>
                                            <option value="체험">체험</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="search-form">
                                    <a href="#" onclick="searchScript()">Search</a>
                                </div>	
                            </form>	
                        </div>
                    </div>
                </div>
                
                <script type="text/javascript">
	                function searchScript(){
	                	let category = document.getElementById("searchSelect");
	                	category = category.options[category.selectedIndex].value;
	                	let contextPath = '${contextPath}';
						if($("#searchWord").val() == ""){
							alert('키워드를 입력해주세요.');
							return;
						} else if (category == '숙소'){
							$("#Search").attr("action", contextPath+"/getAccomProductList");
							Search.submit();
						} else if (category == '체험'){
							$("#Search").attr("action", contextPath+"/getActivityProductList");
							Search.submit();
						}
					};
					
					function enterSearch() {
						if(window.event.keyCode == 13){
							searchScript();
						}
					}
                </script>

            </div>
        </div>
        <!--Hero Area End-->
        <!-- Popular Locations Start -->
        <div class="popular-location section-padding30">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <!-- Section Tittle -->
                        <div class="section-tittle text-center mb-80">
                            <span>Most visited places</span>
                            <h2>Popular Locations</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="single-location mb-30">
                            <div class="location-img">
                                <img src="${contextPath}/assets/img/gallery/location1.png" alt="">
                            </div>
                            <div class="location-details">
                                <p>서울</p>
                                <a href="${contextPath}/getActivityProductList?searchAddress=서울" class="location-btn"> 2 <i class="ti-plus"></i> 체험</a>
								<a href="${contextPath}/getAccomProductList?searchAddress=서울" class="location-btn"> 4 <i class="ti-plus"></i> 숙소</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="single-location mb-30">
                            <div class="location-img">
                                <img src="${contextPath}/assets/img/gallery/location2.png" alt="">
                            </div>
                            <div class="location-details">
                                <p>제주</p>
                                <a href="${contextPath}/getActivityProductList?searchAddress=제주" class="location-btn"> 8 <i class="ti-plus"></i> 체험</a>
								<a href="${contextPath}/getAccomProductList?searchAddress=제주" class="location-btn"> 16 <i class="ti-plus"></i> 숙소</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="single-location mb-30">
                            <div class="location-img">
                                <img src="${contextPath}/assets/img/gallery/location3.png" alt="">
                            </div>
                            <div class="location-details">
                                <p>부산</p>
                                <a href="${contextPath}/getActivityProductList?searchAddress=부산" class="location-btn"> 32 <i class="ti-plus"></i> 체험</a>
								<a href="${contextPath}/getAccomProductList?searchAddress=부산" class="location-btn"> 64 <i class="ti-plus"></i> 숙소</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="single-location mb-30">
                            <div class="location-img">
                                <img src="${contextPath}/assets/img/gallery/location4.png" alt="">
                            </div>
                            <div class="location-details">
                                <p>강원</p>
                                <a href="${contextPath}/getActivityProductList?searchAddress=강원" class="location-btn"> 128 <i class="ti-plus"></i> 체험</a>
								<a href="${contextPath}/getAccomProductList?searchAddress=강원" class="location-btn"> 256 <i class="ti-plus"></i> 숙소</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="single-location mb-30">
                            <div class="location-img">
                                <img src="${contextPath}/assets/img/gallery/location5.png" alt="">
                            </div>
                            <div class="location-details">
                                <p>인천</p>
                                <a href="${contextPath}/getActivityProductList?searchAddress=인천" class="location-btn"> 512 <i class="ti-plus"></i> 체험</a>
								<a href="${contextPath}/getAccomProductList?searchAddress=인천" class="location-btn"> 1024 <i class="ti-plus"></i> 숙소</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="single-location mb-30">
                            <div class="location-img">
                                <img src="${contextPath}/assets/img/gallery/location6.png" alt="">
                            </div>
                            <div class="location-details">
                                <p>대구</p>
                                <a href="${contextPath}/getActivityProductList?searchAddress=대구" class="location-btn"> 2048 <i class="ti-plus"></i> 체험</a>
								<a href="${contextPath}/getAccomProductList?searchAddress=대구" class="location-btn"> 4096 <i class="ti-plus"></i> 숙소</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- More Btn -->
                <div class="row justify-content-center">
                    <div class="room-btn pt-20">
                        <a href="${contextPath}/setProductCategory" class="btn view-btn1">View All Places</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Categories Area Start -->
        <div class="categories-area section-padding20">
            <div class="container">
            	<div class="row">
                    <div class="col-lg-12">
                        <!-- Section Tittle -->
                        <div class="section-tittle text-center mb-80">
                            <span>We are offering for you</span>
                            <h2>Featured Categories</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                	<div class="col-lg-30 col-md-6 col-sm-6">
                        <div class="single-cat text-center mb-50">
                            <a href="${contextPath}/getActivityProductList">
	                            <div class="cat-icon">
	                                <span class="flaticon-drink"></span>
	                            </div>
	                            <div class="cat-cap">
	                                <h5>체험</h5>
	                                <p>인생의 전환점을 찾아보세요</p>
	                                View Details
	                            </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-30 col-md-6 col-sm-6">
                        <div class="single-cat text-center mb-50">
                        	<a href="${contextPath}/getAccomProductList">
	                            <div class="cat-icon">
	                                <span class="flaticon-bed"></span>
	                            </div>
	                            <div class="cat-cap">
	                                <h5>숙소</h5>
	                                <p>휴식이 필요하지 않으신가요?</p>
	                                View Details
	                            </div>
                            </a>
                        </div>
                    </div>
                 </div>
            </div>
        </div>
        
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        
        <!-- Categories Area End -->
         <!-- peoples-visit Start -->
         <div class="peoples-visit dining-padding-top">
            <!-- Single Left img -->
            <div class="single-visit left-img">
                <div class="container">
                    <div class="row justify-content-end">
                        <div class="col-lg-8">
                            <div class="visit-caption">
                                <span>Jang Gun Mung Gun</span>
                                <h3>The World is Your Oyster</h3>
                                <p>I'm the pirate king. It'll work!</p>
                                <!--Single Visit categories -->
                                <div class="visit-categories mb-40">
                                    <div class="visit-location">
                                        <span class="flaticon-travel"></span>
                                    </div>
                                    <div class="visit-cap">
                                        <h4>The pirate "Straw Hat Loopy" is temporarily closed.</h4>
                                        <p>This is my precious treasure that I received from my friend long time ago! I swore to this hat that I would collect comrades and become pirates.
                                        </p>
                                    </div>
                                </div>
                                <!--Single Visit categories -->
                                <div class="visit-categories">
                                    <div class="visit-location">
                                        <span class="flaticon-work"></span>
                                    </div>
                                    <div class="visit-cap">
                                        <h4>Are you going to be communist or not?</h4>
                                        <p>Now... Sungsoon-hyung, Kim Doo-han-woo knelt down like this. Are you ready?
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- peoples-visit End -->

        <!-- Subscribe Area End -->
        <!-- Blog Ara Start -->
        <div class="home-blog-area section-padding30">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <!-- Section Tittle -->
                        <div class="section-tittle text-center mb-70">
                            <span>Our blog</span>
                            <h2>News and tips</h2>
                        </div> 
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                        <div class="single-team mb-30">
                            <div class="team-img">
                                <img src="${contextPath}/assets/img/gallery/home_blog1.png" alt="">
                            </div>
                            <div class="team-caption">
                                <span>HEALTH & CARE</span>
                                <h3><a href="blog.html">The Best SPA Salons For
                                    Your Relaxation</a></h3>
                                <p>October 6, 2020by Steve</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                        <div class="single-team mb-30">
                            <div class="team-img">
                                <img src="${contextPath}/assets/img/gallery/home_blog2.png" alt="">
                            </div>
                            <div class="team-caption">
                                <span>HEALTH & CARE</span>
                                <h3><a href="blog.html">The Best SPA Salons For
                                    Your Relaxation</a></h3>
                                <p>October 6, 2020by Steve</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                        <div class="single-team mb-30">
                            <div class="team-img">
                                <img src="${contextPath}/assets/img/gallery/home_blog3.png" alt="">
                            </div>
                            <div class="team-caption">
                                <span>HEALTH & CARE</span>
                                <h3><a href="blog.html">The Best SPA Salons For
                                    Your Relaxation</a></h3>
                                <p>October 6, 2020by Steve</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Blog Ara End -->

    </main>
    <!--footer.jsp 시작  -->
    <c:import url="/WEB-INF/jsp/partial/footer.jsp"/>
    <!--footer.jsp 끝  -->
    <!-- Scroll Up -->
    <div id="back-top" >
        <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
    </div>
    

    <!-- JS here -->
		<!-- All JS Custom Plugins Link Here here -->
        <script src="${contextPath}/assets/js/vendor/modernizr-3.5.0.min.js"></script>
		<!-- Jquery, Popper, Bootstrap -->
		<script src="${contextPath}/assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="${contextPath}/assets/js/popper.min.js"></script>
        <script src="${contextPath}/assets/js/bootstrap.min.js"></script>
	    <!-- Jquery Mobile Menu -->
        <script src="${contextPath}/assets/js/jquery.slicknav.min.js"></script>

		<!-- Jquery Slick , Owl-Carousel Plugins -->
        <script src="${contextPath}/assets/js/owl.carousel.min.js"></script>
        <script src="${contextPath}/assets/js/slick.min.js"></script>
		<!-- One Page, Animated-HeadLin -->
        <script src="${contextPath}/assets/js/wow.min.js"></script>
		<script src="${contextPath}/assets/js/animated.headline.js"></script>
        <script src="${contextPath}/assets/js/jquery.magnific-popup.js"></script>

		<!-- Nice-select, sticky -->
        <script src="${contextPath}/assets/js/jquery.nice-select.min.js"></script>
		<script src="${contextPath}/assets/js/jquery.sticky.js"></script>
        
        <!-- contact js -->
        <script src="${contextPath}/assets/js/contact.js"></script>
        <script src="${contextPath}/assets/js/jquery.form.js"></script>
        <script src="${contextPath}/assets/js/jquery.validate.min.js"></script>
        <script src="${contextPath}/assets/js/mail-script.js"></script>
        <script src="${contextPath}/assets/js/jquery.ajaxchimp.min.js"></script>
        
		<!-- Jquery Plugins, main Jquery -->	
        <script src="${contextPath}/assets/js/plugins.js"></script>
        <script src="${contextPath}/assets/js/main.js"></script>
        
    </body>
</html>