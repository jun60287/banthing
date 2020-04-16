<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<link rel="stylesheet" href="<c:url value="/resources/css/nav.css"/>">
<div class="container-fluid">
	<div class="navbar-header">
	  <!-- 웹 -->
		<div class="top-box2">
			<div class="name-set">
				<h1><strong><a href="index.2">반띵</a></strong></h1>
				<img width="170" height="170" src="<c:url value="/resources/img/logo.jpg"/>">
				<hr>
			</div>
			<div class="catergory-set">
				<ul>
					<li><h2><a href="notice.2">공지 사항</a></h2></li>
					<li><h2><a href="alram.2">알림 정보</a></h2></li>
					<li><h2><a href="member.2">회원 정보</a></h2></li>
					<li><h2><a href="mychat.2">내 채팅방</a></h2></li>
				</ul>
			</div>
		</div>
	<!-- 앱 -->
		<div class="rows top-box">
			<div class="col-xs-4">
				<h1><strong>(로고)</strong></h1>
			</div>
			<div class="col-xs-4">
				<h1><strong>반띵</strong></h1>
			</div>
			<div id="myroom-setting" class="col-xs-4">
				<a href="#" id="myroom"><i class="fas fa-sms fa-4x"></i></a>
			</div>
		</div>
	</div>
</div>
      
