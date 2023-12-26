// naver map
let map = null;
let loadCheck = true;
let markers = [];
let infoWindows = [];
function initMap(data) {
  var mapOptions = {
    center: new naver.maps.LatLng(37.56605095, 126.9823729),
    mapTypeControl: false,
    mapTypeControlOptions: {
      style: naver.maps.MapTypeControlStyle.BUTTON,
      position: naver.maps.Position.TOP_RIGHT,
    },
    scaleControl: false,
    logoControl: false,
    mapDataControl: false,
    zoomControl: true,
    minZoom: 7,
    zoom: 17,
  };

  map = new naver.maps.Map("map", mapOptions);

  if (data == null || data.length < 1) return;

  getMapList(map, data);

  let timer = null;

  map.addListener("bounds_center", function () {
    clearTimeout(timer);
  });

  // 드래그 후 이벤트
  map.addListener("idle", function () {
    if (!loadCheck) return;
    loadCheck = false;
    timer = setTimeout(function () {
      let latlng = { lat: map.getCenter()._lat, lng: map.getCenter()._lng };

      pharmService.selectPharm(latlng.lat, latlng.lng, function (result) {
        getMapList(map, result);
        loadCheck = true;
      });
    }, 100);
  });
}

// map에 마커 및 정보창 출력
function getMapList(map, data) {
  if (markers.length > 0) {
    for (let i = 0; i < markers.length; i++) {
      markers[i].setMap(null);
    }
  }
  markers = [];
  infoWindows = [];

  for (let pharm of data) {
    let isOpen = openTimeCheck(pharm);
    let marker = new naver.maps.Marker({
      position: new naver.maps.LatLng(pharm.wgs84Lat, pharm.wgs84Lon),
      map: map,
      icon: {
        content: `
		                    <div class="map_markerbox ${isOpen ? "open" : ""}">
		                        <div class="map_group">
		                        	<span class="balloon_tail"></span>
		                            <div class="map_marker">
		                                <span class="ico"><span class="pharmacy_ico"></span></span>
		                                <span class="name">${pharm.dutyName}</span>
		                            </div>
		                        </div>
		                    </div>
		                `,
        size: new naver.maps.Size(40, 40),
        anchor: new naver.maps.Point(19, 58),
      },
    });

    /*	
		let infoWindow = new naver.maps.InfoWindow({
	        content: `<div style="width:150px;text-align:center;padding:10px;">
	        				${pharm.dutyName}
	        		</div>`
	    });
	    */

    //infoWindows.push(infoWindow);
    markers.push(marker);
  }

  // 마커 클릭
  function getClickHandler(i) {
    // 마커 정보 창
    return function (e) {
      let marker = markers[i],
        info = infoWindows[i];

      if (info.getMap()) {
        info.close();
      } else {
        info.open(map, marker);
      }
    };
  }
  /*
	for (let [i, marker] of markers.entries() ) {
		naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i) ); 
	}
	*/
  for (let [i, marker] of markers.entries()) {
    naver.maps.Event.addListener(markers[i], "click", pharmacyView(data[i]));
  }
}
// 약국 상세보기
function pharmacyView(pharmacy) {
  return function () {
    console.log(pharmacy);

    let content = `
    		<table class="pharmacy-view-table">
    			<colgroup>
    				<col style="width:120px">
    				<col>
    			</colgroup>
				<tr>
					<th>약국명</th>
					<td><span>${pharmacy.dutyName}</span></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><span>${pharmacy.dutyAddr}</span></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><span>${pharmacy.dutyTel1}</span></td>
				</tr>
				<tr>
					<th>영업시간</th>
					<td>
						<div class="open-time">
							<ul>
								<li>월요일: ${transRangeTime(pharmacy.dutyTime1s, pharmacy.dutyTime1c, "시분")}</li>
								<li>화요일: ${transRangeTime(pharmacy.dutyTime2s, pharmacy.dutyTime2c, "시분")}</li>
								<li>수요일: ${transRangeTime(pharmacy.dutyTime3s, pharmacy.dutyTime3c, "시분")}</li>
								<li>목요일: ${transRangeTime(pharmacy.dutyTime4s, pharmacy.dutyTime4c, "시분")}</li>
								<li>금요일: ${transRangeTime(pharmacy.dutyTime5s, pharmacy.dutyTime5c, "시분")}</li>
								<li>토요일: ${transRangeTime(pharmacy.dutyTime6s, pharmacy.dutyTime6c, "시분")}</li>
								<li>일요일: ${transRangeTime(pharmacy.dutyTime7s, pharmacy.dutyTime7c, "시분")}</li>
								<li>공휴일: ${transRangeTime(pharmacy.dutyTime8s, pharmacy.dutyTime8c, "시분")}</li>
							</ul>
						</div>
					</td>
				</tr>
			</table>
		`;
    $(".pharmacy-view").children().remove();
    $(".pharmacy-view").append(content);
  };
}

function transRangeTime(t1,t2,fmt) {
	// 900, 1200 등등 변환  
	// fmt : = 09:00 , 12:00, 
	// fmt 시분 = 09시00분, 12시00분
	if( t1 == 0 || t2 == 0 ) return "휴무";
	let start = t1.toString();
	let end = t2.toString();
	let len1 = start.length;
	let len2 = end.length;
	
	if( len1 < 4 ) start = "0" + start;
	if( len2 < 4 ) end = "0" + end;
	
	let hours1 = start.substr(0,2);
	let hours2 = end.substr(0,2);
	let minutes1 = start.substr(2,2);
	let minutes2 = end.substr(2,2);
	
	if( fmt == ":" ) {
		return `${hours1}:${minutes1} ~ ${hours2}:${minutes2}`;
	}else if (fmt == "시분") {
		return `${hours1}시 ${minutes1}분 ~ ${hours2}시 ${minutes2}분`;
	}
}

function openTimeCheck(pharmacy) {
  let d = new Date();
  let day = d.getDay() == 0 ? 7 : d.getDay(); // 0: 일요일 -> 7 변환
  let hours = d.getHours();
  let minutes = d.getMinutes();
  let currentTime = parseInt(hours + "" + minutes);

  let start = pharmacy[`dutyTime${day}s`];
  let end = pharmacy[`dutyTime${day}c`];
  if (start == 0 || end == 0) return false;

  if (start <= currentTime && currentTime <= end) return true;
}

// 마커 중앙 이동
function markerCenter(map, markers) {
  // idle 동작 방지 loadCheck
  loadCheck = false;
  // 마커 중앙 좌표 계산
  var bounds = new naver.maps.LatLngBounds();
  markers.forEach(function (marker) {
    bounds.extend(marker.getPosition());
  });

  // 마커 중앙 좌표로 지도 이동
  map.fitBounds(bounds);
  map.setZoom(16);

  //map.panTo(map.getCenter());
  loadCheck = true;
}
