<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<div class="row find-pharm-title">
	 <h3 class="ui-title px-0">회원가입</h3>
</div>
<div class="row justify-content-md-center">
	<div class="col-md-auto col-md-5 px-0 py-5">
		<form id="signupForm" method="POST">
			<div class="mb-3 ipt">
			  <label for="idFormControlInput" class="form-label">아이디 <i class="bi bi-check-circle"></i></label>
			  <div class="input-group">
				  <input type="text" class="form-control" id="idFormControlInput" name="id" placeholder="영문 or 영문+숫자 4~12자 입력">
				  <button type="button" class="btn default idcheck">중복체크 <i class="bi"></i></button>			  
			  </div>
			</div>
			<div class="mb-3 ipt">
			  <label for="passwordFormControlInput" class="form-label">비밀번호 <i class="bi bi-check-circle"></i></label>
			  <input type="password" class="form-control" id="passwordFormControlInput" name="pwd" placeholder="영문, 숫자, 특수문자 포함 길이 8~20자">
			</div>
			<div class="mb-3 ipt">
			  <label for="nameFormControlInput" class="form-label">이름 <i class="bi bi-check-circle"></i></label>
			  <input type="text" class="form-control" id="nameFormControlInput" name="name" placeholder="최소 2자 이상">
			</div>
			<div class="mb-3 ipt">
			  <label for="emailFormControlInput" class="form-label">이메일 <i class="bi bi-check-circle"></i></label>
			  <input type="email" class="form-control" id="emailFormControlInput" name="email" placeholder="name@example.com">
			</div>
			<div class="mb-3 ipt">
			  <label for="telFormControlInput" class="form-label">연락처 <i class="bi bi-check-circle"></i></label>
			  <div class="input-group">
					<input type="text" class="form-control" id="telFormControlInput" value="010" readonly>
					<input type="text" class="form-control" id="tel2" >
					<input type="text" class="form-control" id="tel3" >
					<input type="hidden" name="phone" />
				</div>
			</div>
			<div class="mb-3 ipt">
				<label for="addrFormControlInput" class="form-label">주소 <i class="bi bi-check-circle"></i></label>
				<div class="input-group mb-2">
					<input type="text" class="form-control" id="postcode" placeholder="우편번호" name="zipcode" readonly />
					<input type="button" class="btn default" onclick="researchPostCode()" value="주소 찾기">
				</div>
				<div class="input-group mb-2">
					<input type="text" class="form-control" id="address" placeholder="주소" name="addr" readonly />
				</div>
				<div class="input-group mb-2">
					<input type="text" class="form-control" id="detailAddress" placeholder="상세주소" />
					<input type="text" class="form-control" id="extraAddress" placeholder="참고항목" readonly />
				</div>
			</div>
			<div class="mb-3 ipt">
				<div class="form-label">성별</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" id="genderFormControlInput1" name="gender" value="남" checked>
				  <label class="form-check-label" for="genderFormControlInput1">남</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" id="genderFormControlInput2" name="gender" value="여">
				  <label class="form-check-label" for="genderFormControlInput2">여</label>
				</div>
			</div>
			<div class="mb-3 ipt">
			  <label for="birthFormControlInput" class="form-label birthLabel">생년월일</label>
			  <input type="date" class="form-control" id="birthFormControlInput" name="birth" min="1900-01-01" value="1990-10-10">
			</div>
			<input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }">
		</form>
		<div class="input-group justify-content-center mt-5">
			<button class="btn point signup">회원가입</button>
		</div>
	</div>
