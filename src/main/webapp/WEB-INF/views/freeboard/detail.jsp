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
			<div class="ui-board-detail">
				<div class="ui-board-detail-head">
					<h3>${dto.title }</h3>
					<div class="detail-row">
						<strong class="writer">${dto.writer }</strong>
						<span class="regdate">등록일: <fmt:formatDate value="${dto.regdate }" pattern="yyyy.MM.dd"/></span>
						<span>수정일: <fmt:formatDate value="${dto.updated }" pattern="yyyy.MM.dd"/></span>
					</div>
				</div>
				<div class="ui-board-detail-content">
					${dto.content }		
				</div>
			</div>
			
			<div class="ui-board-bottom right pt-3">
				<button type="button" class="btn default back">뒤로가기</button>
				<button type="button" class="btn default list">목록</button>
				<button type="button" class="btn point modify">수정</button>
				<button type="button" class="btn point2 delete">삭제</button>
			</div>
			
		</div>
	</div>
</div>

<script>
	$(function(){
		let updated = `${updated}`;
		if( updated == "true") {
			$(".alertModal-content").text("게시글이 수정되었습니다.")
			$("#alertModal").modal("show");	
		}
		console.log(updated);
		$(".notice .ui-board-bottom > .back").on("click", function(){
			history.back();
		})
		$(".notice .ui-board-bottom > .list").on("click", function(){
			location.href = `/notice/list`;
		});
		$(".notice .ui-board-bottom > .modify").on("click", function(){
			location.href = `/notice/modify/${dto.seq}`;
		});
		
	})
</script>