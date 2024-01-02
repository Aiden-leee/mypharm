<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script src="/resources/assets/js/noticeReply.js"></script>

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
			<form id="detailForm" action="/notice/delete" method="post">
				<input type="hidden" name="seq" value="${dto.seq }" />
			</form>
			
			<div class="ui-board-bottom right pt-3">
				<button type="button" class="btn default back">뒤로가기</button>
				<button type="button" class="btn default list">목록</button>
				<button type="button" class="btn point modify">수정</button>
				<button type="button" class="btn point2 delete">삭제</button>
			</div>
			
			
			<div class="reply-wrap pt-3">
				<h4>댓글 <span class="total-reply">0</span></h4>
				<div class="reply-container">
					<div class="reply-write">
						<div class="input-group">
							<textarea class="form-control" name="reply" id="" rows="4" placeholder="댓글을 입력해주세요. (400자)" maxlength="400" style="resize:none"></textarea>
							<button class="btn point add">댓글등록</button>
						</div>
					</div>
					<div class="reply-list py-3">
					</div>
				</div>
			</div>
			
			<!-- pagination -->
			<div class="pagination-wrap pt-5 pb-3">
				<nav aria-label="Page navigation">
				  <ul class="pagination reply-pagination">
				  </ul>
				</nav>
			</div>
			
		</div>
	</div>
</div>

<script>
	$(function(){
		let $replyAdd = $(".reply-write button.add");
		let $reply = $(".reply-write textarea[name='reply']");
		let $seq = $(":hidden[name='seq']");
		// 등록 확인
		let $confirmModal = $("#confirmModal");
		let $confirmModalContent = $(".confirmModal-content");
		// 댓글 수정 
		let $replyModifyModal = $("#replyModifyModal");
		let $replyModifyContent = $(".replyModifyModal-content");
		
		let $detailForm = $("#detailForm");
		let updated = `${updated}`;
		if( updated == "true") {
			$(".alertModal-content").text("게시글이 수정되었습니다.");
			$("#alertModal").modal("show");	
		}
		
		$(".notice .ui-board-bottom > .back").on("click", function(){
			history.back();
		})
		$(".notice .ui-board-bottom > .list").on("click", function(){
			location.href = `/notice/list`;
		});
		$(".notice .ui-board-bottom > .modify").on("click", function(){
			location.href = `/notice/modify/${dto.seq}`;
		});
		
		$(".notice .ui-board-bottom > .delete").on("click", function(){
			$detailForm.submit();
		})
		
		
		let rpage = 1;
		let $totalReply = $(".total-reply");
		let $replyList = $(".reply-list");
		getReplyList(1);
		
		
		// 댓글 조회
		function getReplyList(page) {
			let reply_html = "";
			$replyList.html("");
			noticeReplyService.getList({seq:$seq.val(), page: page || 1}, function(result){
				$totalReply.text(result.replyCnt);
				for(let rp of result.list) {
					reply_html += `
						<ul class="reply">
							<li>
								<strong class="replyer">\${rp.replyer}</strong>
								<input type="hidden" name="rno" value="\${rp.rno}"/>
							</li>
							<li><p class="my-2 reply-content">\${rp.content}</p></li>
							<li class="reply-etc">
								<span class="reply-date">\${noticeReplyService.displayTime(rp.regdate)}</span>
								<div class="btn-group btn-group-sm" role="group" aria-label="Small button group">
								  <button type="button" class="btn btn-outline-dark reply-modify">수정</button>
								  <button type="button" class="btn btn-outline-dark reply-remove">삭제</button>
								</div>
							</li>
						</ul>
					`;
				}
				$replyList.html(reply_html);
				replyPaging(result.pageMaker);
			})
		}
	
		
		// 댓글 수정 
		$(document).on("click", ".reply .reply-modify", function(){
			let $reply = $(this).parents(".reply");
			let modifyrno = $reply.find(":hidden[name='rno']").val();
			let modifyReplyer= $reply.find(".replyer").text();
			let modifyContent = $reply.find(".reply-content").text();
			
			$replyModifyModal.modal("show");
			$replyModifyContent.find(":hidden[name='modalRno']").val(modifyrno);
			$replyModifyContent.find(".modalReplyer").text(modifyReplyer);
			$replyModifyContent.find(":text[name='modalReplyContent']").val(modifyContent);
		})
		
		
		
		$(".modified").on("click", function(){
			let rno = $(":hidden[name='modalRno']").val();
			let replyer = $(".modalReplyer").text();
			let replyContent = $(":text[name='modalReplyContent']").val();
			let reply = {rno, replyer, content: replyContent }
			
			noticeReplyService.modify(reply, function(result){
				if( result == "success") {
					$("#alertModal").modal("show");
					$(".alertModal-content").text("댓글이 수정되었습니다.");
				}
				getReplyList(rpage);
			})
		})
		
		// 댓글 등록
		$replyAdd.on("click", function(){
			$confirmModal.modal("show");
			$confirmModalContent.text("댓글을 등록하겠습니까?");
		})
		$("#confirmModal .confirm").on("click", function(){
			let reply = {
				replyer: "user1",
				content: $reply.val(),
				seq: $seq.val()
			}
			
			noticeReplyService.add(reply, function(result){
				if( result == "success") {
					$("#alertModal").modal("show");
					$(".alertModal-content").text("댓글이 등록되었습니다.");
				}
				$reply.val("");
				getReplyList();
			})
		})
		
		// 댓글 페이징
		function replyPaging(pageMaker) {
			let pagination = "";
			let prev = `
				<li class="page-item">
			      <a class="page-link \${pageMaker.prev ? '' : 'disabled' }" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			`;
			let next = `
				<li class="page-item">
			      <a class="page-link \${pageMaker.next ? '' : 'disabled' }" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li> 
			`;
			let paging = "";
			for (var i = 1; i <= pageMaker.endPage; i++) {
				paging += `
				<li class="page-item">
				    	<a class="page-link \${pageMaker.criteria.pageNum == i ? 'active' : '' }" href="javascript:void(0)" data-page="\${i}">\${i }</a>
			    </li>
			    `;
			}
			pagination +=  prev + paging + next;
			$(".reply-pagination").html(pagination);

		}
		// 페이지 클릭 이벤트
		$(document).on("click", ".page-link", function(){
			let page = $(this).data("page");
			rpage = page;
			getReplyList(page);
		})
	})
		
	
</script>