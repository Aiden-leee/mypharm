<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>


<!doctype html>
<html lang="en">
  <!-- head -->
  <tiles:insertAttribute name="head"/>
  
  <body>
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
  	
	
	<!-- Modal -->
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
	        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
  	
  	
  </body>
</html>