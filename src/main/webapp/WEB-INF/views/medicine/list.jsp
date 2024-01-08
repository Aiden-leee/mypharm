<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<sec:authentication property="principal" var="pinfo" />

<div class="row find-pharm-title">
	 <h3 class="ui-title px-0">의약품 검색</h3>
	 <!-- <p class="px-0">식품의약품안전처 데이터 활용</p> -->
</div>
<div class="row">
	<div class="col px-0 pb-5">
		<div class="medicine">
			<div class="search-container">
				<div class="input-group my-3 search-ipt">
				  <input type="text" class="form-control" name="mkeyword" value="${param.keyword }" placeholder="의약품 검색" aria-label="" aria-describedby="button-addon2">
				  <button class="btn btn-outline-secondary" type="button" id="medicine-search">검색</button>
				</div>
			</div>
			<div class="ui-board-top">
				<span>Total: <strong>${pageMaker.total}</strong></span>
			</div>
			<div class="medicine-container">
				<div class="row row-cols-1 row-cols-md-5 g-4">
					<c:forEach items="${list }" var="item">
						<div class="col">
							<div class="card h-100">
							  <a href="${item.no }" class="m_no">
							  	<img src="${item.img }" class="card-img-top" alt="...">
							  </a>
							  <div class="card-body" style="display: flex; flex-direction: column;">
							    <h5 class="card-title medicine-name">${ item.name }</h5>
							    <span class="subinfo">-</span>
							    <span>${item.cate_name }</span>
							    <span class="otc">${item.otc_name }</span>
							    <p class="card-text">${item.company }</p>
							  </div>
							</div>
						
						</div>
					</c:forEach>
				</div>
			</div>
			
			<!-- pagination -->
			<div class="pagination-wrap pt-5 pb-3">
				<nav aria-label="Page navigation">
				  <ul class="pagination">
				    <li class="page-item">
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
				    </li>
				  </ul>
				</nav>
			</div>
			<form id="medicineListForm" action="/medicine/list" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.criteria.pageNum }"/>
				<input type="hidden" name="amount" value="${pageMaker.criteria.amount }" />
				<input type="hidden" name="keyword" value="${pageMaker.criteria.keyword }"/>
			</form>
		</div>
	</div>
</div>

<script>
	$(function(){
		let $pageNum = $(":input:hidden[name=pageNum]");
		let $amount = $(":input:hidden[name=amount]");
		
		$(".medicine-name").each(function(idx, el){
			let mediname = $(this).text();
			let sub = "";
			let idx1 = mediname.indexOf("(");
			let idx2 = mediname.lastIndexOf(")");
			if( idx1 > 0 && idx2 > 0 ) {
				$(this).text( mediname.substr(0,idx1) );
				sub = mediname.slice(idx1,idx2+1);
				$(this).siblings(".subinfo").text(sub);
				mediname = $(this).text();
			}
			$(this).text( mediname.replace("밀리그램", "mg") );
		})
		
		// 상세보기 
		$(".medicine .m_no").on("click", function(e){
			e.preventDefault();
			let no = $(this).attr("href");
			let link = `/medicine/\${no}`;
			location.href = link;
		});
		
		// 페이지 이동
		$(".medicine .pagination .page-link").on("click", function(e){
			e.preventDefault();
			let num = $(this).attr("href");
			$pageNum.val(num);
			$("#medicineListForm").attr("action", "/medicine/list").submit();
		})
		
		// 검색 
		$(":text[name='mkeyword']").on("keyup", function(e){
			if( e.keyCode == 13 ) {
				medicineSearch();
			}
		})
		
		$("#medicine-search").on("click", function(){
			medicineSearch();
		})
		
		function medicineSearch() {
			let keyword = $(":text[name='mkeyword']").val();
			if( keyword == "" ) { 
				location.href = "/medicine/list";
				return;
			}
			$(":hidden[name='pageNum']").val(1);
			$(":hidden[name='keyword']").val(keyword);
			$("#medicineListForm").submit();
		}
		
	})
</script>