<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>


<!doctype html>
<html lang="en">
  <!-- head -->
  <tiles:insertAttribute name="head"/>
  
  <body>
  	<script>
	  	let cpage = `<tiles:getAsString name="page" />`;
  	</script>
  	<div class="wrap">
	   <!-- header  -->
	  	<tiles:insertAttribute name="header"/>
	
  		<!-- Content here -->
	    <%@ include file="/WEB-INF/views/layouts/main_banner.jsp" %>
		
		 <div class="container pt-5">
		 	<!-- content -->
		 	<tiles:insertAttribute name="content"/>
  		
  		</div>
  		
  		<!-- footer -->
  		<tiles:insertAttribute name="footer"/>
  	</div>
  	
	
	<!-- 알림 Modal -->
	<div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">알림</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p class="alertModal-content"></p>
	      </div>
	      <div class="modal-footer">
	        <!-- <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->
	        <button type="button" class="btn btn-primary confirm" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 컨펌 모달  -->
	<div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">알림</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p class="confirmModal-content"></p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary cancel" data-bs-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary confirm" data-bs-dismiss="modal" data-confirm="true">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 로그인 컨펌 모달  -->
	<div class="modal fade" id="loginConfirmModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">알림</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p class="loginConfirmModal-content">로그인이 필요한 서비스 입니다.<br />로그인하시겠습니까?</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary cancel" data-bs-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary login-confirm" data-bs-dismiss="modal" data-confirm="true">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- 컨펌 댓글 삭제 모달  -->
	<div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">알림</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <p class="confirmDeleteModal-content"></p>
	        <input type="hidden" name="deleteRno" />
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary cancel" data-bs-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary deleteConfirm" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
  	
  	<!-- 댓글 수정 모달  -->
  	<div class="modal fade" id="replyModifyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="replyModalLabel">댓글 수정</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <div class="replyModifyModal-content">
		        	<div class="mb-3">
				  <span class="form-label">작성자</span>
				  <strong class="modalReplyer">user1</strong>
				  <input type="hidden" name="modalRno" value="" />
				</div>
				<div class="mb-3">
				  <label for="exampleFormControlInput1" class="form-label">댓글</label>
				  <input type="text" class="form-control" name="modalReplyContent">
				</div>
	        	</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary cancel" data-bs-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary modified" data-bs-dismiss="modal">수정하기</button>
	      </div>
	    </div>
	  </div>
	</div>

  </body>
</html>