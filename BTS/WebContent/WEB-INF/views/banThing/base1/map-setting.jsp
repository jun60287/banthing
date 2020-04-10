<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
		.map-name{
			text-align:center;
			/* margin-top:-8%; */
		}
		.map-name h1{
			font-size: 72px;
		}
		.map-setting{
			/* padding-top:7%; */
			text-align:center;
		}
		.map-setting button{
			width:30%;
			margin:20px; 
			font-size:20px;
			height:60px;  
		}
		.map-setting select{
			width:60%; 
			font-size:25px;
			height:60px; 
		}
		#address{
			font-size:20px;
		}
		.btn-setting{
			 text-align:center;
			 padding-top:10%;
		}
		.btn-setting button{
			width:200px;
			font-size:40px;
			margin:30px;
		}
@media (min-width: 768px) {
  	#index{
   		margin-left:-35%;
  	} 
}
@media (max-width: 768px) {
	.-setting button{
		width:100px;
		font-size:25px;
		margin:30px;
	}
}
	
</style>    
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a44d7ff9bef3120be5c58e8aa20ddfe0&libraries=services,clusterer,drawing"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	var res="";
	function address_setting(){
	    new daum.Postcode({
	        oncomplete: function(data) {
	            $("#address").text(data["address"]);
	            console.log(data);
	            var Geocoder = new kakao.maps.services.Geocoder();
	        	Geocoder.addressSearch(data.address,function(result, status){
	        		 if (status === kakao.maps.services.Status.OK) {
	        				console.log(result);
	        				console.table(result);
	        		        console.log(result[0].y);
	        		        console.log(result[0].x);
	        		        res = result;
	        		        return res;
	        		 }
	        	});
	        }
	    }).open()
	}
	
	function tossvl(){
		var val = $("#address1 option:selected").val();
		console.log(val);
		window.location.href="index.2?val="+val;
	}
	

</script>
<div id="index">
	<div class="map-name">
		<h1>맵 필터 <br/>설정</h1>
	</div>
	<div class="map-setting">
		<div>
		<br/><br/><br/>
		<select id="address1">
			<option value="1">서울</option>
			<option value="2">부산</option>
			<option value="3">광주</option>
			<option value="4">울산</option>
			<option value="5">인천</option>
		</select>
		</div>
		<br/>
		<select class="btn">
			<option>카테고리 설정</option>
			<option>안알랴줌2</option>
			<option>안알랴줌3</option>
		</select>
	</div>
	<div class="btn-setting">
		<button onclick="tossvl()" class="btn btn-info">
			적용
		</button>
		<button onclick="window.location.href='index.2'" class="btn btn-info">
			전체
		</button>
	</div>
</div>