<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="row find-pharm-title">
	 <h3 class="ui-title px-0">로그인</h3>
	 <!-- <p class="px-0"></p> -->
</div>
<div class="row justify-content-md-center">
	<div class="col-md-auto col-md-5 px-0 py-5">
		<form id="signinForm" method="POST">
			<div class="mb-3 ipt">
			  <label for="idFormControlInput" class="form-label">아이디</label>
			  <input type="text" class="form-control" id="idFormControlInput" name="username" placeholder="아이디를 입력하세요." value="test" />
			</div>
			<div class="mb-3 ipt">
			  <label for="passwordFormControlInput" class="form-label">비밀번호 <i class="bi bi-check-circle"></i></label>
			  <input type="password" class="form-control" id="passwordFormControlInput" name="password" placeholder="비밀번호를 입력하세요." value="1q2w3e4r!" />
			</div>
			
			<input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }">
		</form>
		<div class="input-group justify-content-center mt-5">
			<button class="btn point signin">로그인</button>
			<button class="btn point2 signup">회원가입</button>
		</div>
	</div>
</div>

<script>
	$(function(){
		let isLogin = `${param.status}`;
		
		if(isLogin == "fail") {
			$(".alertModal-content").html("로그인이 실패되었습니다.");
			$("#alertModal").modal("show");
		}
		$(".signin").on("click", function(){
			$("#signinForm").attr("action", "/login")
						.submit();
		})
		$(".signup").on("click", function(){
			location.href = "/auth/signup";
		})
	})
	
</script>