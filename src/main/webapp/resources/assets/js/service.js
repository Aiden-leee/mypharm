

// 행정구역 서비스 
let localService = (function(){
	
	// 구 조회 
	function getGu(si, callback) {
		$.ajax({
			url: `/addr/${si}`
			, method: "GET"
			//, data: si
			//, data: JSON.stringify(dept)  // object -> json 형태 string 파라미터로 보냄
			, dataType: "json"
			, contentType: "application/json; charset=utf-8"
			, cache: false
			, success: function(result, status, xhr){
				if( callback ) {
					callback(result);
				}
			}
			, error: function(xhr, er){
				if( error ) {
					error(er);
				}
			}
		})
	}
	
	// 동 조회 
	function getDong(si, gu, callback) {
		$.ajax({
			url: `/addr/${si}/${gu}`
			, method: "GET"
			//, data: si
			//, data: JSON.stringify(dept)  // object -> json 형태 string 파라미터로 보냄
			, dataType: "json"
			, contentType: "application/json; charset=utf-8"
			, cache: false
			, success: function(result, status, xhr){
				if( callback ) {
					callback(result);
				}
			}
			, error: function(xhr, er){
				if( error ) {
					error(er);
				}
			}
			
		})
	}
	
	return {
		getGu,
		getDong
	}
})();


// 약국 서비스 
var pharmService = (function(){

	var csrfHeaderName;
	var csrfTokenValue;
	
	function init(_csrfname,_csrftoken) {
		csrfHeaderName = _csrfname;
		csrfTokenValue = _csrftoken;
	}
	
	// 약국 조회 	
	function selectPharm(lat, lng, callback){
		let latlng = {lat,lng}
		
		//console.log(latlng);
		//console.time();
		//$(".spinner-border-wrap").show();
		$.ajax({
			url: "/api/pharm/pharmacy"	
			, method: "POST"
			, data: JSON.stringify(latlng)
			//, data: JSON.stringify(dept)  // object -> json 형태 string 파라미터로 보냄
			, dataType: "json"
			, contentType: "application/json; charset=utf-8"
			, cache: false
			, beforeSend: function(xhr){
				xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
			}
			, success: function(result, status, xhr){
				//$(".spinner-border-wrap").hide();
				//console.timeEnd();
				
				if( callback ) {
					callback(result);
				}
			}
			, error: function(xhr, er){
				if( error ) {
					error(er);
				}
			}
		})
	}
	
	// 동네 약국 조회 
	function getDongPharm(si, gu, dong, callback) {
		let addr = {si,gu,dong}
  				
		$.ajax({
			url: `/api/pharm/dongPharm`
			, method: "POST"
			, data: JSON.stringify(addr)
			//, data: JSON.stringify(dept)  // object -> json 형태 string 파라미터로 보냄
			, dataType: "json"
			, contentType: "application/json; charset=utf-8"
			, cache: false
			, success: function(result, status, xhr){
				if( callback ) {
					callback(result);
				}
			}
			, error: function(xhr, er){
				if( error ) {
					error(er);
				}
			}
		})
	}
	
	return {
		init,
		selectPharm,
		getDongPharm
	}
})();