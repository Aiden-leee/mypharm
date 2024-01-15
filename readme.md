## MYPHARM (약국,의약품 정보 프로젝트)


URL: http://ec2-54-180-88-17.ap-northeast-2.compute.amazonaws.com/

## 환경 설정

#### Tools  <br />
STS3.9.18 <br />
sql developer or DBeaver <br />
Postman <br />
AWS EC2, RDS mysql <br />

#### 라이브러리 버전<br />
Java 11<br />
Spring 5.0.7 <br />
servlet 3.1.0  <br />
tiles 3.0.8 <br />
json-simple 1.1.1 <br />
jackson-databind 2.13.0 <br />
mysql-connector-java 8.0.33 <br />
HikariCP 5.0.1 <br />
mybatis 3.4.6 <br />
mybatis-spring 1.3.2 <br />
lombok 1.18.28 <br />
spring-security-web 5.0.7 <br /> <br />

### 1. 약국찾기 ( 공공데이터 open api 약국 데이터 활용 ) 
네이버 지도 api 활용 <br />
지역 선택 검색 기능 (행정구역 데이터 활용) <br />
화면 중심으로 주변 약국 데이터 마커 출력 <br />
마커 클릭시 약국 상세 정보  <br />
약국 영업중 영업종료 상태 구분 마커 출력   <br /> <br />


#### 약국 지도 조회 (영상 2배속 재생 권장)

https://github.com/Aiden-leee/mypharm/assets/52125590/2214aca2-ac3f-4096-a606-55575e71875c

 <br />

### 2. 의약품 찾기 ( 공공데이터 open api 식품안전처 데이터 활용 )
의약품 목록 조회 , 페이징 처리 <br>
의약품 상세보기<br>
의약품명 검색 기능 <br> <br />



https://github.com/Aiden-leee/mypharm/assets/52125590/f58e5777-a575-4434-8f76-8774606b653c

<br/>

### 2. 커뮤니티 - 공지사항
공지사항 관리자 전용 글쓰기 기능 ( 스프링 시큐리티 활용 ) <br />
공지사항 댓글 추가, 수정, 삭제, 목록조회 기능 (RESTful ajax 처리) <br />
공지사항 게시글 회원만 댓글 작성 기능 ( 스프링 시큐리티 활용 ) <br /> <br />

#### 글쓰기

https://github.com/Aiden-leee/mypharm/assets/52125590/518f8aa7-d56c-4822-bee3-3c3f4638492a

#### 댓글등록

https://github.com/Aiden-leee/mypharm/assets/52125590/d4009497-5375-4cf9-b39b-3aa3e3ea2773

#### 댓글 수정 삭제

https://github.com/Aiden-leee/mypharm/assets/52125590/0b0eb45f-4ef8-4c71-9dbb-48fd753ce9a3



<br/>
 <br />
 
### 3. 로그인, 회원가입 
스프링 시큐리티 회원가입, 로그인 기능  <br />
다음주소 api 주소 검색 <br /> <br />


#### 회원가입 


https://github.com/Aiden-leee/mypharm/assets/52125590/c60631a4-6864-4050-9f10-b4a48f141b7c



<hr /> 

### DB 테이블 목록
[ dong ] -행정구역 지역 데이터 <br />
[ pharmacy ] - 약국 데이터  <br />
[ notice ] - 공지사항 글 데이터 <br />
[ notice_reply ] - 공지사항의 댓글 데이터 <br />
[ medicine ] - 의약품 데이터 <br />
[ members ] - 회원 데이터 <br /> <br />
[ members_authorities ] <br /><br />

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
