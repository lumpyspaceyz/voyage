<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배너</title>
</head>
<body>
    <!-- Preloader Start -->
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
                                  <a href="${pageContext.request.contextPath}/index"><img src="assets/img/logo/logo.png" alt="logo"></a>
                                </div>
                            </div>
                            <div class="col-xl-10 col-lg-10 col-md-8">
                                <!-- Main-menu -->
                                <div class="main-menu f-right d-none d-lg-block">
                                    <nav>
                                        <ul id="navigation">                                                                                                                                     
                                            <li><a href="${pageContext.request.contextPath}/index">메인</a></li>
                                            <li><a href="${pageContext.request.contextPath}/about">설명</a></li>
                                            <li><a href="#">예약</a>
                                                <ul class="submenu">
                                                    <li><a href="blog.html">체험</a></li>
                                                    <li><a href="blog_details.html">숙소</a></li>
                                                </ul>
                                            </li>
                                            <li><a href="${pageContext.request.contextPath}/hashtag">해시태그</a></li>
                                            <li><a href="${pageContext.request.contextPath}/getReviewList">후기</a></li>
                                            <li><a href="#">고객지원</a>
                                                <ul class="submenu">
                                                    <li><a href="${pageContext.request.contextPath}/notice">공지사항</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/qna">Q&A</a></li>
                                                </ul>
                                            </li>
                                            <li class="login"><a href="#">
                                                <i class="ti-user"></i> 로그인</a>
                                            </li>
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
</body>
</html>