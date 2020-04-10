<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	 	.name{
			text-align:center;
		}
		.name>.bts{
			font-size:3em;
		}
		.signup-setting{
			text-align:center;
		}
		.signup-setting input{
			font-size:16px;
			margin-bottom:5px;
			padding: 8px;
			width:50%;
		}

		.signup-setting button{
			font-size:22px;
			margin-bottom:5px;
			width:55%;
		}
@media (min-width: 768px) {
    #index{
    	margin-left:-35%;
    }
}
	@media (max-width: 768px) {

	}
</style>
<c:if test="${update eq 'success'}">
	<script>
		alert('본인인증 성공.');
	</script>
</c:if>
<div id="index">
	<div class="name">
		<h1 class="bts">반띵</h1>
		<h1 class="bts">(로고)</h1>
		<h3 class="bts">탈퇴확인</h3>
	</div>
	<div class="signup-setting">
	<!-- //onsubmit="return check()" -->
	
			<br/>
			<form name="deleteForm" action="delete.1"  method="post">
			<button onclick="window.location.href='delete.1'" class="btn btn-info">
				탈퇴
			</button>
			</form>
			<button onclick="window.location.href='member.2'" class="btn btn-info">
				뒤로가기
			</button>
	</div>
</div>
