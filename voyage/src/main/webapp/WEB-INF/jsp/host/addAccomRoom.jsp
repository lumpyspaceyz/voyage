<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="no-js">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>VOYAGE | addAccomRoom</title>
		<meta name="description" content="GARO is a real-estate template">
		<meta name="author" content="Kimarotec">
	   	<meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    
	    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>
		
		<link rel="manifest" href="site.webmanifest">
		<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
		
		<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
		<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
		<link rel="icon" href="favicon.ico" type="image/x-icon">
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/accom/css/normalize.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/accom/css/font-awesome.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/accom/css/fontello.css">
		<link href="${pageContext.request.contextPath}/accom/fonts/icon-7-stroke/css/pe-icon-7-stroke.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/accom/fonts/icon-7-stroke/css/helper.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet" media="screen">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/accom/css/bootstrap-select.min.css"> 
		<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/accom/css/icheck.min_all.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/accom/css/price-range.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/accom/css/owl.carousel.css">  
		<link rel="stylesheet" href="${pageContext.request.contextPath}/accom/css/owl.theme.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/accom/css/owl.transitions.css"> 
		<link rel="stylesheet" href="${pageContext.request.contextPath}/accom/css/wizard.css"> 
		<link rel="stylesheet" href="${pageContext.request.contextPath}/accom/css/style.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/accom/css/responsive.css">
		
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
		
		<!-- 눈누 - 한산스네오 레귤러 폰트 -->
		<style type="text/css">
		
			@font-face {
			    font-family: 'SpoqaHanSansNeo-Regular';
			    	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SpoqaHanSansNeo-Regular.woff') format('woff');
			    font-weight: normal;
			    font-style: normal;
			}
			
			body {
				background-color:black;
				font-family: 'SpoqaHanSansNeo-Regular';
			}
			
		</style>
    </head>
    
    <body>
    <!-- 배너 : 시작 -->
    	<c:import url="../partial\\banner.jsp"/>
    <!-- 배너 : 끝 -->
    <div style="height:130px; background-color: black;"></div>
    <!-- property area -->
	<div class="content-area submit-property">
		<div class="container" style="background-color: #FCFCFC;">
			<div class="clearfix">
				<div class="wizard-container">
	
					<div class="wizard-card ct-wizard-orange" id="wizardProperty">
						<form action="${pageContext.request.contextPath}/host/addAccomRoom" method="post" enctype="multipart/form-data" id="accomRoomForm">
							<div class="wizard-header">
								<h3>
									<b>Accommodation</b> _room<br>
									<small>숙소-객실의 정보를 입력해주세요.</small>
								</h3>
							</div>
	
							<ul>
								<li><a href="#step1" data-toggle="tab">Step 1 </a></li>
								<li><a href="#step2" data-toggle="tab">Step 2 </a></li>
								<li><a href="#step3" data-toggle="tab">Step 3 </a></li>
								<li><a href="#step4" data-toggle="tab">Finished </a></li>
							</ul>
	
							<div class="tab-content">
	
								<div class="tab-pane" id="step1">
									<h3 class="text-center">Basic information</h3>
									<div class="row p-b-15">
										<div class="col-sm-offset-1" style="margnin:0 auto;">
											<div class="picture-container" style="float:left; margin-left:20px;">
												<div class="picture">
													<img src="${pageContext.request.contextPath}/assets/img/default-property.jpg" class="picture-src" id="wizardPicturePreview" title="" />
													<input type="file" name="accomRoomImage" id="wizard-picture">
												</div>
											</div>
											<div class="picture-container" style="float:left; margin-left:20px;">
												<div class="picture">
													<img src="${pageContext.request.contextPath}/assets/img/default-property.jpg" class="picture-src" id="wizardPicturePreview2" title="" />
													<input type="file" name="accomRoomImage" id="wizard-picture2">
												</div>
											</div>
											<div class="picture-container" style="float:left; margin-left:20px;">
												<div class="picture">
													<img src="${pageContext.request.contextPath}/assets/img/default-property.jpg" class="picture-src" id="wizardPicturePreview3" title="" />
													<input type="file" name="accomRoomImage" id="wizard-picture3">
												</div>
											</div>
											<div class="picture-container" style="float:left; margin-left:20px;">
												<div class="picture">
													<img src="${pageContext.request.contextPath}/assets/img/default-property.jpg" class="picture-src" id="wizardPicturePreview4" title="" />
													<input type="file" name="accomRoomImage" id="wizard-picture4">
												</div>
											</div>
										</div>
										<div class="col-sm-6" style="margin:0 auto;">
											<div class="form-group">
												<h4>Name <small>(required)</small></h4>
												<input name="accomRoom.accomRoomName" type="text" class="form-control" placeholder="Deluxe room" style="height:34px;">
											</div>
	
											<div class="form-group">
												<h4>Description <small>(required)</small></h4>
												<textarea name="accomRoom.accomRoomDescription" class="form-control" placeholder="통유리창이 매력적인 ..." rows="8"></textarea>
											</div>
										</div>
									</div>
								</div>
								<!--  End step 1 -->
	
								<div class="tab-pane" id="step2">
									<h3 class="text-center">People &amp; Price</h3>
									<div class="row mt-4">
										<div class="col-sm-6" style="margin:0 auto;">
											<div class="col-sm-12">
												<div class="form-group">
													<h4>Standard number of people <small>(required)</small></h4>
													<div class="input-group">
													    <input type="number" class="form-control" name="accomRoom.accomRoomStan" style="height:34px;">
														<span class="input-group-text">명</span>
													</div>
												</div>
												<div class="form-group">
													<h4>Maximum number of people <small>(required)</small></h4>
													<div class="input-group">
													    <input type="number" class="form-control" name="accomRoom.accomRoomMax" style="height:34px;">
														<span class="input-group-text">명</span>
													</div>
												</div>
												<div class="form-group">
													<h4>Price <small>(required)</small></h4>
													<div class="input-group">
													    <input type="number" class="form-control" name="accomRoom.accomPrice" style="height:34px;">
														<span class="input-group-text">원</span>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- End step 2 -->
	
								<div class="tab-pane" id="step3">
									<h3 class="text-center">Amenity &amp; Hashtag</h3>
									<div class="row mt-4">
										<div class="col-sm-6" style="margin:0 auto;">
										
											<div class="col-sm-12 mt-2">
												<div class="form-group">
													<h4>
														Amenity
														<span class="m-2" style="float: right;">
															<input type="button" class="btn-sm" style="width:80px; color:white; background: #ff3d1c; border-radius: 30px;
		    													color: #fff; font-weight: 500;" id="addItem" value="물품추가">
		    												<input type="button" class="btn-sm" style="width:80px; color:white; background: #ff3d1c; border-radius: 30px;
		    													color: #fff; font-weight: 500;" id="delItem" value="삭제">
			                                    		</span>
													</h4>
													
													<div class="form-group" id="itemPlace">
														<div id="itemForm">
															<label>Name</label>
				                                    		<input type="text" class="form-control" id="accomBuildingSpotName" name="accomRoomItem[0].accomRoomItemName" placeholder="ex) 칫솔" style="height:34px;">
															<label>Quantity</label>
															<div class="input-group">
															    <input type="number" class="form-control" name="accomRoomItem[0].accomRoomItemQnt" placeholder="ex) 2" style="height:34px;">
																<span class="input-group-text">개</span>
															</div>
															<label>Price</label>
															<div class="input-group">
															    <input type="number" class="form-control" name="accomRoomItem[0].accomRoomItemPrice" placeholder="ex) 2000" style="height:34px;">
																<span class="input-group-text">원</span>
															</div>
														</div>
													</div>
												</div>
											</div>
											
											<div class="col-sm-12 mt-4">
												<div class="form-group">
													<h4>
														HashTag
														<span class="m-2" style="float: right;">
															<input type="button" class="btn-sm" style="width:80px; color:white; background: #ff3d1c; border-radius: 30px;
		    													color: #fff; font-weight: 500;" id="addHashtag" value="해시태그추가">
		    												<input type="button" class="btn-sm" style="width:80px; color:white; background: #ff3d1c; border-radius: 30px;
		    													color: #fff; font-weight: 500;" id="delHashtag" value="삭제">
			                                    		</span>
		                                    		</h4>
		                                    		<label>* 입력 폼 하나당, 해시태그 하나씩 입력해주세요.</label>
		                                    		<div class="form-group" id="hashtagPlace">
														<div class="input-group">
														    <span class="input-group-addon"><i class="fas fa-hashtag"></i></span>
														    <input type="text" class="form-control" id="inputHashtag" name="hashtag[0].hashtag" placeholder="ex) 오션뷰" style="height:34px;">
														</div>
													</div>
												</div>
											</div>
											
										</div>
									</div>
								</div>
								<!--  End step 3 -->
	
	
								<div class="tab-pane" id="step4">
									<h3 class="info-text">Finished and submit</h3>
									<div class="row">
										<div class="col-sm-12">
											<div class="">
												<p>
													<label><strong>나중에 추가</strong></label> 
													약관 및 동의.. 등록비 내용 이런거....
												</p>
	
												<div class="checkbox">
													<label> <input type="checkbox" /> <strong>Accept
															termes and conditions.</strong>
													</label>
												</div>
	
											</div>
										</div>
									</div>
								</div>
								<!--  End step 4 -->
	
							</div>
	
							<div class="wizard-footer">
								<div class="pull-right">
									<input type='button' class='btn btn-next btn-primary' name='next' value='Next' /> 
									<input type='button' class='btn btn-finish btn-primary' name='finish' id="roomSubmit" value='Finish' />
								</div>
	
								<div class="pull-left">
									<input type='button' class='btn btn-previous btn-default'
										name='previous' value='Previous' />
								</div>
								<div class="clearfix"></div>
							</div>
						</form>
					</div>
					<!-- End submit form -->
				</div>
			</div>
		</div>
	</div>
	
	<!--footer.jsp 시작  -->
    	<c:import url="../partial\\footer.jsp"/>
    <!--footer.jsp 끝  -->
	
	<script src="${pageContext.request.contextPath}/accom/js/vendor/modernizr-2.6.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/accom/js//jquery-1.10.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/accom/js/bootstrap-select.min.js"></script>
    <script src="${pageContext.request.contextPath}/accom/js/bootstrap-hover-dropdown.js"></script>
    <script src="${pageContext.request.contextPath}/accom/js/easypiechart.min.js"></script>
    <script src="${pageContext.request.contextPath}/accom/js/jquery.easypiechart.min.js"></script>
    <script src="${pageContext.request.contextPath}/accom/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath}/accom/js/wow.js"></script>
    <script src="${pageContext.request.contextPath}/accom/js/icheck.min.js"></script>

    <script src="${pageContext.request.contextPath}/accom/js/price-range.js"></script> 
    <script src="${pageContext.request.contextPath}/accom/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/accom/js/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/accom/js/wizard.js"></script>

    <script src="${pageContext.request.contextPath}/accom/js/main.js"></script>
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	// 물품옵션 폼 추가시 사용하는 스크립트 이벤트
	let numItem = 0;
	
	$('#addItem').click(function(){
		numItem = numItem + 1;
		let inputItem = '<div id="itemForm">';
		inputItem += '<label>Name</label>';
		inputItem += '<input type="text" class="form-control" id="accomRommItemName" name="accomRoomItem[0].accomRoomItemName" placeholder="ex) 칫솔" style="height:34px;">';
		inputItem += '<label>Quantity</label>';
		inputItem += '<div class="input-group">';
		inputItem += '<input type="number" class="form-control" name="accomRoomItem[0].accomRoomItemQnt" placeholder="ex) 2" style="height:34px;">';
		inputItem += '<span class="input-group-text">개</span>';
		inputItem += '</div>';
		inputItem += '<label>Price</label>';
		inputItem += '<div class="input-group">';
		inputItem += '<input type="number" class="form-control" name="accomRoomItem[0].accomRoomItemPrice" placeholder="ex) 2000" style="height:34px;">';
		inputItem += '<span class="input-group-text">원</span>';
		inputItem += '</div>';
		inputItem += '</div>';
		$('#itemPlace').append(inputItem);
	});
	
	// 물품옵션 폼 삭제시 사용하는 스크립트 이벤트
	$('#delItem').click(function(){
		if($('div[id=itemForm]').length>1){
			numItem = numItem - 1;
			$('div[id=itemForm]:last').remove();
		} else {
			alert("한 가지 이상의 물품을 입력해주세요!");
		}
	});
	
	// 해시태그 폼 추가시 사용하는 스크립트 이벤트
	let numHashtag = 0;
	
	$('#addHashtag').click(function(){
		numHashtag = numHashtag + 1;
		let inputHashtag = '<div class="input-group">';
		inputHashtag += '<span class="input-group-addon"><i class="fas fa-hashtag"></i></span>';
		inputHashtag += '<input type="text" class="form-control" id="inputHashtag" name="hashtag['+numHashtag+'].hashtag" style="height:34px;">';
		inputHashtag += '</div>';
		$('#hashtagPlace').append(inputHashtag);
	});
	
	// 해시태그 폼 삭제시 사용하는 스크립트 이벤트
	$('#delHashtag').click(function(){
		if($('input[id=inputHashtag]').length>1){
			numHashtag = numHashtag - 1;
			$('input[id=inputHashtag]:last').remove();
			$('span[class=input-group-addon]:last').remove();
		} else {
			alert("한 가지 이상의 해시태그를 입력해주세요!");
		}
	});
	
	$('#roomSubmit').click(function(){
		$('#accomRoomForm').submit();
	});
	</script>

</body>
</html>