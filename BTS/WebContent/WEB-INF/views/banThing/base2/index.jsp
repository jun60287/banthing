﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
/*  웹용768px 이상 */ 
@media (min-width:768px){

	.web{
		font-size:45px;
		width:100%;
		height:100%;
		z-index:1;
	}

	/* 1. 맵  */
	#web_Map{
		 width:100%;
		 height:100%;
	}
	/* 2.맵 아이콘 */
	
	.web_Icon{
		position:absolute;
		top:10px;
		z-index:10;
		font-size:30px;
		color:blue;
	}
	
	.web_Icon a{
		color:#FF8000;
	}
	.web_Icon a:hover{
		color:white;
	}
	
	
	/* 3. 방 개설 */
	.web_Room {
	    display: none; 
	    background-color:#58ACFA;
	    height:80%;
	    width:70%;
	    position:absolute;
	    z-index:10;
		top:10%;
		right:10%;
		font-size:30px;
		text-align:center;
	}
	.web_Room h1{
		 color:black;
		 font-size:25px;
	}
	.web_RoomSet input[type="text"]{
		margin-top:10px;
		width:75%;
		text-align:left;	
	}
	.web_RoomSet select{
		margin-top:10px;
		width:75%;
	}
	
	/* 서로 중복*/
	.web_Exit {
	    position: absolute;
	    left: 15%;
	    bottom: 10px;
	    transform: translate(-50%,0);
	    text-align: center;
	    font-size: 15px;
	}   
	.web_RoomOpen {
	    position: absolute;
	    right: 5%;
	    bottom: 10px;
	    transform: translate(-50%,0);
	    text-align: center;
	    font-size: 15px;
	}   


	/* 4. 맵 필터 설정  */
	.web_MapFilter {
	    display: none; 
	    background-color:#58ACFA;
	    height:80%;
	    width:70%;
	    position:absolute;
	    z-index:10;
		top:10%;
		right:10%;
		font-size:30px;
		text-align:center;
	}	
	
	.web_MFName{
		height:20%
	}
	.web_MFName h1{
		font-size:30px;
		margin-bottom:30px;
	}
	
	.web_MFSetting{
		height:60%;
	}
	.web_MFSetting p{
		font-size:22px;
	}
	.web_MFSetting button{
		width:60%;
		font-size:23px;
		margin:20px;
	}
	.web_MFSetting select{
		width:60%;
		font-size:23px;
		margin:20px;
	}
	
	.web_MFBtn{
		height:20%;
	}
	
	.web_MFBtn button{
		font-size:25px;
	}
	
	/* 5.내 채팅방  */
	.web_MyRoom {
	    display: none; 
	    background-color:#58ACFA;
	    height:80%;
	    width:70%;
	    position:absolute;
	    z-index:10;
		top:10%;
		right:10%;
		font-size:30px;
		text-align:center;
	}
	
	.web_MyRoom p {
	    margin-top: 80px;
	}
	.web_MyRoom h1 {
		font-size: 32px;
	}
	
	/* 6. 전체 채팅방  */
	.web_AllRoom {
	    display: none; 
	    overflow:scroll;
	    background-color:#58ACFA;
	    height:80%;
	    width:70%;
	    position:absolute;
	    z-index:5;
		top:10%;
		right:10%;
		font-size:30px;
		text-align:center;
	}
	
	.web_AllRoom p {
	    margin-top: 80px;
	}
	.web_AllRoom h1 {
		font-size: 32px;
	}
	
	/* 기본적인 전체 셋팅 */
	.container .jumbotron, .container-fluid{
	    padding-left: 5px;
	    padding-top:0px;
	    padding-right:0px;
	    padding-bottom:0px;
	}

	#popup1{
		display:none;
	}
	
}
</style>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a44d7ff9bef3120be5c58e8aa20ddfe0&libraries=clusterer,services"></script>
<script  src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script> 

