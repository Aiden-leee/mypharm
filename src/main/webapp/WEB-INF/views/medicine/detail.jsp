<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<script src="/resources/assets/js/noticeReply.js"></script>

<sec:authentication property="principal" var="pinfo" />

<div class="row find-pharm-title">
	 <h3 class="ui-title px-0">의약품 검색</h3>
	 <!-- <p class="px-0"></p> -->
</div>
<div class="row">
	<div class="col px-0 pb-5">
		<div class="medicine-detail">
			<div class="medicine-detail-info">
				<div class="medicine-img my-5">
					<img src="${dto.img }" />
				</div>
				<div class="medicine-detail-content">
					
					<div class="card">
					  <div class="card-header">
					   <h5 class="m-0"><span>${dto.name }</span></h5>
					  </div>
					  <div class="card-body">
						    <ul>
								<li><strong>영문명</strong> <span>${dto.ename == null ? "-" : dto.ename }</span></li>
								<li><strong>분류</strong> <span>[${dto.cate_no}] ${dto.cate_name }</span></li>
								<li><strong>구분</strong> <span>${dto.otc_name }</span></li>
								<li><strong>제형</strong> <span>${dto.formul }</span></li>
								<li><strong>성상</strong> <span>${dto.chart }</span></li>
								<li><strong>모양</strong> <span>${dto.shape }</span></li>
								<li><strong>색상</strong> <span>(앞) ${dto.color1 }, (뒤) ${dto.color2 == 'null' ? "-" : dto.color2 }</span></li>
								<li><strong>업체명</strong> <span>${dto.company }</span></li>
							</ul>
					  </div>
					</div>
				</div>
				<div class="medicine-detail-bottom txt-right py-3">
					<button class="btn point2 back">뒤로가기</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$(function(){
		$(".back").on("click", function(){
			history.back();
		})
	})
		
	
</script>