<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<script src="/resources/assets/js/noticeReply.js"></script>

<sec:authentication property="principal" var="pinfo" />

<div class="row find-pharm-title">
	 <h3 class="ui-title px-0">건강기능식품</h3>
	 <!-- <p class="px-0"></p> -->
</div>
<div class="row">
	<div class="col px-0 pb-5">
		<div class="healthfood-detail py-5">
			<div class="container-xl" style="max-width: 1000px">
				<div class="row">
					<div class="col col col-lg-6 col-sm-12">
						<div class="healthfood-product-image mb-5">
							<img src="/resources/assets/images/${dto.img_name }" alt="" />
						</div>
					</div>
					<div class="col">
						<div class="product-info-box">
							<h3 class="product-title">${dto.pname }</h3>
							<p class="subtitle">${dto.subtitle }</p>
							<div class="price-box py-4">
								<ul>
									<li class="product-price" data-price="1000"><strong>판매가</strong> <span class="p-price"><fmt:formatNumber value="${dto.price }" type="number" />원</span></li>
									<li><strong>수량</strong> <input type="number" name="pamount" value="1" min="1" max="${dto.amount }" style="width:70px"/></li>
								</ul>
							</div>
							<div class="total-price py-3 mb-4 txt-right">
								<span>총 합계: </span><strong class="total"><fmt:formatNumber value="${dto.price }" type="number" /></strong>원
							</div>
							<div class="product-buy-step txt-right">
								<!-- <button class="btn point2 cart">장바구니</button> -->
								<button class="btn point buy">구매하기</button>
							</div>
							
							<form id="productForm">
								<input type="hidden" name="pno" value=""/>
								<input type="hidden" name="quantity" value="1"/>
							</form>
						</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col">
						<div class="product-detail">
							<h3>상세설명</h3>
							<div class="detail-content">
								${dto.content }
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$(function(){
		
		// 수량 변경시 계산 
		$(".healthfood-detail .product-info-box input[name='pamount']").on("input", function(){
			let amount = $(this).val();
			let price = $(".product-price").data("price");
			let total = Number(amount*price);
			$(".total-price .total").text(total.toLocaleString());
			$("#productForm :hidden[name='quantity']").val(amount);
		})
		
		$(".cart").on("click", function(){
			alert("준비중..")
		})
		
		$(".buy").on("click", function(){
			
		})
		
	})
		
	
</script>