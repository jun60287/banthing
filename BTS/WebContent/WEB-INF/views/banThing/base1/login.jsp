<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <style>
	 	.name{
			text-align:center;
			margin-top:20px;
			margin-bottom: 20px;
		}
		.name>.bts{
			font-size:5em;
		}
		.login{
			margin-top:5%;
			text-align:center;
		}
		#login input[type="text"]{
			font-size:25px;margin-bottom:5px;
		}
		.g-signin2{
			display: none;
		}
		.btn-setting input[type="submit"]{
			font-size:25px;
			margin-bottom:5px;
			width:314px;
		}
		.btn-setting button{
			font-size:25px;
			margin-bottom:5px;
			width:314px;
		}
	@media (min-width: 768px) {
    #index{
    	margin-left:-35%;
    }
	}
 	@media (max-width: 768px) {
 		.name{
 			margin-top:-40px;
 		}
		.login{
			padding-top:10%;
			margin-top:-10%;
		}
	}
 </style>
<c:if test="${ signup eq 'success' }">
	<script>
		alert('회원가입이 완료되었습니다.');
	</script>
</c:if>
<c:if test="${ check eq 'err' }">
	<script>
		alert('아이디와 비밀번호를 확인하세요.');
	</script>
</c:if>
<c:if test="${ logout eq 'success' }">
	<script>
		alert('로그아웃이 완료되었습니다.');
		window.location.href="login.1";
	</script>
</c:if>
<div id="index">
	<div class="name">
		<h1 class="bts">반띵</h1>
		<h1>(로고)</h1>
	</div>
	<div class="login">
		<form id="login" action="login.1" method="post">
			<input type="text" id="id" name="id" class="btn" placeholder="ID"><br/>
			<input type="text" id="pw" name="pw" class="btn" placeholder="PW">
			<br/><br/><br/>
			<div class="btn-setting">
				<input type="submit" class="btn btn-info" value="일반 로그인" onclick="loginCheck()"><br/>
				<button type="button" class="btn btn-warning" onclick="kakao()">
					카카오톡 로그인
				</button><br/>
				<button type="button" class="btn btn-success" onclick="naver()">
					네이버 로그인
				</button><br/>
				<button type="button" onclick="window.location.href='signup.1'" class="btn btn-info">
					일반 회원가입
				</button><br/>
			</div>
		</form>
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  

<script>
	/* 일반 */
	function loginCheck(){
	  if ($('#id').val() == '' || $('#pw').val() == ''){
	    alert('아이디 혹은 비밀번호를 입력하세요.');
	  }
	}
	/*카카오 */
	function kakao(){
		var app_key='f3009baa4d561e7bb39263c63ba9a21b';
		var redirect_uri= 'http://localhost:8080/BTS/banThing/kakaologin';
		var kakao_url='https://kauth.kakao.com/oauth/authorize?client_id='
				+app_key+'&redirect_uri='+redirect_uri
				+'&response_type=code';
		open(kakao_url, "카카오" , "toolbar=no, status=no, menubar=no, scrollbars=no, resizalbe=no, width=600px, height=600px,left=400px,top=200px");
	}
	
	/*  네이버*/
	function naver(){
		var app_key='0KysF2IHcVjPstU2EXpu';
		var redirect_uri='http://192.168.0.136:8080/BTS/banThing/naverlogin';
		var kakao_url='https://nid.naver.com/oauth2.0/authorize?client_id='
				+app_key+'&redirect_uri='+redirect_uri
				+'&response_type=code';
		open(kakao_url, "카카오" , "toolbar=no, status=no, menubar=no, scrollbars=no, resizalbe=no, width=600px, height=600px,left=400px,top=200px");
	}
</script>
