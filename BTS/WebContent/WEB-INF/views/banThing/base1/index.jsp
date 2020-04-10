<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
 	.name{
		text-align:center;
		padding-top:15%;
	}
	.name>.bts{
		font-size:5em;
	}
	.catergory{
		 padding-top:15%;
		 text-align:center;

	}
	.catergory button{
		 font-size:2em;
		 width:30%;
		 margin:20px;
	}
	
@media (min-width: 768px) {
    #index{
    	margin-left:-35%;
    } 
}
@media (max-width: 768px) {
}
</style>  
    
<div id="index">
	<div class="name">
		<h1 class="bts">반띵</h1>
		<h1>(로고)</h1>
	</div>
	<div class="catergory">
		<button onclick="window.location.href='login.1'"
		class="btn btn-primary">
			로그인
		</button>
		<button onclick="window.location.href='index.2'"
		 class="btn btn-primary">
			비회원
		</button>
	</div>
</div>