<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<header>
   	<div class="container p-0">
	   <nav class="navbar navbar-expand-lg bg-body-tertiary">
		  <div class="container-fluid p-0">
		    <h1 class="main-logo">
		    		<a class="navbar-brand" data-page="pharm" href="/"><img src="/resources/assets/images/mypharm-logo.png" alt="마이팜" /></a>
		    	</h1>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        <li class="nav-item">
		          <a class="nav-link" data-page="pharm" href="/" >약국찾기</a>
		        </li>
		        <li class="nav-item" >
		          <a class="nav-link" data-page="medicine" href="/medicine/list">의약품검색</a>
		        </li>
		        <li class="nav-item dropdown" >
		          <a class="nav-link dropdown-toggle" data-group="community" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		            커뮤니티
		          </a>
		          <ul class="dropdown-menu">
		            <li><a class="dropdown-item nav-link" href="/notice/list" data-page="notice" data-group="community">공지사항</a></li>
		            <!-- <li><a class="dropdown-item nav-link" href="/freeboard/list" data-page="freeboard" data-group="community">자유게시판</a></li>
		            <li><a class="dropdown-item nav-link" href="/qna/wrtie" data-page="qna"  data-group="community">Q&A</a></li> -->
		          </ul>
		        </li>
		      </ul>
		     <div class="d-flex login-box">
		     	<sec:authorize access="isAnonymous()">
			     	<span class="me-2"><a href="/auth/signin">로그인</a></span>
			     	<span><a href="/auth/signup">회원가입</a></span>
		     	</sec:authorize>
		     	<sec:authorize access="isAuthenticated()">
		     		<form action="/auth/logout" method="post" id="logoutForm">
			     		<span class="me-2">[<sec:authentication property="principal.username"/>] 님</span>
			     		<span><a href="#" style="color:#333" class="logout">로그아웃</a></span>
			     		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		     		</form>
		     	</sec:authorize>
		     </div>
		      <!-- <form class="d-flex" role="search" id="actionMedicine">
		        <input class="form-control me-2" type="search" name="pharm" placeholder="의약품 검색" aria-label="Search">
		        <button class="btn btn-outline-success" type="button">Search</button>
		      </form> -->
		    </div>
		  </div>
		</nav>
	</div>
	
</header>
	    
<script>
	$(function(){
		let url = location.pathname.split("/");
		let path = url[1];
		$(".navbar-nav .nav-link").removeClass("active");
		$(".navbar-nav .nav-link").each(function(idx, el) {
			page = $(this).data("page");
			if( page == cpage ) {
				$(this).addClass("active");
				if( $(this).hasClass("dropdown-item") ) {
					let group = $(this).data("group");
					$(`.dropdown-toggle[data-group="\${group}"]`).addClass("active");
				}
			}
		});
		$(".logout").on("click", function(){
			$("#logoutForm").submit();
		})
	});
</script>