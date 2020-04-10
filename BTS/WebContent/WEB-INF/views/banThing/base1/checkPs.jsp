<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
 <style>
	 	.name{
			text-align:center;
			margin-top:20px;
			margin-bottom: 20px;
		}
		.name.bts{
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
		#login input[type="submit"]{
			font-size:25px;
			margin-bottom:20px;
			width:314px;
		}
		.btn-setting button{
			font-size:25px;
			margin-bottom:5px;
			width:400px;
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
 <c:if test="${check eq 'err'}">
 	<script>
 	alert('비밀번호를 확인하세요');
 	</script>
 </c:if>
 <c:if test="${check eq 'success' }">
 	<script>
 	function cancle(){
 		opener.window.location="delete.1";
 		close();
 	}
 	cancle();
 	</script>
 </c:if>
 <div id="index">
	<div class="name">
		<h1 class="bts">반띵</h1>
		<h1>(로고)</h1></br>
		<h3 class="bts">본인인증</h2>
	</div>
	</br>
	<div class="login">
		<form id="check" action="checkPs.1" method="post">
			<input type="password" id="pw" name="pw" class="btn" placeholder="PW">
			<input type="submit" class="btn btn-info" value="확인"/><br/>
		</form>
	</div>
	
</div>
<script>
function loginCheck(){
	  if ($('#id').val() == '' || $('#pw').val() == ''){
	    alert('아이디 혹은 비밀번호를 입력하세요.');
	  }
	}
</script>