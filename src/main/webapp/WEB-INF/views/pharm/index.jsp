<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- map -->
<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ia6n8sfs50&callback=initMap"></script>
<script src="/resources/assets/js/service.js"></script>
<script src="/resources/assets/js/MarkerClustering.js"></script>
<script src="/resources/assets/js/map.js"></script>

<div class="row find-pharm-title">
	 <h3 class="ui-title px-0">약국 찾기</h3>
	 <p class="px-0">반경 1km 이내에 현재 영업중인 약국을 확인 할 수 있습니다.</p>
</div>
<div class="row">
	<div class="search-wrap p-0">
		<div class="input-group">
			<select class="form-select" name="si" >
				<option>광역시도 선택</option>
				<option value="서울특별시">서울시</option>
				<option value="경기도">경기도</option>
				<option value="인천광역시">인천시</option>
				<option value="부산광역시">부산시</option>
				<option value="대전광역시">대전시</option>
				<option value="대구광역시">대구시</option>
				<option value="울산광역시">울산시</option>
				<option value="세종특별자치시">세종시</option>
				<option value="광주광역시">광주시</option>
				<option value="강원도">강원도</option>
				<option value="충청북도">충청북도</option>
				<option value="충청남도">충청남도</option>
				<option value="경상북도">경상북도</option>
				<option value="경상남도">경상남도</option>
				<option value="전라북도">전라북도</option>
				<option value="전라남도">전라남도</option>
				<option value="제주특별자치도">제주도</option>
			</select>
			<select class="form-select" aria-label="Default select example" name="gu">
			  <option selected value="0">시/군/구 선택</option>
			</select>
			<select class="form-select me-2" aria-label="Default select example" name="dong">
			  <option selected value="0">읍/면/동 선택</option>
			</select>
			<button type="button" id="initSettingMap" class="btn btn-success" >초기화</button>
		</div>
			<!-- <div class="input-group">
				<input class="form-control me-2" type="search" name="pharm" placeholder="읍/면/동 또는 약국명 입력" aria-label="Search">
				<button type="button" id="actionPharmacy" class="btn btn-success" >약국찾기</button>
			</div> -->
			
		</div>
</div>
<div class="row">
	<div id="map" class="tg_map" style="width:100%;height:400px;border-radius: 10px;">
		<div class="spinner-border-wrap" style="display: none">
 			<div class="spinner-border" role="status">
		  		<span class="visually-hidden">Loading...</span>
			</div>
		</div>
	</div>
</div>
 	
<div class="row">
	<div class="col px-0">
		<h3 class="ui-title pt-5">약국 정보</h3>
		<div class="pharmacy-view">
			<table class="empty-pharmacy">
				<tr>
					<td>이곳에 선택한 약국 정보가 나타납니다.</td>
				</tr>
			</table>
		</div>
	</div>
</div>

<div class="pharmacy-list">
	<%-- <div class="card" style="width: 18rem;">
  <div class="card-body">
    <h5 class="card-title">${dutyName }</h5>
    <h6 class="card-subtitle mb-2 text-body-secondary">${dutyAddr }</h6>
    <p class="card-text">${dutyTel1 }</p>
    <a href="#" class="card-link">Card link</a>
    <a href="#" class="card-link">Another link</a>
  </div>
</div> --%>
</div>

<script>
	$(function(){
		var csrfHeaderName = `${_csrf.headerName}`;
		var csrfTokenValue = `${_csrf.token}`;
		pharmService.init(csrfHeaderName,csrfTokenValue);
		
		let $si = $(".search-wrap select[name=si]");	// 시 
		let $gu = $(".search-wrap select[name=gu]");	// 구
		let $dong = $(".search-wrap select[name=dong]"); // 동 
		let si = 0;
		let gu = 0;
		let dong = 0;
		
		initSelectPharm();
		
		// 초기 약국 조회 
		function initSelectPharm() {
			$(".spinner-border-wrap").show();
			pharmService.selectPharm(37.56605095, 126.9823729, function(data){
				initMap(data);
				$(".spinner-border-wrap").hide();
			})
		}
		
		// 초기화 버튼
		$("#initSettingMap").on("click", function(){
			initSelectPharm();
			$si.find("option").eq(0).prop("selected", true);
			$gu.find("option:not(:first-child)").remove();
			$dong.find("option:not(:first-child)").remove();
			$(".pharmacy-view").children().remove();
			$(".pharmacy-view").append(`
					<table class="empty-pharmacy">
						<tr>
							<td>이곳에 선택한 약국 정보가 나타납니다.</td>
						</tr>
					</table>		
			`);
		});
		
		// 시 선택시 
		$si.on("change", function(){
			si = $(this).val();
			$gu.find("option:not(:first-child)").remove();
			$dong.find("option:not(:first-child)").remove();
			if( si == 0 ) return;
			
			localService.getGu(si, function(data){
				if( si == "세종특별자치시") {
					$gu.append(`<option value='특별자치' >특별자치</option>`);
					return;
				}
				for(let si of data) {
					$gu.append(`<option value='\${si}' >\${si}</option>`);
				}
			});

		})
		
		// 구 선택시 
		$gu.on("change", function(){
			gu = $(this).val();
			$dong.find("option:not(:first-child)").remove();
			if( gu == 0 ) return;
			
			localService.getDong(si, gu, function(data){
				for(let dong of data) {
					$dong.append(`<option value='\${dong.dong}' data-lat='\${dong.lat}' data-lng='\${dong.lng}'>\${dong.dong}</option>`);
				}
			});
		})
		
		$dong.on("change", function(){
			let lat = $(this).find("option:selected").data("lat");
			let lng = $(this).find("option:selected").data("lng");
			
			let dong_latlng = { lat, lng };
			getDongPharmList(dong_latlng);
		})
		

		function getDongPharmList(latlng){
			$(".pharmacy-list").children().remove();
			
			$(".spinner-border-wrap").show();
		pharmService.selectPharm(latlng.lat, latlng.lng, function(result){
				$(".spinner-border-wrap").hide();
				if( result.length < 1 || result == null) {
					$("#alertModal .alertModal-content").text("해당 지역에 약국이 없습니다.");
					$("#alertModal").modal("show");
					return ;
				}
				// 지도 데이터 출력 
				getMapList(map,result);
				markerCenter(map,markers);
				
				// 약국 목록 데이터 출력 
				/*
				for(let p of result) {
					$(".pharmacy-list").append(`
						<div class="card" >
						  <div class="card-body">
						    <h5 class="card-title">\${p.dutyName }</h5>
						    <h6 class="card-subtitle mb-2 text-body-secondary">\${p.dutyAddr }</h6>
						    <p class="card-text">\${p.dutyTel1 }</p>
						    <a href="#" class="card-link">Card link</a>
						    <a href="#" class="card-link">Another link</a>
						  </div>
						</div>
					`);
				}
				*/
			})
		}
		
	})
</script>