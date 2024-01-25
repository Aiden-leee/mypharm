<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<sec:authentication property="principal" var="pinfo" />

<div class="row find-pharm-title">
	 <h3 class="ui-title px-0">건강기능식품</h3>
	 <!-- <p class="px-0"></p> -->
</div>
<div class="row">
	<div class="col px-0 pb-5">
		<div class="ui-board notice">
			<div class="ui-board-top">
				<span>Total: <strong>${total }</strong></span>
			</div>
			<div class="healthfood">
				<div class="row row-cols-1 row-cols-md-4 g-4">
					<c:forEach items="${list }" var="item">
				  		<div class="col">
				  	
						    <div class="card h-100" data-item="${item.pno }">
					      	  <img src="/resources/assets/images/${item.img_name }" class="card-img-top" alt="...">
						      <div class="card-body">
						        <h5 class="card-title">${item.pname }</h5>
						        <p class="card-text">${item.subtitle }</p>
						        <div class="price-box txt-right">
							        <span class="price"><fmt:formatNumber value="${item.price }" type="number" />원</span>
						        </div>
						      </div>
						    </div>
						  </div>		
				  	</c:forEach>
				</div>
			</div>
			
			<form id="noticeListForm" action="/notice/detail" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.criteria.pageNum }"/>
				<input type="hidden" name="amount" value="${pageMaker.criteria.amount }" />
			</form>
			<!-- pagination -->
			<div class="pagination-wrap pt-5 pb-3">
				<nav aria-label="Page navigation">
				  <ul class="pagination">
				   <%--  <li class="page-item">
				      <a class="page-link ${pageMaker.prev ? '' : 'disabled' }" href="${pageMaker.startPage -1 }" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
					    <li class="page-item">
					    	<a class="page-link ${pageMaker.criteria.pageNum == num ? 'active' : '' }" href="${num }">${num }</a>
					    </li>
				    
				    </c:forEach>
				    <li class="page-item">
				      <a class="page-link ${pageMaker.next ? '' : 'disabled' }" href="${pageMaker.endPage + 1 }" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li> --%>
				  </ul>
				</nav>
			</div>
			
		</div>
	</div>
</div>

<script>
	$(function(){
		$(".healthfood .card").on("click", function(){
			let item = $(this).data("item");
			location.href = "/health/detail/" + item;
		})
		
	})
</script>