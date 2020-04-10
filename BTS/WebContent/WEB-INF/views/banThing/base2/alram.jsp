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
	.table{
		font-size:20px;
	}
}
</style>


<!-- 768px 이하 -->
<div class="main3">
	<table class="table">
	      <thead>
	        <tr>
	          <th>#</th>
	          <th>내용</th>
	          <th>알람 일</th>
	        </tr>
	      </thead>
	      <tbody>
	        <tr>
	          <th scope="row">1</th>
	          <td>~~~님이 #ㅋㅋ로 방을 개설 했습니다</td>
	          <td>01.02 21:22</td>
	        </tr>
	        <tr>
	          <th scope="row">2</th>
	          <td>~~~님이 ○○○방에 참여하였습니다.</td>
	          <td>02.05 05:22</td>
	        </tr>
	        <tr>
	          <th scope="row">3</th>
	          <td>앙 기모딱따구리 ~</td>
	          <td>03.06 02:22</td>
	        </tr>
	    </table>
</div>

