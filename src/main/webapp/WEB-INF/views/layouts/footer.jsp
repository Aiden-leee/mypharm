<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<footer>
	<div class="container-fluid p-0">
		<div class="container p-0 py-5">
			<div class="row">
				<div class="col-sm-2">
					<img src="/resources/assets/images/f-logo.png" alt="마이팜" style="width:100px"/>
				</div>
				<div class="col-sm-10">
					<p class="m-0"><strong>약국 데이터 출처:</strong> 국립중앙의료원 &nbsp;&nbsp;<strong>의약품 데이터 출처:</strong> 식품의약품안전처</p>
					<p class="m-0"><strong>사이트 제작:</strong> 이동현  &nbsp;&nbsp;<strong>이메일:</strong> wlvmf3409@naver.com</p>
					<address class="m-0"><strong>주소:</strong> 인천광역시 미추홀구 용현동</address>
					<p class="copyright">Copyright <em>© 마이팜</em> All Rights Reserved.</p>
				</div>
			</div>
		</div>
	</div>
</footer>
<script>
	$(function(){
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		//CSRF 토큰 전송
		$(document).ajaxSend(function(e, xhr, options) {
		  xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		})
	})
</script>