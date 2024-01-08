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
			<form id="postForm" action="/notice/write" method="post">
				<div class="ui-board-detail">
					<div class="ui-board-detail-head">
						<h3 class="pb-0"><input type="text" name="title" placeholder="글제목을 입력하세요." style="width:100%"/></h3>
						<div class="detail-row">
							<strong class="writer">${pinfo.username }</strong>
							<input type="hidden" name="writer" value="${pinfo.username }" />
						</div>
					</div>
					<div class="ui-board-detail-content">
						<textarea rows="10" cols="" style="width: 100%" name="content" placeholder="글 내용을 입력하세요.">${dto.content }</textarea>
					</div>
				</div>
				<input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }">
			</form>
			<div class="ui-board-bottom right pt-3">
				<button type="button" class="btn default back">뒤로가기</button>
				<button type="button" class="btn default list">목록</button>
				<button type="button" class="btn point post">글작성</button>
			</div>
			
		</div>
	</div>
</div>

<script>
	$(function(){
		let writed = `${writed}`;
		if( writed == "false") {
			$(".alertModal-content").text("게시글 작성이 실패되었습니다.")
			$("#alertModal").modal("show");	
		}
		
		let $postForm = $("#postForm");
		
		// 뒤로가기 
		$(".notice .ui-board-bottom > .back").on("click", function(){
			history.back();
		})
		// 목록 
		$(".notice .ui-board-bottom > .list").on("click", function(){
			location.href = `/notice/list`;
		});
		// 글쓰기
		$(".notice .ui-board-bottom > .post").on("click", function(){
			$postForm.submit();
		});
	})
</script>