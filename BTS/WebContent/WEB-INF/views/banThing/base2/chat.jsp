<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>  
<link rel="stylesheet" href="<c:url value="/resources/css/base2/chat.css"/>">
<div class="main1">
	<h2>방 제목:${vo.title}</h2>
	<div class="chatBox">
		
		<div id="chatLog" style="overflow:scroll;" class="chatLog">
		</div>
		<div id="chatSub">
			<input id="name" class="name" value="${sessionNick}" type="text" readonly>
			<input id="message" onkeydown="Enter_Check()" class="message" type="text" autocomplete="off" required="required">
			<button class="chat-button bg-light round-input" onclick="chat_submit()">전송</button>
			<button class="chat-button" onclick="chat_exit()">나가기</button>
		</div>
		<div id="chatInfo">
		</div>
		<!-- 거래 기능들 -->
		<div class="chatfunction">
			<c:if test="${vo.id==sessionId}">
				<div class="dealSetting">
				</div><br/>
				<button class="btn">방 설정</button>
			</c:if>
			<div id="dealState">
				하이룽~
				<input type="hidden" id="dealStateNum">
			</div>
		</div>
		<div class="chatDealStart">
		미 진행 중...
		</div>
	</div>
</div>

<script>
	
	function dealStart(){
		var dealStart=open("dealStart.1?num=${vo.num}", "거래시작" , "toolbar=no,location=no,status=no, menubar=no, scrollbars=no, resizalbe=no, width=600px, height=750px,left=400px,top=200px");
		//거래시작시 중단버튼과 완료버튼 나옴
	}
	function dealStop(){
		//거래 중단시 거래시작 버튼 나옴
		var sample='<button class="btn" id="dealStart" onclick="dealStart()">거래 시작</button><br/>';
		$(".dealSetting").html(sample);
	}
	
	function chat_exit(){
		if("${vo.nick}"=="${sessionNick}"){
			var check=confirm("너가 나가면 방폭파되는게 괜찮 방구?");
			if(check){
				window.location.href="chatBoom?num=${vo.num}";
			}else{
				return false;
			}
		}else{
			window.location.href="chatExit?nick=${sessionNick}&num=${vo.num}&id=${sessionId}";
		}
	}
	
	function chat_submit(){
		$.ajax({
			url:"chatSave",
	        type: 'get',
	        data: { num:"${vo.num}",nick:"${sessionNick}",mes:$("#message").val()},
	        dataType:'json', 
	        contentType:"application/json;charset=UTF-8",
			success:function(data){
				chat_Info();
	 		}
		});
		$("#message").val("");
		$("#chatLog").scrollTop($("#chatLog")[0].scrollHeight);
	}
	
	$(document).ready(function(){
		setInterval(chat_Info, 300);
		$("#chatLog").scrollTop($("#chatLog")[0].scrollHeight);
	})
	
	function Enter_Check(){
    if(event.keyCode == 13){
      chat_submit();
      $('#message').val("");
    }
	}
	function chat_Info(){
		$.ajax({
			url:"logInfo",
	        type: 'get',
	        data: { num:"${vo.num}",id:"${sessionId}",nick:"${sessionNick}"},
	        dataType:'json',
	        contentType:"application/json;charset=UTF-8",
			success:function(data){
				let chatLog="<p>공+지 : BTS 채팅방에 오신 걸 환영합니다 !</p>";
				var chatInfo="${vo.users}".split(",");
				var usersInfo="";
				data['log'].forEach(function(i){
					if(i.id=="${sessionId}"){
						chatLog +="<p class='myMessage'>"+i.id+":"+i.mes+"</p>";
					}else if(i.id=="운영자"){
						chatLog +="<p style='color:red;'>"+i.id+":"+i.mes+"</p>";
					}else{
						chatLog +="<p>"+i.id+":"+i.mes+"</p>";
					}						
				})
				
				chatInfo.forEach(function(i){
					if(i=="${vo.nick}"){
						usersInfo +="<h4>"+i+"(방장)";
					}else{
						usersInfo +="<h4>"+i;
					}
				
					if(i=="${sessionNick}"){
						usersInfo+="(나)</h4> "
					}
					else{
						usersInfo+="</h4>";
					}
				})
				//거래 시작시 나오는 페이지

					dealState();
					$("#chatLog").html(chatLog);
					$("#chatInfo").html(usersInfo);
	 		}
		});
	}
	function dealState(){
		$.ajax({
			url:"dealinfo",
	        type: 'get',
	        data: { num:"${vo.num}"},
	        dataType:'json',
	        contentType:"application/json;charset=UTF-8",
			success:function(data){
				var vo=data['vo'];
				var users=vo['users'].split(',');
				var dealstate=vo['dealState'];
				var agree="";
				var count=0;
				if(dealstate=="거래 중"){
					var deal="<p style='color:red'>운영자:거래 시작하기 앞서 동의여부를 묻도록 하겠습니다.</p>";
					deal+="<p style='color:red'>운영자:아래 상세페이지를 읽어주시고 동의/거절 버튼을 눌러주세요.</p>";
					deal+="<p style='color:red'>운영자:<a href='#' onclick='dealDetail()'>거래 상세페이지</a> </p>";
					users.forEach(function(i,index){
						if(i.includes(1)){
							count++;
							agree+="<p>"+i.split('1')[0]+"님 동의보감</p>";
						}
						if(count==users.length-1){
							agree="<p>거래 스타뚜!!!!!!!!~</p>";
							deal="<p style='color:red'>운영자:모든 사람이 동의를 허가하였습니다.</p>";
							deal+="<p style='color:red'>운영자:이제부터 거래 취소 또는 부정행동을 할 시 형사처벌 받을 수도 있다잉</p>";
							deal+="<p style='color:red'>운영자:<a href='#' onclick='dealDetail("+"1"+")'>거래 상세페이지</a> </p>";
						}
					})
					//var dealStart=open("dealStart.1?num=${vo.num}", "거래시작" , "toolbar=no,location=no,status=no, menubar=no, scrollbars=no, resizalbe=no, width=600px, height=750px,left=400px,top=200px");
					//거래시작시 중단버튼과 완료버튼 나옴
					var sample='<button class="btn" id="dealStop" onclick="dealStop()">결제 하기</button><br/><br/>';
					sample+='<button class="btn" id="dealSuccess" onclick="dealSuccess()">거래 완료</button><br/>';
					
			 		$(".dealSetting").html(sample);
					$(".chatDealStart").html(deal);
					$("#dealState").html(agree);
				}else{
					var sample='<button class="btn" id="dealStart" onclick="dealStart()">거래 시작</button><br/>';
					$(".dealSetting").html(sample);
				}
	 		}
		});
	}
	function dealDetail(state){
		if(state==undefined){
			state=0;
		}
		open("dealDetail.1?num=${vo.num}&state="+state, "거래시작" , "toolbar=no,location=no,status=no, menubar=no, scrollbars=no, resizalbe=no, width=600px, height=750px,left=400px,top=200px");
	}
</script>

