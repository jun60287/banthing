<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<style>
@media (min-width:768px){
	.container .jumbotron, .container-fluid{
	    padding-left: 5px;
	    padding-top:0px;
	    padding-right:0px;
	    padding-bottom:0px;
	}
	.main3{
		padding:5px;
		font-size:45px;
		width:100%;
		height:100%;
		background-color:#58ACFA;
	}
	.icon_set{
		margin-top:80px;
		text-align: center;
	}
	.icon_set button{
		width:60%;
		margin:20px;
		font-size:0.8em; 
	}
	
}
</style>


<!-- 768px 이하 -->
<div class="main3">
	<div id="member-set" class="icon_set">
		<button class="btn btn-warning">
			로그 아웃
		</button><br/>
		<button class="btn btn-warning" onclick="window.location.href='update.1'">
			사용자 정보 변경
		</button><br/>
		<button class="btn btn-warning">
			알림 설정
		</button><br/>
		<button class="btn btn-warning">
			친구 목록
		</button><br/>
		<button class="btn btn-warning" onclick="popup()">
			회원 탈퇴
		</button><br/>
	</div>
</div>
<script>
function popup(){
    var url = "checkPs.1";
    var name = "popup test";
    var option = "width = 500, height = 500, top = 100, left = 200, location = no"
    window.open(url, name, option);
    
}
</script>

