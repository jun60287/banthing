<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>    
	#bottom-box{
		display:none;
	}
	@media (max-width: 768px) {
		#bottom-box{
			display:block;
		}
		.col-xs-4 a{
			color:#2E2E2E;
		}
	}
</style>
    
      <div class="container-fluid">
        <div class="navbar-header">
          <div class="rows" style="padding-top:15px;">
          	<div id="bottom-box">
	            <div class="col-xs-4" >
	              	<a href="#" id="member"><i class="fas fa-user fa-4x"></i></a>
	            </div>
	            <div class="col-xs-4 addroom">
	              	<a href="#" id="addroom1"><i class="fas fa-plus fa-4x"></i></a>
	            </div>
	            <div class="col-xs-4">
	            	<a href="#" id="notice"><i class="fas fa-bell fa-4x"></i></a>
	            </div>
            </div>
          </div>
        </div>
      </div><!--/.container-fluid -->
      <script>
      	function site(){
      		window.open("addroom.1","a", "width=400, height=300, left=100, top=200,location=0,menubar=0,toolbar=0");
      	}
      </script>
