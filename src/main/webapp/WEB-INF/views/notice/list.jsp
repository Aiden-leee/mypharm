<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<sec:authentication property="principal" var="pinfo" />

<div class="row find-pharm-title">
	 <h3 class="ui-title px-0">공지사항</h3>
	 <!-- <p class="px-0"></p> -->
</div>
<div class="row">
	<div class="col px-0 pb-5">
		<div class="ui-board notice">
			<div class="ui-board-top">
				<span>Total: <strong>${pageMaker.total}</strong></span>
			</div>
			<table style="width: 100%">
				<colgroup>
					<col width="100px" />
					<col />
					<col width="120px"/>
					<col width="120px"/>
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:choose >
						<c:when test="${ empty list }">
							<tr>
								<td colspan="4" style="padding: 60px 0;">공지사항 글이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list }" var="item">
								<tr>
									<td>${item.seq }</td>
									<td class="text-title"><span><a href="${item.seq}" class="seq_no">${item.title }</a></span></td>
									<td>${item.writer }</td>
									<td><fmt:formatDate value="${item.regdate }" pattern="yyyy.MM.dd"/></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					
				</tbody>
			</table>
			
			<div class="ui-board-bottom right pt-3">
				<sec:authorize access="isAuthenticated()" >
				  <c:if test="${pinfo.username eq 'admin'}">
					<button type="button" class="btn point write">글쓰기</button>
				  </c:if>
				</sec:authorize>
			</div>
			
			<form id="noticeListForm" action="/notice/detail" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.criteria.pageNum }"/>
				<input type="hidden" name="amount" value="${pageMaker.criteria.amount }" />
			</form>
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
			
		</div>
	</div>
</div>

<script>
	$(function(){
		let $noticeListForm = $("#noticeListForm");
		let $pageNum = $(":input:hidden[name=pageNum]");
		let $amount = $(":input:hidden[name=amount]");
		
		let deleted = `${deleted}`;
		let wrtied = `${writed}`;
		if( wrtied == "true" ) {
			$(".alertModal-content").text("게시글이 등록되었습니다.");
			$("#alertModal").modal("show");
		}
		if( deleted == "true" ) {
			$(".alertModal-content").text("게시글이 삭제되었습니다.");
			$("#alertModal").modal("show");
		}
		
		// 게시글 상세보기 
		$(".notice .seq_no").on("click", function(e){
			e.preventDefault();
			let seq = $(this).attr("href");
			let link = `/notice/detail/\${seq}`;
			location.href = link;
		});
		
		// 페이지 이동
		$(".notice .pagination .page-link").on("click", function(e){
			e.preventDefault();
			let num = $(this).attr("href");
			$pageNum.val(num);
			$noticeListForm.attr("action", "/notice/list").submit();
		})
		
		// 글작성
		$(".btn.write").on("click", function(e){
			location.href = "/notice/write";
		})
		
	})
</script>