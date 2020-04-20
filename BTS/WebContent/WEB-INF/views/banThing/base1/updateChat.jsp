<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value="/resources/css/base1/updateChat.css?"/>">

<div id="index">
	<div class="name">
		<h1 class="bts">반띵</h1>
		<img width="150" height="150" src="<c:url value="/resources/img/logo.jpg"/>">
	</div>
	<div class="signup-setting">
			<form name="web_RoomSet" class="web_RoomSet" action="updateChat" method="post" enctype="multipart/form-data">
           		<input type="hidden" name="id" value="${sessionId}"/>
           		<input type="hidden" name="num" value="${vo.num}"/>
           		<input type="hidden" name="img" value="${vo.img}"/>
           		<input type="text" class="btn" name="title" placeholder="방제목" value="${vo.title }"><br/>
				<select class="btn" name="options" id="optionsSelect">
					<option value="" >카테고리 설정</option>
					<option value="치킨" >치킨</option>
					<option value="햄버거" >햄버거</option>
					<option value="피자" >피자</option>
				</select><br/>
				<input type="text" class="btn" name="tag" placeholder="#해쉬태그, #이렇게, #작성하세요," value="${vo.tag }"><br/>
				<input type="text" class="btn" name="product" placeholder="상품이름" style="width:140px;" value="${vo.product}">
				<input type="text" class="btn" name="price" placeholder="상품가격" style="width:140px;" value="${vo.price }"><br/>
				<select class="btn" name="pay" id="paySelect" value="${vo.pay}" >
					<option value="">거래 방식</option>
					<option value="협의">협의</option>
					<option value="만나서">만나서</option>
					<option value="계좌이체">계좌이체</option>
					<option value="안전거래">안전거래</option>
				</select><br/>
				<select class="btn" name="gender" style="width:140px;" id="genderSelect" value="${vo.gender }" >
					<option value="">성별</option>
					<option value="무관">무관</option>
					<option value="여자">여자</option>
					<option value="남자">남자</option>
				</select>
				<select class="btn" name="personnel" style="width:140px;" id="personnelSelect" value="${vo.personnel }">
					<option value="">인원수</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
				</select>
				<input type="text" class="btn" name="place" id="place" placeholder="거래 장소" style="width:220px;" readonly="readonly" value="${vo.place}">
				<input type="hidden" name="placeInfo" id="placeInfo" >
				<input type="button" class="btn" value="검색" onclick="address_setting()" style="width:60px;"><br/>
				<input type="file" id="file" class="btn" name="orgImg" placeholder="상품 이미지" ><br/>
				<textarea name="content" >${vo.content}</textarea></br>
		        <button type="button" class="btn web_Exit" id="web_RoomExitBtn">닫기</button>
		        <button class="btn web_RoomOpen" id="web_RoomOpenBtn" onclick="submit" >수정</button>
           </form>
	</div>
</div>

<c:if test="${update == 'success'}">
	<script>
		alert('채팅방 수정이 완료되었습니다.');
		self.close();
	</script>
</c:if>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 유효성 검사 & 정규식 표현 -->
<script>

	$(document).ready(function () {
		// option값으로 자동 셀렉 (selected)
		$("#paySelect").val("${vo.pay}");
		$("#optionsSelect").val("${vo.options}");
		$("#genderSelect").val("${vo.gender}");
		$("#personnelSelect").val("${vo.personnel}");
	});
	function address_setting(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	$("#place").val(data['address']);
	        }
	    }).open();
	}

</script>
