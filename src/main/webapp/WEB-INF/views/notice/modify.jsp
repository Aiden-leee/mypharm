<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="row find-pharm-title">
	 <h3 class="ui-title px-0">공지사항</h3>
	 <!-- <p class="px-0"></p> -->
</div>
<div class="row">
	<div class="col px-0 pb-5">
		<div class="ui-board notice">
			<form id="modifyForm" action="/notice/modify" method="post">
				<div class="ui-board-detail">
					<div class="ui-board-detail-head">
						<h3><input type="text" name="title" value="${dto.title }" style="width:100%"/></h3>
						<div class="detail-row">
							<strong class="writer">${dto.writer }</strong>
						</div>
					</div>
					<div class="ui-board-detail-content">
						<textarea rows="10" cols="" style="width: 100%" name="content">${dto.content }</textarea>
					</div>
				</div>
				<input type="hidden" name="seq" value="${dto.seq}" />
			</form>
			<div class="ui-board-bottom right pt-3">
				<button type="button" class="btn default back">뒤로가기</button>
				<button type="button" class="btn default list">목록</button>
				<button type="button" class="btn point modify">수정</button>
			</div>
			
		</div>
	</div>
</div>

<script>
	$(function(){
		let updated = `${updated}`;
		if( updated == "false") {
			$(".alertModal-content").text("게시글 수정이 실패되었습니다.")
			$("#alertModal").modal("show");	
		}
		
		let $modifyForm = $("#modifyForm");
		$(".notice .ui-board-bottom > .back").on("click", function(){
			history.back();
		})
		$(".notice .ui-board-bottom > .list").on("click", function(){
			location.href = `/notice/list`;
		});
		
		$(".notice .ui-board-bottom > .modify").on("click", function(){
			$modifyForm.submit();
		});
	})
</script>