<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<footer>
	<div class="container-fluid p-0">
		<div class="container p-0 py-5">footer</div>
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