<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="assets/js/wow.js"></script>
<link rel="stylesheet" href="assets/css/hashtag.css">
</head>
<body>
	<div id="hashtag_search">
		<div class="center_wrap">
			<div class="hero__caption">
				<span>Voy Age</span>
		        <h1>더 다양한 해시태그가 궁금하다면?</h1>
		        <span class="scroll">scroll !</span>
			</div>
		</div>
	</div>
	<div class="center_wrap" style="padding-top: 100px;">
		<c:forEach items="${hashtagList }" var="hashtag" varStatus="status">
			<a href="#?hashtag=${hashtag.hashtag }&id=hashtag${status.count}">
				<button type="submit" class="btn wow pulse fadeInDown animated" data-wow-delay="0.${status.count }s"
						style="visibility: visible; animation-delay: 0.${status.count}s; animation-name: fadeInDown;"
						id="hashtag${status.count}" >
					#${hashtag.hashtag },${status.count }
				</button>
			</a>
		</c:forEach>
	</div>
	
	<script type="text/javascript">
	
	//  해시태그 버튼을 나타낼 때 사용하는 이벤트
	let arr = [];
	for(let i=0; i<50; i++) {
		arr[i] = i+1; // 1~50
	}
	for(let i=0; i<10000; i++) {
		let temp = arr[0];
		let ranNum = Math.floor(Math.random()*50); // 0~50
		arr[0] = arr[ranNum];
		arr[ranNum] = temp;
	}
	var largeNum = arr.slice(25, 40);
	var smallNum = arr.slice(10, 20);
	
	// larg Button
	var idL0 = 'hashtag' + largeNum[0];
	var idL1 = 'hashtag' + largeNum[1];
	var idL2 = 'hashtag' + largeNum[2];
	var idL3 = 'hashtag' + largeNum[3];
	var idL4 = 'hashtag' + largeNum[4];
	var idL5 = 'hashtag' + largeNum[5];
	var idL6 = 'hashtag' + largeNum[6];
	var idL7 = 'hashtag' + largeNum[7];
	var idL8 = 'hashtag' + largeNum[8];
	var idL9 = 'hashtag' + largeNum[9];
	var idL10 = 'hashtag' + largeNum[10];
	var idL11 = 'hashtag' + largeNum[11];
	var idL12 = 'hashtag' + largeNum[12];
	var idL13 = 'hashtag' + largeNum[13];
	var idL14 = 'hashtag' + largeNum[14];
	
	document.getElementById(idL0).style.fontSize = '1.5em';
	document.getElementById(idL0).style.padding = '1.8em';
	document.getElementById(idL0).style.borderRadius = '1.8em';
	document.getElementById(idL0).style.backgroundColor = 'rgba(249, 52, 50)';
	
	document.getElementById(idL1).style.fontSize = '1.5em';
	document.getElementById(idL1).style.padding = '1.8em';
	document.getElementById(idL1).style.borderRadius = '1.8em';
	document.getElementById(idL1).style.backgroundColor = 'rgba(249, 52, 50)';
	
	document.getElementById(idL2).style.fontSize = '1.5em';
	document.getElementById(idL2).style.padding = '1.8em';
	document.getElementById(idL2).style.borderRadius = '1.8em';
	document.getElementById(idL2).style.backgroundColor = 'rgba(249, 52, 50)';
	
	document.getElementById(idL3).style.fontSize = '1.5em';
	document.getElementById(idL3).style.padding = '1.8em';
	document.getElementById(idL3).style.borderRadius = '1.8em';
	document.getElementById(idL3).style.backgroundColor = 'rgba(249, 52, 50)';
	
	document.getElementById(idL4).style.fontSize = '1.5em';
	document.getElementById(idL4).style.padding = '1.8em';
	document.getElementById(idL4).style.borderRadius = '1.8em';
	document.getElementById(idL4).style.backgroundColor = 'rgba(249, 52, 50)';
	
	document.getElementById(idL5).style.fontSize = '1.5em';
	document.getElementById(idL5).style.padding = '1.8em';
	document.getElementById(idL5).style.borderRadius = '1.8em';
	
	document.getElementById(idL6).style.fontSize = '1.5em';
	document.getElementById(idL6).style.padding = '1.8em';
	document.getElementById(idL6).style.borderRadius = '1.8em';
	
	document.getElementById(idL7).style.fontSize = '1.5em';
	document.getElementById(idL7).style.padding = '1.8em';
	document.getElementById(idL7).style.borderRadius = '1.8em';
	
	document.getElementById(idL8).style.fontSize = '1.5em';
	document.getElementById(idL8).style.padding = '1.8em';
	document.getElementById(idL8).style.borderRadius = '1.8em';
	
	document.getElementById(idL9).style.fontSize = '1.5em';
	document.getElementById(idL9).style.padding = '1.8em';
	document.getElementById(idL9).style.borderRadius = '1.8em';
	
	document.getElementById(idL10).style.fontSize = '1.5em';
	document.getElementById(idL10).style.padding = '1.8em';
	document.getElementById(idL10).style.borderRadius = '1.8em';
	
	document.getElementById(idL11).style.fontSize = '1.5em';
	document.getElementById(idL11).style.padding = '1.8em';
	document.getElementById(idL11).style.borderRadius = '1.8em';
	
	document.getElementById(idL12).style.fontSize = '1.5em';
	document.getElementById(idL12).style.padding = '1.8em';
	document.getElementById(idL12).style.borderRadius = '1.8em';
	
	document.getElementById(idL13).style.fontSize = '1.5em';
	document.getElementById(idL13).style.padding = '1.8em';
	document.getElementById(idL13).style.borderRadius = '1.8em';
	
	document.getElementById(idL14).style.fontSize = '1.5em';
	document.getElementById(idL14).style.padding = '1.8em';
	document.getElementById(idL14).style.borderRadius = '1.8em';
	
	// small Button
	var idS0 = 'hashtag' + smallNum[0];
	var idS1 = 'hashtag' + smallNum[1];
	var idS2 = 'hashtag' + smallNum[2];
	var idS3 = 'hashtag' + smallNum[3];
	var idS4 = 'hashtag' + smallNum[4];
	var idS5 = 'hashtag' + smallNum[5];
	var idS6 = 'hashtag' + smallNum[6];
	var idS7 = 'hashtag' + smallNum[7];
	var idS8 = 'hashtag' + smallNum[8];
	var idS9 = 'hashtag' + smallNum[9];
	
	document.getElementById(idS0).style.fontSize = '0.8em';
	document.getElementById(idS0).style.padding = '1.3em';
	document.getElementById(idS0).style.borderRadius = '1.3em';
	document.getElementById(idS0).style.backgroundColor = 'rgba(249, 52, 50)';
	
	document.getElementById(idS1).style.fontSize = '0.8em';
	document.getElementById(idS1).style.padding = '1.3em';
	document.getElementById(idS1).style.borderRadius = '1.3em';
	document.getElementById(idS1).style.backgroundColor = 'rgba(249, 52, 50)';
	
	document.getElementById(idS2).style.fontSize = '0.8em';
	document.getElementById(idS2).style.padding = '1.3em';
	document.getElementById(idS2).style.borderRadius = '1.3em';
	document.getElementById(idS2).style.backgroundColor = 'rgba(249, 52, 50)';
	
	document.getElementById(idS3).style.fontSize = '0.8em';
	document.getElementById(idS3).style.padding = '1.3em';
	document.getElementById(idS3).style.borderRadius = '1.3em';
	
	document.getElementById(idS4).style.fontSize = '0.8em';
	document.getElementById(idS4).style.padding = '1.3em';
	document.getElementById(idS4).style.borderRadius = '1.3em';
	
	document.getElementById(idS5).style.fontSize = '0.8em';
	document.getElementById(idS5).style.padding = '1.3em';
	document.getElementById(idS5).style.borderRadius = '1.3em';
	
	document.getElementById(idS6).style.fontSize = '0.8em';
	document.getElementById(idS6).style.padding = '1.3em';
	document.getElementById(idS6).style.borderRadius = '1.3em';
	
	document.getElementById(idS7).style.fontSize = '0.8em';
	document.getElementById(idS7).style.padding = '1.3em';
	document.getElementById(idS7).style.borderRadius = '1.3em';
	
	document.getElementById(idS8).style.fontSize = '0.8em';
	document.getElementById(idS8).style.padding = '1.3em';
	document.getElementById(idS8).style.borderRadius = '1.3em';
	
	document.getElementById(idS9).style.fontSize = '0.8em';
	document.getElementById(idS9).style.padding = '1.3em';
	document.getElementById(idS9).style.borderRadius = '1.3em';

	</script>
	
</body>
</html>