<!-- 웹 -->
<div class="web">
	<div style="width:100%;height:100%;position:relative;">
			<!-- 지우지마샘 
 		<button class="btn btn-warning" onclick="window.location.href='kakaoAlram'" 
		>카톡메세지보내기</button>
		<button class="btn btn-warning" onclick="window.location.href='logOut'" 
		>연결끊기 </button> -->
		 

		<!-- 웹 1. 맵 -->
		<div id="web_Map"></div>
		
		<!-- 웹 2. 맵 아이콘  왼쪽/아래쪽/오른쪽-->
		<div class="web_Icon" style="left:10px">
			<a href="#" id="web_refresh" style="left:10;"><i class="fas fa-redo-alt fa-2x"></i></a>
		</div>
		<div class="web_Icon" style="right:10px">
			<a href="#" id="web_MyRoomBtn"><i class="fas fa-sms fa-2x"></i></a>
			<a href="#" id="web_MapFilterBtn"><i class="fas fa-filter fa-2x"></i></a>
			<a href="#" id="web_RoomBtn"><i class="fas fa-plus fa-2x"></i></a>
		</div>
		<div class="web_Icon" style="right:0px;top:50%">
			<a href="#" id="web_AllRoomBtn"><i class="fas fa-arrow-left fa-2x"></i></a>
		</div>
		
		<!--웹 3. 방 개설  -->
		<div class="web_Room">
		
			<h1> 방 개설</h1>
			
			<!-- 웹 방 개설 셋팅 -->   <!-- onsubmit="return check()"  -->
				<form name="web_RoomSet" class="web_RoomSet" action="submit" method="post" enctype="multipart/form-data">
	           		<input type="hidden" name="id" value="${sessionId}"/>
	           	
	           		<input type="text" class="btn" name="title" placeholder="방제목"><br/>
					<select class="btn" name="options">
						<option value="">카테고리 설정</option>
						<option value="치킨">치킨</option>
						<option value="햄버거">햄버거</option>
						<option value="피자">피자</option>
					</select><br/>
					<input type="text" class="btn" name="tag" placeholder="#해쉬태그, #이렇게, #작성하세요,"><br/>
					<input type="text" class="btn" name="product" placeholder="상품이름" style="width:140px;">
					<input type="text" class="btn" name="price" placeholder="상품가격" style="width:140px;"><br/>
					<select class="btn" name="pay">
						<option value="">거래 방식</option>
						<option value="협의">협의</option>
						<option value="만나서">만나서</option>
						<option value="계좌이체">계좌이체</option>
						<option value="안전거래">안전거래</option>
					</select><br/>
					<select class="btn" name="gender" style="width:140px;">
						<option value="">성별</option>
						<option value="무관">무관</option>
						<option value="여자">여자</option>
						<option value="남자">남자</option>
					</select>
					<select class="btn" name="personnel" style="width:140px;">
						<option value="">인원수</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
					</select>
					<input type="text" class="btn" name="place" id="place" placeholder="거래 장소" style="width:220px;" readonly="readonly">
					<input type="hidden" name="placeInfo" id="placeInfo" >
					<input type="button" class="btn" value="검색" onclick="address_setting()" style="width:60px;"><br/>
					<input type="file" class="btn" name="orgImg" placeholder="상품 이미지"><br/>
					<textarea name="content"> 내용 </textarea>
			        <button type="button" class="btn web_Exit" id="web_RoomExitBtn">닫기</button>
			        <button class="btn web_RoomOpen" id="web_RoomOpenBtn" onclick="submit" >개설</button>
	           </form>

			<!-- 방 버튼 -->
	        
	   </div>
	   
		<!-- 4. 맵 필터 설정  -->
		<div class="web_MapFilter">
		
       		<div class="web_MFName">
				<h1>맵 필터 <br/>설정</h1>
			</div>
			
			<div class="web_MFSetting" style="height:60%">
				<select class="btn" id="address1">
					<option value="1">서울</option>
					<option value="2">부산</option>
					<option value="3">광주</option>
					<option value="4">울산</option>
					<option value="5">인천</option>
				</select>
				<select class="btn">
					<option>카테고리 설정</option>
					<option>안알랴줌2</option>
					<option>안알랴줌3</option>
				</select>
			</div>
			
			<div class="btn web_MFBtn" style="height:20%">
				<button class="btn exit3" id="web_MapFilterExitBtn">닫기</button>
				<button onclick="tossvl()" class="btn">
					적용
				</button>
				<button onclick="window.location.href='index.2'" class="btn">
					전체
				</button>
			</div>
			
	   </div> 
	   
	<!-- 5.내 채팅 목록  -->
	<div class="web_MyRoom">
	
       		<h1 style="color:black">내 채팅 목록</h1>
       		<table class="table">
		      <tbody>
		        <tr>
		          <td><strong>방 제목</strong></td>
		          <td><strong>인원수</strong></td>
		        </tr>
		      	<tr>
		      		<td><a>안 알려줌</a></td>
		      		<td>1/2</td>
		      	</tr>
		      	<tr>
		      		<td><a>안 알려줌</a></td>
		      		<td>3/5</td>
		      	</tr>
		      </tbody>
		    </table>
           <button class="btn web_Exit" id="web_MyRoomExitBtn">닫기</button>
       </div>
	</div>
	
	<!-- 6.전체 채팅 목록  -->
	<div class="web_AllRoom">
	
		<!-- 방 상세보기 -->
		<div class="web_AllRoomDetail" style="display:none;width:100%;height:100%;font-size:30px;">
			<h1 style="color:black">방 정보</h1>
			<table class="table" id="web_ARDTable">
		    </table>
		</div>
		<!-- 방 목록 보기 -->
		<div class="web_AllRoomView">
			<h1 style="color:black">채팅 목록</h1>
			<table class="table">
	     		<thead>
		      		<tr>
			          <td><strong>번호</strong></td>
			          <td><strong>방 제목</strong></td>
			          <td><strong>인원수</strong></td>
			          <td><strong>방 정보</strong></td>
			          <td><strong></strong></td>
			        </tr>
	     		</thead>
		    	<tbody id="web_ARTbody">
		    	</tbody>
		    </table>
	    </div>
   </div>