</div>
<script>
function researchPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
        }
    }).open();
}
</script>
<script>
	$(function(){
		let idDuplicate = true;
		let isSignup = `${isSignup}`;
		
		let $signupForm = $("#signupForm");
		let $idFormControlInput = $("#idFormControlInput");
		let $passwordFormControlInput = $("#passwordFormControlInput");
		let $nameFormControlInput = $("#nameFormControlInput");
		let $emailFormControlInput = $("#emailFormControlInput");
		let $telFormControlInput1 = $("#telFormControlInput");
		let $telFormControlInput2 = $("#tel2");
		let $telFormControlInput3 = $("#tel3");
		
		let $postcode = $("#postcode");
		let $addr = $("#address");
		let $detailAddr = $("#detailAddress");
		let $extraAddress = $("#extraAddress");
		
		let idchk = pwdchk = namechk = emailchk = phonechk = addrchk = false;
		
		// id 
		$idFormControlInput.on("input", function(){
			idchk = validateId($(this).val());
			confirmChkIcon(idchk, $(this));
		})
		
		// pwd 
		$passwordFormControlInput.on("input", function(){
			pwdchk = validatePwd($(this).val());
			confirmChkIcon(pwdchk, $(this));
		})
		
		// name 
		$nameFormControlInput.on("input", function(){
			namechk = validateName($(this).val());
			confirmChkIcon(namechk, $(this));
		})
		
		// email  
		$emailFormControlInput.on("input", function(){
			emailchk = validateEmail($(this).val());
			confirmChkIcon(emailchk, $(this));
		})
		
		// phone  
		$("#tel2, #tel3").on("input", function(){
			$(this).val($(this).val().replace(/[^0-9]/g, ""));
			if( $(this).val().length > 4) {
				$(this).val( $(this).val().substr(0,4) );
			} 
			let phone = $telFormControlInput1.val() +"-"+ $telFormControlInput2.val() + "-" + $telFormControlInput3.val();  
			phonechk = validateTel( phone );
			console.log(phone)
			confirmChkIcon(phonechk, $(this));
		})
		
		// 유효성 검사 아이콘 표시 
		function confirmChkIcon(val,target) {
			if( !val ) {
				$(target).parents(".ipt").find(".bi-check-circle").removeClass("ok").addClass("invalid");
			}else {
				$(target).parents(".ipt").find(".bi-check-circle").removeClass("invalid").addClass("ok");
			}
		}
		
		// id check
		function validateId(val) {
			let reg = /^[a-z][a-z0-9_]{3,11}$/;
			if( !reg.test(val) ) return false;
			return true;
		}
		
		// pwd check
		function validatePwd(val){
			/*
			숫자가 최소한 한 번 이상 포함되어야 합니다.
			알파벳(대소문자)가 최소한 한 번 이상 포함되어야 합니다.
			특수 문자가 최소한 한 번 이상 포함되어야 합니다.
			숫자, 알파벳(대소문자), 특수 문자 중에서 8에서 20개의 문자로 이루어져 있어야 합니다.
			*/
			let reg = /^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[~!@#$%\^&*()-+=])[0-9a-zA-Z~!@#$%\^&*()-+=]{8,20}$/;
			if( !reg.test(val) ) return false;
			return true;
		}
		
		// name check
		function validateName(val) {
			if( val.length < 2 || val.length > 30 ) return false;
			return true;
		}
		
		// email check
		function validateEmail(val) {
			//사용자 이메일에 대한 정규식 - 언더바(_), 하이픈(-) 포함 및 길이 지정
			let reg = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
			if( !reg.test(val) ) return false;
			return true;
		}
		
		// tel check
		function validateTel(val) {
			let reg = /^010-[0-9]{3,4}-[0-9]{4}$/;
			if( !reg.test(val) ) return false;
			return true;
		}
		
		// addr check
		function validateAddr() {
			if( $addr.val().length == 0 || $detailAddr.val().length == 0) return false;
			return true;
		}
		
		$(".signup").on("click", function(){
			addrchk = validateAddr();
			
			if( idDuplicate ) {
				confirmChkIcon(!idDuplicate, $idFormControlInput);
				$idFormControlInput.focus();
				return false;
			}
			
			if( !idchk ) {
				confirmChkIcon(idchk, $idFormControlInput);
				$idFormControlInput.focus();
				return false;
			} 
			if( !pwdchk ) {
				confirmChkIcon(pwdchk, $passwordFormControlInput);
				$passwordFormControlInput.focus();
				return false;
			} 
			if( !namechk ) {
				confirmChkIcon(namechk, $nameFormControlInput);
				$nameFormControlInput.focus();
				return false;
			} 
			if( !emailchk ) {
				confirmChkIcon(emailchk, $emailFormControlInput);
				$emailFormControlInput.focus();
				return false;
			} 
			if( !phonechk ) {
				confirmChkIcon(phonechk, $telFormControlInput1);
				return false;
			} 
			if( !addrchk ) {
				confirmChkIcon(addrchk, $detailAddr);
				return false;
			}else {
				confirmChkIcon(addrchk, $detailAddr);
			}
			
			// 전화번호 변환
			let phone = $telFormControlInput1.val() +"-"+ $telFormControlInput2.val() + "-" + $telFormControlInput3.val();
			$(":hidden[name='phone']").val(phone);
			// 주소 = 주소+상세주소+참고항목 
			$addr.val( $addr.val() + " " + $detailAddr.val() + $extraAddress.val() );
			$signupForm.attr("action", "/auth/signup")
						.submit();
		})
		
		if( isSignup == "success" ) {
			$(".alertModal-content").html("회원가입이 완료되었습니다. <br /> 로그인페이지로 이동합니다.");
			$("#alertModal").modal("show");
			$("#alertModal .confirm").on("click", function(){
				location.href = "/auth/signin";
			});
		}else if( isSignup == "fail" ) {
			$(".alertModal-content").html("회원가입이 실패되었습니다.");
			$("#alertModal").modal("show");
		}
		
		$(".idcheck").on("click", function(){
			let id = $idFormControlInput.val();
			$(".idcheck > i").removeClass();
			if( id.length < 1 || !validateId(id) ) return; 
			$.ajax({
				url: `/auth/idcheck/\${id}`
				, method: "GET"
				, dataType: "json"
				, contentType: "application/json; charset=utf-8"
				, cache: false
				, success: function(result, status, xhr){
					console.log(result);
					idDuplicate = result;
					if( idDuplicate ) {
						// 중복 
						$(".idcheck > i").removeClass("bi-check-lg").addClass("bi-exclamation-circle");
					}else {
						// 중복x
						$(".idcheck > i").removeClass("bi-exclamation-circle").addClass("bi-check-lg");
					}
					
				}
				, error: function(xhr, er){
					if( error ) {
						error(er);
					}
				}
			})
		})
	})
</script>