<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value="/resources/css/base2/member.css"/>">

<!-- 768px 이하 -->
<div class="main3">
	<div id="member-set" class="icon_set">
		<button class="btn btn-warning" onclick="window.location.href='logout'">
			로그아웃
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

