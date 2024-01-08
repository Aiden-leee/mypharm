## MYPHARM (약국,의약품 정보 프로젝트)

### 1. 약국찾기 ( 공공데이터 open api 약국 데이터 활용 ) 
네이버 지도 api 활용 <br />
지역 선택 검색 기능 (행정구역 데이터 활용) <br />
화면 중심으로 주변 약국 데이터 마커 출력 <br />
마커 클릭시 약국 상세 정보  <br />
약국 영업중 영업종료 상태 구분 마커 출력   <br /> <br />

### 2. 커뮤니티 - 공지사항
공지사항 관리자 전용 글쓰기 기능 ( 스프링 시큐리티 활용 ) <br />
공지사항 댓글 추가, 수정, 삭제, 목록조회 기능 (RESTful ajax 처리) <br />
공지사항 게시글 회원만 댓글 작성 기능 ( 스프링 시큐리티 활용 ) <br /> <br />

### 3. 로그인, 회원가입 
스프링 시큐리티 회원가입, 로그인 기능  <br />
다음주소 api 주소 검색 <br /> <br />

<hr /> 

### DB 테이블 목록
[ dong ] -행정구역 지역 데이터 <br />
[ pharmacy ] - 약국 데이터  <br />
[ notice ] - 공지사항 글 데이터 <br />
[ notice_reply ] - 공지사항의 댓글 데이터 <br />
[ medicine ] - 의약품 데이터 <br />
[ members ] - 회원 데이터 <br /> <br />




<hr />
### 추가 및 변경  
- java version 11 변경  <br />
- spring framework version 5.0.7.RELEASE 변경 <br />
- javax.servlet-api 3.1.0 변경  <br />
- lombok 1.18.28 추가  <br />
- log4jdbc.log4j2.properties 추가 <br />
- mybatis-spring <br />
- HikariCP 등 db 관련 추가  <br />
- springSecurityFilterChain 추가  <br />
- web.xml ContextLoaderListener 설정 /WEB-INF/spring/security-context.xml <br />