<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="<c:url value="/resources/css/base1/mychat.css?val=3"/>">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script>
	$(document).ready(function(){
		$("#button").click(function(){
			var root = $(this).attr('value');
			location.href="mychat.2?num="+root;
		})
	})
	$(document).ready(function(){
		$("#button2").click(function(){
			var root = $(this).attr('value');
			location.href="mychat.2?num="+root;
		})
	})
</script>
<div id="index">
	<c:if test="${num eq null}">
	<div class="btn-setting">
			<button id="button"  value="1" >내가 만든방</button>
			<button id="button2"  value="2" >들어간 방</button>
	</div>
	</c:if>
	<c:if test="${num eq '1'}">
		<div class="name">
			<h3 class="bts">내 채팅방</h3>
		</div>
			<div class="login">
				<table class="table" style="width:100%;">
					<thead>
						<tr>
							<td>방제목</td>
							<td>상품명</td>
							<td>최대인원</td>
							<td>지역</td>
						</tr>
					</thead>
						<tbody>
						<c:forEach items="${chatList}" var="list" varStatus="status">
								<tr>
									<td>${list.title}</td>
									<td>${list.product}</td>
									<td>${list.personnel}</td>
									<td>${fn:split(list.place,' ')[0]}</td>
								</tr>
						</c:forEach>
						</tbody>
				</table>
			</div>
		</c:if>
		<c:if test="${num eq '2'}">
			<div class="name">
				<h3 class="bts">내 채팅방</h3>
			</div>
				<div class="login">
					<table class="table" style="width:100%;">
						<thead>
							<tr>
								<td>방제목</td>
								<td>상품명</td>
								<td>최대인원</td>
								<td>지역</td>
							</tr>
						</thead>
							<tbody>
								<c:forEach items="${chatList}" var="list" varStatus="status">
										<tr>
											<td>${list.title}</td>
											<td>${list.product}</td>
											<td>${list.personnel}</td>
											<td>${fn:split(list.place,' ')[0]}</td>
										</tr>
								</c:forEach>
							</tbody>
					</table>
				</div>
		</c:if>
</div>