</div>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	var chatInfo;
	function address_setting(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	            $("#place").val(data["address"]);
	            console.log(data);
				var geocoder = new kakao.maps.services.Geocoder();
	        	geocoder.addressSearch(data.address,function(result, status){
	        		 if (status === kakao.maps.services.Status.OK) {
	        		        $("#placeInfo").val(result[0].x+"-"+result[0].y);
	        		        console.log(result[0].x+"-"+result[0].y);
	        		 }
	        	});
	        }
	    }).open();
	}

	 var map = new kakao.maps.Map(document.getElementById('web_Map'), { // 지도를 표시할 div
		    center : new kakao.maps.LatLng("${lat}", "${lng}"), // 지도의 중심좌표 
		    level :${level}
	 });
	 
	function tossvl(){
		var val = $("#address1 option:selected").val();
		console.log(val);
		window.location.href="index.2?val="+val;
	}
 
	//새로고침시 마킹
	$("#web_refresh").click(function(){
		marking();
	})
	
	//시작할때 마킹
	$(document).ready(function(){
		marking();
	}) 
	//이동시 마킹
	kakao.maps.event.addListener(map, 'dragend', function() {        
		marking();
	});
	
	//마커 이쁘게 만드는거
	function addMarker(position, idx) {
	    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
	            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new kakao.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });

	    marker.setMap(map); // 지도 위에 마커를 표출합니다

	    return marker;
	}
	//맵 마킹
	function marking(){
	 	$.ajax({
			url:"chatinfo",
	        type: 'get',
	        dataType:'json',
	        contentType:"application/json;charset=UTF-8",
			success:function(data){
				chatInfo=data['chatList'];
			    var bounds = map.getBounds();
			    var sw = bounds.getSouthWest();  //남서쪽
			    var ne = bounds.getNorthEast(); //북동쪽 
			    var lb=new kakao.maps.LatLngBounds(sw, ne);
			    let result="";
		    	var count=0;
				$(data['chatList']).map(function(index, i) {
					var x=i.placeInfo.split('-')[0];
					var y=i.placeInfo.split('-')[1];
				    var markerposition=new kakao.maps.LatLng(y,x);
				    if(lb.contain(markerposition)){
			    		var marker=addMarker(markerposition,count);
				    	count++;
				    	/*방 정보 */
			    		result +="<tr>";
			    		result +="<td>"+count+"</td>";
			    		result +="<td>"+i.title+"</td>";
			    		result +="<td>"+"1/"+i.personnel+"</td>";
			    		result +="<td>"+"<button onclick='roomDetail("+i.num+")' class='btn'>상세보기</button>"+"</td>";
			    		result +="<td>"+"<button class='btn'>입장</button>"+"</td>";
			    		result +="</tr>";

				    }				    
					$("#web_ARTbody").html(result);
				});
	 		}
		});
	}
	
	
	
	function AllRoomDetailBack(){
        $(".web_AllRoomDetail").fadeOut();
        $(".web_AllRoomView").fadeIn();
    }
	
	/* 방정보 함수 */
	function roomDetail(num){
		var detail="";
		var room='';
		chatInfo.forEach(function(i,index){
			if(i.num==num){
				room=chatInfo[index];
			}
		})
		/*방 상세정보  */
		detail +="<tr><td><strong>방장</strong></td>";
		detail +="<td colspan='3'>안알랴줌</td></tr>";
		
		detail +="<tr><td><strong>제목</strong></td>";
		detail +="<td colspan='3'>"+room.title+"</td></tr>";
			
		detail +="<tr><td><strong>카테고리</strong></td>";
		detail +="<td>"+room.options+"</td>";
		detail +="<td><strong>해쉬태그</strong></td>";
		detail +="<td>#"+room.tag+"</td></tr>";
		
		detail +="<tr><td><strong>거래 방식</strong></td>";
		detail +="<td>"+room.pay+"</td>";
		detail +="<td><strong>가격</strong></td>";
		detail +="<td>"+room.price+"</td></tr>";
		
		detail +="<tr><td><strong>참여 가능 (성별)</strong></td>";
		detail +="<td>"+room.gender+"</td>";
		detail +="<td><strong>인원</strong></td>";
		detail +="<td>1/"+room.personnel+"</td></tr>";
		
		detail +="<tr><td><strong>내용</strong></td>";
		detail +="<td colspan='3'>"+room.content+"</td></tr>";
		
		detail +="<tr><td colspan='2'><button onclick='AllRoomDetailBack()' class='btn'>뒤로가기</button></td>";
		detail +="<td colspan='2'><button class='btn'>입장</button></td></tr>";
		
		$("#web_ARDTable").html(detail);
		$(".web_AllRoomView").fadeOut();
		$(".web_AllRoomDetail").fadeIn();
	}
 // 방 개설 정규식표현 및 유효성 검사
 	function check(){
		var chat = document.web_RoomSet;

		var regExp = /\s/g;
		var priceReg = /^[0-9]{3,19}$/g;
		var productReg = /^[가-힣ㄱ-ㅎㅏ-ㅣA-za-z0-9]{1,20}$/g;
		var titleReg = /^(?=[\S\s]{1,30}$)[\S\s]*/
		
		if(!chat.id.value){
			alert("로그인 후 이용가능합니다.");
			window.location.href="login.1";
			return false;
		}
		
 		if(!chat.title.value){
			alert("제목을 입력하세요.");
			return false;
		}
 		if(!titleReg.test(chat.title.value)){
			alert("제목 : 최대 30자, 특수문자 제외");
			return false;
		}
		if(chat.options.value == ""){
			alert("카테고리를 선택하세요.");
			return false;
		}
		if(!productReg.test(chat.product.value)){
			alert("상품이름 : 최대 20자, 특수문자 제외");
			return false;
		}
		if(!priceReg.test(chat.price.value)){
			alert("상품가격 : 숫자만 작성 가능");
			return false;
		}
		if(chat.pay.value == ""){
			alert("거래방식을 선택하세요.");
			return false;
		}
		if(chat.gender.value == ""){
			alert("성별을 선택하세요.");
			return false;
		}
		if(chat.personnel.value == ""){
			alert("인원수를 선택하세요.");
			return false;
		}
		if(!chat.place.value){
			alert("거래 장소를 선택하세요.");
			return false;
		}
		if(!chat.orgImg.value){
			alert("상품 이미지를 등록하세요.");
			return false;
		}
		
	}
 
	$(document).ready(function(){
		var count=0;
		var left=function(){
			$("#bottom,#map").toggle(500);
			$("#left_set").toggle(500);
		},
			bottom=function(){
			$("#left,#map").toggle(500);
			$("#bottom_set").toggle(500);
		},
			member=function(){
			init();
			$("#member-set").toggle(500);
		},
			notice=function(){
			init();
			$("#notice-set").toggle(500);
		},
			myroom=function(){
			init();
			$("#myroom-set").toggle(500);
		},
			addroom1=function(){
			$("#bottom-set,#left-set").hide();
            $("#popup1").fadeIn();
        },
       		web_AddRoom=function(){
            $("#web_Map").css("opacity","0.7");
            $(".web_Room").fadeIn();
        },
        	web_MapFilter=function(){
            $("#web_Map").css("opacity","0.7");
            $(".web_MapFilter").fadeIn();
        },
        	web_MyRoom=function(){
            $("#web_Map").css("opacity","0.7");
            $(".web_MyRoom").fadeIn();
        },
        	web_AllRoom=function(){
            $(".web_AllRoom").toggle(500);
        },
        	exit1=function(){
            $("#popup1").fadeOut();
        },
        	web_Exit=function(){
            $(".web_Room").fadeOut();
            $(".web_MapFilter").fadeOut();
            $(".web_MyRoom").hide(500);
            $("#web_Map").css("opacity","1");
        };
   
		
		function init(){
			if(count==0){
				count++;
				$("#left,#map,#bottom").hide(500);	
			}else{
				count--;
				$("#left,#map,#bottom").show(500);				
			}
		}
		
		//웹 
		//1.방 개설
		$("#web_RoomBtn").click(web_AddRoom);
		$("#web_RoomExitBtn").click(web_Exit);
		
		//2.맵필터 
		$("#web_MapFilterBtn").click(web_MapFilter);
		$("#web_MapFilterExitBtn").click(web_Exit);
		
		//3.내채팅방
		$("#web_MyRoomBtn").click(web_MyRoom);
		$("#web_MyRoomExitBtn").click(web_Exit);
		
		//4.전체 채팅방
		$("#web_AllRoomBtn").click(web_AllRoom);
		$("#web_AllRoomExitBtn").click(web_AllRoom);
		$("#web_AllRoomBackBtn").click(AllRoomDetailBack);
		
		//앱
		$("#left").click(left);
		$("#bottom").click(bottom);
		$("#member").click(member);
		$("#notice").click(notice);
		$("#myroom").click(myroom);
		$("#addroom1").click(addroom1);

	})
