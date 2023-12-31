<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/stylemain.css" type="text/css">
</head>
<body>
	
	<div id="wrap" class="border">
		<section class="d-flex">
			<div class="main mt-4">
				<img width="100%" alt="메인" src="/static/image/main.jpg">
			</div>
			
			<div class="content">
				<div class="head d-flex justify-content-center align-items-center">
					<h2 class="d-flex mt-3 mr-3"><b>멍냥멍냥</b></h2>
					<img height="50" src="https://cdn-icons-png.flaticon.com/128/4711/4711003.png">
				</div>
				
				<div class="login-box">
					<h2 class="justify-content-center text-center my-5 text-secondary">Login</h2>
									
					<form class="my-5" id="loginForm">
						<input type="text" placeholder="아이디" class="form-control" id="loginIdInput">
						<input type="password" placeholder="비밀번호" class="form-control mt-4" id="passwordInput">
						<p class="text-right mt-2 mr-3"><a href="/user/password-view">비밀번호 찾기</a></p>
						<p class="text-center mt-4">회원이 아니신가요? <a href="/user/join-view">회원가입</a></p>
						<p class="text-center mt-4">방문예약만 원하시나요? <a href="/visit/visit">방문예약</a></p>
						<button type="submit" class="btn btn-primary btn-block mt-4" id="loginBtn">로그인</button>					
					</form>
				</div>
				<footer class="d-flex justify-content-center align-items-center">
					<div class="text-secondary"><p>Copyright © mungnyang 2023</p></div>
				</footer>
			</div>
		</section>
	</div>



	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<script>
		$(document).ready(function() {
			
			$("#loginForm").on("submit", function(e) {
				
				e.preventDefault();
				
				let loginId = $("#loginIdInput").val();
				let password = $("#passwordInput").val();
						
				if(loginId == ""){
					alert("아이디를 입력해주세요");
					return ;
				}
				
				if(password == ""){
					alert("비밀번호를 입력해주세요");
					return ;
				}
				
				$.ajax({
					type:"post"
					, url:"/user/login"
					, data:{"loginId":loginId, "password":password}
					, success:function(data){
						
						if(data.result == "success"){
							
							location.href="/user/main";
						}else {
							alert("아이디 및 비밀번호를 확인하세요");
						}
						
					}
					, error:function(){
						alert("로그인 에러")
					}
					
					
					
				});
								
				
			});	
			
			
		});
	</script>
	
	
</body>
</html>