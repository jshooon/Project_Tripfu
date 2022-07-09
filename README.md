# Project_Tripfu 개인프로젝트

## 여행 플랫폼 웹사이트 Tripfu
OS : Windows 10   
Languages : Java, HTML, CSS, JS, jQuery, SQL   
Framework : Spring boot Framework   
Database : MySQL   
Tools : Eclipse
API : Kakaomap, OpenWeather
### 주요기능 및 보안사항.
* 주요기능
 1. 회원가입
     - email 중복체크 유효성 검사기능.
     - 모든항목 정규식 적용기능.
 2. 로그인/로그아웃
     - email/password 정규식 적용기능.
     - 로그아웃시 세션 값 삭제기능.
 3. 프로모션배너, 상품 전시
     - 프로모션배너 캐러셀 슬라이더 이미지3개 클릭시 상품예약 페이지 전환기능.
     - 상품 찜하기 버튼기능
     - 상품 예약 버튼기능
 4. 상품 상세정보
     - 여행 유형별 인원선택 기능. (패키지만 예약 가능인원 표시 예약 가능인원 초과시 알람창 후 초기화)
     - 인원선택시 총 예약금액 출력 기능.
     - 여행지 위치 지도출력 기능.
 5. 상품검색 및 여행유형별 조회
     - 패키지/자유 버튼 클릭시 여행유형에 맞는 상품 출력기능.
     - 지역 키워드 입력시 키워드에 맞는 상품 출력기능.
 6. Mypage
    * 메인화면 찜/예약/1:1문의내역 건수 정보
      - 각 건수가 몇개인지 표시되며, 각 항목별 페이지 전환 기능.
    * 개인정보수정
      - 휴대폰 번호 중복확인 후 변경 기능.
      - 회원 탈퇴 기능.
    * 찜목록
      - 찜 했던 목록 출력기능.
      - 찜한 상품 예약페이지 전환 기능.
    * 예약내역조회
      - 예약했던 상품 목록보기 기능.
      - 예약정보 상세보기(예약취소)기능. 
      - 페이지네이션 기능.
    * 1:1문의내역
      - 1:1 문의한 내역 목록보기 기능.
      - 1:1문의하기(파일업로드)기능.
      - 문의내역 상세보기(파일다운로드 / 수정 / 삭제) 기능.
      - 페이지네이션 기능.
 7. adminPage
    * 여행 유형별 상품등록 기능.
    * 상품 전시
      - 수정하기 버튼 기능.
      - 삭제하기 버튼 기능.
    * 고객관리 페이지
      - 회원정보목록 보기 기능.
        - 회원정보 삭제하기 버튼기능.
        - 페이지네이션 기능.
      - 회원예약목록 보기 기능.
        - 전 회원 예약목록 상세보기(예약취소) 기능.
      - 회원문의목록 보기 기능.
        - 전 회원 문의 상세보기(문의내용에 대한 답변달기, 답변수정, 회원문의내용삭제) 기능.
        - 페이지네이션 기능.

* 보안사항
 1. 지역별 날씨현황 (미완성)
      - 현재 서울날씨만 나옴.
      - 개선사항 4~5일기준 날씨 정보.
      - 지역 검색시 지역 날씨 현황 검색기능.

 2. 상품 상세정보 지도 마커 및 정보기능.
      - 현재 지역 시청 쪽 출력됨.

 3. CSS 및 UI화면 태그 위치

 4. adminPage 회원 정보, 예약, 문의 목록 검색 기능.

 5. 결제 시스템