</script>

<!-- 

768px 이하
<div class="main1">
	<div class="min2">
		현재 채팅방 설명
		<div id="myroom-set" class="icon_set">
			<table class="table">
		      	<caption>현재 채팅방 목록</caption>
		      <tbody>
		        <tr>
		          <td><strong>방 제목</strong></td>
		          <td><strong>인원수</strong></td>
		        </tr>
		      	<tr>
		      		<td><a>안 알려줌</a></td>
		      		<td>1/2</td>
		      	</tr>
		      	<tr>
		      		<td><a>안 알려줌</a></td>
		      		<td>3/5</td>
		      	</tr>
		      </tbody>
		    </table>
		</div>
		알림창 설명
		<div id="notice-set" class="icon_set">
			<table class="table">
		      <thead>
		        <tr>
		          <th>~~~님이 #ㅋㅋ로 방을 개설 했습니다</th>
		        </tr>
		        <tr>
		          <th>~~~님이 ○○○방에 참여하였습니다.</th>
		        </tr>
		        <tr>
		          <th>앙 기모딱따구리 ~</th>
		        </tr>
		      </thead>
		    </table>
		</div>
		회원정보창 설명
		<div id="member-set" class="icon_set">
			<button class="btn btn-warning">
				로그 아웃
			</button><br/>
			<button class="btn btn-warning">
				사용자 정보 변경
			</button><br/>
			<button class="btn btn-warning">
				알림 설정
			</button><br/>
			<button class="btn btn-warning">
				친구 목록
			</button><br/>
		</div>
		
	 	방개설
	 	<div id="popup1">
	       <div id="popmenu1">
	       		<h1 style="color:black"> 방 개설</h1>
	           	<form id="room_set">
					<input type="text" class="btn" placeholder="방제목"><br/>
					<select class="btn">
						<option >카테고리 설정</option>
						<option>안알랴줌2</option>
						<option>안알랴줌3</option>
					</select><br/>
					<input type="text" class="btn" placeholder="#해쉬태그">
					<select class="btn">
						<option>구매 방식</option>
						<option>오프라인</option>
						<option>배달</option>
						<option>국내배송</option>
						<option>해외배송</option>
					</select><br/>
					<select class="btn">
						<option>거래 방식</option>
						<option>계좌이체</option>
						<option>안전거래</option>
						<option>협의</option>
					</select><br/>
				</form>
	           <button class="btn exit1">닫기</button>
	           <button class="btn room-set">개설</button>
	       </div>
	   </div>
   
		 왼쪽 화살표
		<div id="left_set" style="width:80%;height:100%;">
			<div id="address_set">
				<select class="btn">
					<option>주소 설정</option>
					<option>안알랴줌2</option>
					<option>안알랴줌3</option>
				</select>
				<br/>
				<select class="btn">
					<option>카테고리 설정</option>
					<option>안알랴줌2</option>
					<option>안알랴줌3</option>
				</select>
			</div>
			<div class="btn_set" style="padding-top:20%;">
				<button class="btn btn-info" style="float:left;">
					적용
				</button>
				<button class="btn btn-info" style="float:right;margin-right:''">
					전체
				</button>
			</div>
		</div>
		
		 오른쪽 화살표 설명
		<div id="bottom_set" style="width:100%;height:80%;top:10%;position:absolute; ">
		 
			<table class="table">
		      <thead>
		        <tr>
		          <th>#</th>
		          <th>제목</th>
		          <th>방 인원</th>
		          <th>거래방법</th>
		          <th>알림 설정</th>
		        </tr>
		      </thead>
		      <tbody>
		        <tr>
		          <th scope="row">1</th>
		          <td>하이룽</td>
		          <td>1/3</td>
		          <td>안전거래</td>
		          <td><i class="far fa-bell"></i></td>
		        </tr>
		        <tr>
		          <th scope="row">2</th>
		          <td>방가방가</td>
		          <td>2/6</td>
		          <td>직거래</td>
		          <td><i class="far fa-bell"></i></td>
		        </tr>
		        <tr>
		          <th scope="row">3</th>
		          <td>유니클로 공동구매</td>
		          <td>4/5</td>
		          <td>카카오페이</td>
		          <td><i class="far fa-bell"></i></td>
		        </tr>
		        <tr>
		          <th scope="row">4</th>
		          <td>심심해욤</td>
		          <td>1/2</td>
		          <td>직거래</td>
		          <td><i class="far fa-bell"></i></td>
		        </tr>
		        <tr>
		          <th scope="row">5</th>
		          <td>여친구함</td>
		          <td>1/2</td>
		          <td>직거래</td>
		          <td><i class="far fa-bell"></i></td>
		        </tr>
		    </table>
		</div>
		<div id="icon-box">
			-- 맵 넣는곳
			<div id="map" style="left:30%;top:0px;position:absolute;">
				사진 넣으세요
			</div> 
			 왼쪽 화살표
			<div style="left:0px;top:50%;position:absolute;">
				<a id="left" href="#"  style="color:#2E2E2E;"><i class="fas fa-arrow-right"></i></a>
			</div>
			 아래 화살표
			<div style="bottom:0px;left:50%;position:absolute;margin-bottom:-13px;"  >
				<a id="bottom" href="#" style="color:#2E2E2E;"><i class="fas fa-arrow-up"></i></a>
			</div>
		</div>
	</div>
</div>
 -->

<!-- 버튼 동작 -->
