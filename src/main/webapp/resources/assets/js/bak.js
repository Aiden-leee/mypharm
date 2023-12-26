// naver map
function clustering() {
	// cluster marker
	/**/
	let cluster1 = {
        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(https://navermaps.github.io/maps.js.ncp/docs/img/cluster-marker-1.png);background-size:contain;"></div>',
        size: N.Size(40, 40),
        anchor: N.Point(20, 20)
    }, 
    cluster2 = {
        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(https://navermaps.github.io/maps.js.ncp/docs/img/cluster-marker-2.png);background-size:contain;"></div>',
        size: N.Size(40, 40),
        anchor: N.Point(20, 20)
    },
    cluster3 = {
        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(https://navermaps.github.io/maps.js.ncp/docs/img/cluster-marker-3.png);background-size:contain;"></div>',
        size: N.Size(40, 40),
        anchor: N.Point(20, 20)
    },
    cluster4 = {
        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(https://navermaps.github.io/maps.js.ncp/docs/img/cluster-marker-4.png);background-size:contain;"></div>',
        size: N.Size(40, 40),
        anchor: N.Point(20, 20)
    },
    cluster5 = {
        content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(https://navermaps.github.io/maps.js.ncp/docs/img/cluster-marker-5.png);background-size:contain;"></div>',
        size: N.Size(40, 40),
        anchor: N.Point(20, 20)
    };
    
    /**/
	var markerClustering = new MarkerClustering({
        minClusterSize: 2,
        maxZoom: 14,
        map: map,
        markers: markers,
        disableClickZoom: false,
        gridSize: 120,
        icons: [cluster1,cluster2,cluster3,cluster4,cluster5],
        indexGenerator: [10, 30, 50, 100, 200],
        stylingFunction: function(clusterMarker, count) {
            $(clusterMarker.getElement()).find('div:first-child').text(count);
        }
    });
}

function markerCenter(map, markers) {
	/*   */
	// 마커 중앙 좌표 계산
    var bounds = new naver.maps.LatLngBounds();
    markers.forEach(function(marker) {
        bounds.extend(marker.getPosition());
    });
	
    // 마커 중앙 좌표로 지도 이동
    //map.fitBounds(bounds);
    //map.setZoom(17);
 
    
    //map.panTo(map.getCenter());
}

function initMap(lat,lng, data) {
	
	var mapOptions = {
	    center: new naver.maps.LatLng(lat, lng),
	    mapTypeControl: false,
        mapTypeControlOptions: {
            style: naver.maps.MapTypeControlStyle.BUTTON,
            position: naver.maps.Position.TOP_RIGHT
        },
	    scaleControl: false,
        logoControl: false,
        mapDataControl: false,
        zoomControl: true,
        //minZoom: 7,
	    zoom: 17
	};
	
	
	var map = new naver.maps.Map('map', mapOptions);
	 
	if( data == null || data.length < 1 ) return;
	
	let markers = [];
	let infoWindows = [];
	
	for(let pharm of data) {
		
		var marker = new naver.maps.Marker({
		    position: new naver.maps.LatLng(pharm.wgs84Lat, pharm.wgs84Lon),
		    map: map
		});
		
		var infoWindow = new naver.maps.InfoWindow({
	        content: `<div style="width:150px;text-align:center;padding:10px;">${pharm.dutyName}</div>`
	    });
		
		infoWindows.push(infoWindow);
		markers.push(marker);
	}
	
	// drag
	/**/
	let timer = null;
	
	naver.maps.Event.addListener(map, 'bounds_changed', function(e){
		if(timer) {
			clearTimeout(timer);
		}
		/**/
		let latlng = {lat: map.getCenter()._lat, lng: map.getCenter()._lng };
		timer = setTimeout(function(){
			pharmService.selectPharm(latlng.lat, latlng.lng,function(result){
				
				initMap(latlng.lat, latlng.lng, result);
			})
		},300);
		
		
	});
	
	naver.maps.Event.addListener(map, 'drag', function(e) {
	/*
		for(let p of markers) {
			p.setMap(null);
			p = null;		
		}
	*/	
		//clearTimeout(timer);
	})
	naver.maps.Event.addListener(map, 'dragend', function(e) {
		
		//let latlng = {lat: map.getCenter()._lat, lng: map.getCenter()._lng };
		/*
		timer = setTimeout(function(){
			pharmService.selectPharm(latlng.lat, latlng.lng,function(result){
				
				initMap(latlng.lat, latlng.lng, result);
			})
		},0);
		*/
		
    	/*
		for(let i=0; i<markers.length; i++) {
			markers[i].setMap(null);		
		}
		*/
	});
	
	//markerCenter(map, markers);
	
	
	// 마커 클릭 
	function getClickHandler(i) {
		// 마커 정보 창 
		return function(e) {
			var marker = markers[i], 
				info = infoWindows[i];
			
		    if (info.getMap()) {
		    		info.close();
		    } else {
		    		info.open(map, marker);
		    }
		}
	}
	
	 for (let [i, marker] of markers.entries() ) {
		naver.maps.Event.addListener(markers[i], 'click', getClickHandler(i)); 
	  }
  	/*
    // 지도 보이는 영역만 마커 보이기 
 	naver.maps.Event.addListener(map, 'idle', function() {
    	updateMarkers(map, markers);
	});

	function updateMarkers(map, markers) {
	
	    var mapBounds = map.getBounds();
	    var marker, position;
	
	    for (var i = 0; i < markers.length; i++) {
	
	        marker = markers[i]
	        position = marker.getPosition();
	
	        if (mapBounds.hasLatLng(position)) {
	            showMarker(map, marker);
	        } else {
	            hideMarker(map, marker);
	        }
	    }
	}
	
	function showMarker(map, marker) {
	
	    if (marker.getMap()) return;
	    marker.setMap(map);
	}
	
	function hideMarker(map, marker) {
	
	    if (!marker.getMap()) return;
	    marker.setMap(null);
	}
 	  */
}