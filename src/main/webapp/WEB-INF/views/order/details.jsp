<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<script src="/resources/assets/js/noticeReply.js"></script>

<sec:authentication property="principal" var="pinfo" />

<div class="row find-pharm-title">
	 <h3 class="ui-title px-0">주문목록</h3>
	 <!-- <p class="px-0"></p> -->
</div>
<div class="row">
	<div class="col px-0 pb-5">
		<div class="order-details my-5">
			<table>
				<tr>
					<th><input type="checkbox" name="all" /></th>
					<th>번호</th>
					<th>이미지</th>
					<th>제품명</th>
					<th>수량</th>
					<th>가격</th>
					<th>기타</th>
				</tr>
				<tr>
					<td><input type="checkbox" name="order1" /></td>
					<td>1</td>
					<td class="order-image"><a href="#"><img src="/resources/assets/images/${dto.img_name }" alt="" /></a></td>
					<td><a href="#" class="product-title">${dto.pname }</a></td>
					<td><input type="number" min="1" name="quantity" class="order-quantity" value="1" min="1" max="${dto.amount }"/></td>
					<td><span class="order-price"><fmt:formatNumber value="${item.price }" type="number" />원</span></td>
					<td><button class="btn default">삭제</button></td>
				</tr>
			</table>
			
			<div class="total-order py-4 my-5 txt-right">
				<p><span>총 결제금액</span> <strong>1,000원</strong> + <span>배송비</span> <strong>0원</strong></p>
				<p class="m-0">결제 예정 금액 : <strong>1,000원</strong></p>
			</div>
			
			<div class="payment txt-center">
				<button class="btn point btn-lg">결제하기</button>
			</div>
		</div>
	</div>
</div>

<script>
	$(function(){
		
		
	})
		
	
</script>