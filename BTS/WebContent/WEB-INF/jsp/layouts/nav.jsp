<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
@media (min-width: 768px) {

	.top-box2{
		display:inline-block;
		text-align: center;
	}
	.catergory-set ul{
		padding-left: 0px;
	}
	.catergory-set li{
		list-style:none;
	}
	a{
		text-decoration:none;
		color:white;
	}
	a:hover{
		text-decoration:none;
		color:red;
	}
	
	.top-box{
		display: none;
	}
}
@media (max-width: 768px) {
	.top-box2{
		display:none;
	}
	.top-box{
		display: block;
	}
	.rows{
		margin-top:10px;
		text-align:center;
	}
	#myroom-setting{
		padding-top:10px; 
	}
	#myroom-setting a{
		color:#2E2E2E;
	}
	
	
}
</style>   

      <div class="container-fluid">
        <div class="navbar-header">
        
        <!-- 768 이상 -->
        <div class="top-box2">
        	<div class="name-set">
	        	<h1><strong><a href="index.2">반띵</a></strong></h1>
	        	<h2><strong><a href="index.2">(로고)</a></strong></h2>
	        	<hr>
        	</div>
        	<div class="catergory-set">
        		<ul>
        			<li><h2><a href="notice.2">공지 사항</a></h2></li>
        			<!-- <li><h2><a id="addroom2" href="#" >채팅방개설</a></h2></li>
        			<li><h2><a href="#">채팅 목록</a></h2></li> -->
        			<li><h2><a href="alram.2">알림 정보</a></h2></li>
        			<li><h2><a href="member.2">회원 정보</a></h2></li>
        		</ul>
        	</div>
        </div>
        <!-- 768이하 -->
          <div class="rows top-box">
            <div class="col-xs-4">
            	<h1><strong>(로고)</strong></h1>
            </div>
            <div class="col-xs-4">
              	<h1><strong>반띵</strong></h1>
            </div>
            <div id="myroom-setting" class="col-xs-4">
            	<a href="#" id="myroom"><i class="fas fa-sms fa-4x"></i></a>
            </div>
          </div>
          
        </div>
      </div><!--/.container-fluid -->
      
