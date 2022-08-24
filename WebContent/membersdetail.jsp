<%@page import="db.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

 <style>
    .overlay_info {border-radius: 6px; margin-bottom: 12px; float:left;position: relative; border: 1px solid #ccc; border-bottom: 2px solid #ddd;background-color:#fff;}
    .overlay_info:nth-of-type(n) {border:0; box-shadow: 0px 1px 2px #888;}
    .overlay_info a {display: block; background: #d95050; background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center; text-decoration: none; color: #fff; padding:12px 36px 12px 14px; font-size: 14px; border-radius: 6px 6px 0 0}
    .overlay_info a strong {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_icon.png) no-repeat; padding-left: 27px;}
    .overlay_info .desc {padding:14px;position: relative; min-width: 190px; height: 56px}
    .overlay_info img {vertical-align: top;}
    .overlay_info .address {font-size: 12px; color: #333; position: absolute; left: 80px; right: 14px; top: 24px; white-space: normal}
    .overlay_info:after {content:'';position: absolute; margin-left: -11px; left: 50%; bottom: -12px; width: 22px; height: 12px; background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png) no-repeat 0 bottom;}
</style>



<meta charset="UTF-8">
<title>회원관리</title>

<%@ include file="header.jsp" %>
<%
mname = (String)session.getAttribute("mname"); 

if(mname == null){
	out.println("<script>alert('로그인이 필요합니다.');</script>");
	out.println("<script>location.href='login.jsp'</script>");
}

	String no = request.getParameter("no");

	DTOmember member = DAOmember.memberDetail(no);
	
	String img1 = member.getMiname();
	String imgstr1 = "";
	if(img1 !=null) {
		imgstr1 = "images/" + img1;
	}
	
	
%>


   
</head>
<body>




<h3>파일 목록</h3>

<div class="container">
<div class="row" align="center">

<table class="table table-hover">
  <thead>
  
    <tr>
      <th scope="col">회원번호</th>
      <th><%=member.getMno()%></th>
      </tr>
      <tr>
      <th scope="col">이름</th>
      <th><%=member.getMname()%></th>
       </tr>
       <tr>
      <th scope="col">회원사진</th>
      <th><img src="<%=imgstr1 %>" class="d-block w-50 h-50" alt="..."></th>
       </tr>
      <tr>
      <th scope="col">전화번호</th>
      <th><%=member.getMtel()%></th>
       </tr>
      <tr>
      <th scope="col">이메일</th>
      <th><%=member.getMemail()%></th>
       </tr>
      <tr>
      <th scope="col">성별</th>
      <th><%=member.getMgender()%></th>
       </tr>
      <tr>
      <th scope="col">주소</th>
      
      <th>
      <div id="map" style="width:100%;height:350px;"></div>
	<div id="roadview" style="width:100%;height:300px"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac10446de9c5b1018c16a8217bca773c&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapCenter = new kakao.maps.LatLng(33.5563, 126.7958), // 지도의 중심좌표
    mapOption = {
        center: mapCenter, // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption);

var geocoder = new kakao.maps.services.Geocoder();


//주소로 좌표를 검색합니다
geocoder.addressSearch('<%=member.getMaddr()%>', function(result, status) {

 // 정상적으로 검색이 완료됐으면 
  if (status === kakao.maps.services.Status.OK) {

     var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

     // 결과값으로 받은 위치를 마커로 표시합니다
     var marker = new kakao.maps.Marker({
         map: map,
         position: coords
         
         
     });
     
     map.setCenter(coords);
  
     rvClient.getNearestPanoId(coords, 50, function(panoId) {
    	    rv.setPanoId(panoId, coords); //panoId와 중심좌표를 통해 로드뷰 실행
    	});
}
});

<%--  
// 커스텀 오버레이에 표시할 내용입니다
// HTML 문자열 또는 Dom Element 입니다
var content = '<div class="overlay_info">';
content += '    <a href="https://place.map.kakao.com/17600274" target="_blank"><strong><%=member.getMname()%></strong></a>';
content += '    <div class="desc">';
content += '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">';
content += '        <span class="address"><%=member.getMaddr()%></span>';
content += '    </div>';
content += '</div>';

// 커스텀 오버레이가 표시될 위치입니다 
 var position = new kakao.maps.LatLng(33.5563, 126.7958);


// 커스텀 오버레이를 생성합니다
var mapCustomOverlay = new kakao.maps.CustomOverlay({
    position: position,
    content: content,
    xAnchor: 0.5, // 커스텀 오버레이의 x축 위치입니다. 1에 가까울수록 왼쪽에 위치합니다. 기본값은 0.5 입니다
    yAnchor: 1.1 // 커스텀 오버레이의 y축 위치입니다. 1에 가까울수록 위쪽에 위치합니다. 기본값은 0.5 입니다
});

// 커스텀 오버레이를 지도에 표시합니다
mapCustomOverlay.setMap(map);

var rvContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
var rv = new kakao.maps.Roadview(rvContainer); //로드뷰 객체
var rvClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체

/* //지도의 중심좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
rvClient.getNearestPanoId(mapCenter, 50, function(panoId) {
    rv.setPanoId(panoId, mapCenter); //panoId와 중심좌표를 통해 로드뷰 실행
});
 */
kakao.maps.event.addListener(rv, 'init', function() {

    // 커스텀 오버레이를 생성합니다
    var rvCustomOverlay = new kakao.maps.CustomOverlay({
        position: position,
        content: content,
        xAnchor: 0.5, // 커스텀 오버레이의 x축 위치입니다. 1에 가까울수록 왼쪽에 위치합니다. 기본값은 0.5 입니다
        yAnchor: 0.5 // 커스텀 오버레이의 y축 위치입니다. 1에 가까울수록 위쪽에 위치합니다. 기본값은 0.5 입니다
    });

    //rvCustomOverlay.setAltitude(2); //커스텀 오버레이의 고도값을 설정합니다.(로드뷰 화면 중앙이 0입니다)
    rvCustomOverlay.setMap(rv);

    var projection = rv.getProjection(); // viewpoint(화면좌표)값을 추출할 수 있는 projection 객체를 가져옵니다.
    
    // 커스텀오버레이의 position과 altitude값을 통해 viewpoint값(화면좌표)를 추출합니다.
    var viewpoint = projection.viewpointFromCoords(rvCustomOverlay.getPosition(), rvCustomOverlay.getAltitude());

    rv.setViewpoint(viewpoint); //커스텀 오버레이를 로드뷰의 가운데에 오도록 로드뷰의 시점을 변화 시킵니다.
});
 --%>
</script>
      
         
      </th>
 
       </tr>
      <tr>
      <th scope="col">회원등급</th>
      <th><%=member.getMlevel()%></th>
       </tr>
      <tr>
      <th scope="col">가입날짜</th>
      <th><%=member.getMdate()%></th>
    </tr>
  </thead>
	 
    
</table>


</div>
</div>

 <%@ include file="footer.jsp" %>
</body>
</html>