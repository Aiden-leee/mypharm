
let noticeReplyService = (function(){
	
	function add(reply, callback) {
		$.ajax({
			type: "POST"
			, url: "/noticeReplies/new"
			, data: JSON.stringify(reply)
			, contentType : "application/json; charset=UTF-8" // 요청 데이터 타입 
			, cache: false
			, success: function(result, status, xhr) {
				if( callback ) {
					callback(result);
				}
			}
			, error: function(xhr, status, er) {
				if( error ) {
					error(er);
				}
			}
		});
	}
	
	function getList(param, callback) {
		let seq = param.seq;
		let page = param.page;
	
		$.ajax({
			type: "GET"
			, url: `/noticeReplies/${seq}/${page}`
			, contentType : "application/json; charset=UTF-8" // 요청 데이터 타입 
			, dataType: "json" // 응답 데이터 타입
			, cache: false
			, success: function(result, status, xhr) {
				if( callback ) {
					callback(result);
				}
			}
			, error: function(xhr, status, er) {
				if( error ) {
					error(er);
				}
			}
		});
	}
	
	function modify(reply, callback) {
		$.ajax({
			type: "PUT"
			, url: `/noticeReplies/${reply.rno}`
			, data: JSON.stringify(reply)
			, contentType : "application/json; charset=UTF-8" // 요청 데이터 타입 
			, cache: false
			, success: function(result, status, xhr) {
				if( callback ) {
					callback(result);
				}
			}
			, error: function(xhr, status, er) {
				if( error ) {
					error(er);
				}
			}
		});
	}
	
	function displayTime(timeValue) {

		var today = new Date();
		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);
		var str = "";

		if (gap < (1000 * 60 * 60 * 24)) {
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
					':', (ss > 9 ? '' : '0') + ss ].join('');
		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
			var dd = dateObj.getDate();

			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
					(dd > 9 ? '' : '0') + dd ].join('');
		}
	}
	
	return {
		add,
		getList,
		modify,
		displayTime
	}
})();