<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<header>
   	<div class="container">
	   <nav class="navbar navbar-expand-lg bg-body-tertiary">
		  <div class="container-fluid p-0">
		    <h1 class="main-logo">
		    		<a class="navbar-brand" data-page="pharm" href="/">마이팜</a>
		    	</h1>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        <li class="nav-item">
		          <a class="nav-link" data-page="pharm" href="/" >약국검색</a>
		        </li>
		        <li class="nav-item" >
		          <a class="nav-link" data-page="medicine" href="#">의약품검색</a>
		        </li>
		        <li class="nav-item dropdown" >
		          <a class="nav-link dropdown-toggle" data-group="community" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		            커뮤니티
		          </a>
		          <ul class="dropdown-menu">
		            <li><a class="dropdown-item nav-link" href="/notice/list" data-page="notice" data-group="community">공지사항</a></li>
		            <li><a class="dropdown-item nav-link" href="/freeboard/list" data-page="freeboard" data-group="community">자유게시판</a></li>
		            <li><a class="dropdown-item nav-link" href="/qna/wrtie" data-page="qna"  data-group="community">Q&A</a></li>
		          </ul>
		        </li>
		      </ul>
		      <form class="d-flex" role="search" id="actionMedicine">
		        <input class="form-control me-2" type="search" name="pharm" placeholder="의약품 검색" aria-label="Search">
		        <button class="btn btn-outline-success" type="button">Search</button>
		      </form>
		    </div>
		  </div>
		</nav>
	</div>
	
</header>
	    
<script>
	$(function(){
		let url = location.pathname.split("/");
		let path = url[1];
		console.log(path);
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

	});
</script>