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

	<title>회원정보 수정</title>

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
    	<c:import url="partial\\\\adminBanner.jsp"/>
    <!-- adminKit : 끝 -->
    	<main class="content">
			<div class="container-fluid p-1">
				<h1 class="h3 mb-3"><strong>회원정보</strong>  수정</h1>
			</div>
	<form class="form-contact contact_form mb-80" action="${pageContext.request.contextPath}/admin/updateMember" method="post" name="updateMember" id="updateMember">
		<div class="container-fluid row justify-content-center align-items-center">
			<div class="row">
				<div class="col-12 col-lg-8 col-xxl-9 d-flex">
					<div class="card flex-fill">
						<div class="card-header">
							<h3 class="h3 mb-3"> ${member.memberId}의 회원정보</h3>
						</div>
						<div class="clear"> 
                            <div class="col-sm-10">
                                <div class="form-group">
                                    <label>회원ID</label>
                                    <input name="memberId" id="memberId" class="form-control" type="text" readonly="readonly" value="${member.memberId}">
                                </div>
                                <div class="form-group">
                                    <label>이름(성)</label>
                                     <input name="memberFirstName" id="memberFirstName" class="form-control" type="text" readonly="readonly" value="${member.memberFirstName}">
                                </div> 
                                <div class="form-group">
                                    <label>이름</label>
                                  	<input name="memberLastName" id="memberLastName" class="form-control" type="text" readonly="readonly" value="${member.memberLastName}">
                                </div> 
                                <div class="form-group">
                                    <label>닉네임</label>
                                     <input name="memberNickname" id="memberNickname" class="form-control" type="text" readonly="readonly" value="${member.memberNickname}">
                                </div> 
                            </div>
                            <div class="col-sm-10">
                                <div class="form-group">
                                  <label>핸드폰번호</label>
                                  <input name="memberPhone" id="memberPhone" class="form-control" type="text" readonly="readonly" value="${member.memberPhone}">
                             	</div>
                            	  <div class="form-group">
                                  <label>우편번호</label>
                                  <input name="memberEmail" id="memberEmail" class="form-control" type="text" readonly="readonly" value="${member.memberEmail}">
                             	</div>
                            	  <div class="form-group">
                                  <label>회원 LV</label>
                                  		<select name="memberLevel" id="memberLevel">
				                            <option value="0">0</option>
				                            <option value="1">1</option>
				                            <option value="2">2</option>
										</select>
                             	</div>
                    	        <div class="form-group">
                                  <label>회원 상태</label>
                                  		<select name="memberActive" id="memberActive">
				                            <option value="활동">활동</option>
				                            <option value="정지">정지</option>
										</select>
                             	</div>
                            	  <div class="form-group">
                                  <label>가입일자</label>
                                  <input name="createDate" id="createDate" class="form-control" type="text" readonly="readonly" value="${member.createDate}">
                                  <div>
                                  </div>
                             	</div>
                            	  <div class="form-group">
                                  <label>수정일자</label>
                                  <input name="updateDate" id="updateDate" class="form-control" type="text" readonly="readonly" value="${member.updateDate}">
                             	</div>
                     	         <div class="form-group">
                                  <label>마지막 접속 날짜</label>
                                  <input name="lastLogin" id="lastLogin" class="form-control" type="text" readonly="readonly" value="${member.lastLogin}">
                             	</div>
                            	
                            </div>  

                        </div>
                        </div>
                        <div class="card flex-fill">
                        	<div class="clear">
                        		<div class="col-sm-20">
                        		 <div class="col-sm-10">
                        		  <div class="form-group">
                                  <label>회원 우편 번호</label>
                                  <input name="memberAddress.memberAddressPostalCode" id="memberAddress.memberAddressPostalCode" class="form-control" type="text" readonly="readonly" value="${member.memberAddress.memberAddressPostalCode}">
                             	</div>
                            	  <div class="form-group">
                                  <label>회원 주소</label>
                                  <input name="memberAddress.memberAddressZip" id="memberAddress.memberAddressZip" class="form-control" type="text" readonly="readonly" value="${member.memberAddress.memberAddressZip}">
                             	</div>
                    	        <div class="form-group">
                                  <label>상세 주소</label>
                                  <input name="memberAddress.memberAddressDetail" id="memberAddress.memberAddressDetail" class="form-control" type="text" readonly="readonly" value="${member.memberAddress.memberAddressDetail}">
                             	</div>
                            	  <div class="form-group">
                                  <label>주소 기입일자</label>
                                  <input name="memberAddress.createDate" id="memberAddress.createDate" class="form-control" type="text" readonly="readonly" value="${member.memberAddress.createDate}">
                             	</div>
                            	  <div class="form-group">
                                  <label>주소 수정 일자</label>
                                  <input name="memberAddress.updateDate" id="memberAddress.updateDate" class="form-control" type="text" readonly="readonly" value="${member.memberAddress.updateDate}">
                             	</div>
                             	</div>
                        		<div><label>자기소개</label></div>
                                 <div class="form-group">
                                     <textarea rows="20" style="width: 90%" name="memberDescription" id="memberDescription"  placeholder="자기소개" readonly="readonly">${member.memberDescription}</textarea>
                                 </div>
                            	</div>
                        	</div>
                        	
                        	<div class="col-sm-20 col-sm-offset-1" style="text-align: center;">
                             <br>
                   				<div>
                      				<button class="btn btn-finish btn-primary" type="submit">수정</button>
                   				</div>
                         </div>
					</div>
				</div>
			</div>			
		</div>
	</form>
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