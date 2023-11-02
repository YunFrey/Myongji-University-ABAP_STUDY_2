*&---------------------------------------------------------------------*
*& Report ZT_211_FLIGHT_SORTED_KIMMINJI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZT_211_FLIGHT_SORTED_KIMMINJI.

* SELECT-OPTIONS 를 쓰려면 sflight 테이블을 가져와야해요 먼저!
TABLES sflight.

* sflight 테이블의 필드로 선택범위를 만들어요
SELECT-OPTIONS : r_carrid FOR sflight-carrid.
SELECT-OPTIONS : r_fldate FOR sflight-fldate.

*결과값을 받을 구조체를 만들어요
TYPES : BEGIN OF t_res,
  carrid TYPE sflight-carrid,
  connid TYPE sflight-connid,
  carrname TYPE scarr-carrname,
  fldate TYPE sflight-fldate,
  cityfrom TYPE spfli-cityfrom,
  cityto TYPE spfli-cityto,
  distance TYPE spfli-distance,
  END OF t_res.

*결과 담을 인터널 테이블이에요, SORTED 되어있기에 넣자마자 정렬됩니다.
DATA gt_res TYPE SORTED TABLE OF t_res WITH UNIQUE KEY carrid connid.
*결과 담을 구조체
DATA gs_res TYPE t_res.

*이걸 하는 방법은 3가지가 있어요
*방법 1 ) INNER JOIN 두번쓰기
*방법 2 ) SELECT문으로 전체 다 불러와서 LOOP문
*방법 3 ) SELECT...ENDSELECT문 안에 중첩 SELECT문사용
*우리는 방법 1이 가장 쉬워서 방법 1을 배울거에요

SELECT A~carrid A~connid B~carrname A~fldate C~cityfrom C~CITYTO C~DISTANCE
  INTO CORRESPONDING FIELDS OF gs_res
  FROM sflight AS A
  INNER JOIN scarr AS B ON A~carrid EQ B~carrid
  INNER JOIN spfli AS C ON A~carrid EQ C~carrid AND A~connid EQ C~connid.

  "gt_res 에 들어가면서 carrid connid KEY 기준으로 자동 정렬된다.
  INSERT gs_res INTO TABLE gt_res.
  CLEAR gs_res.

  ENDSELECT.

cl_demo_output=>display_data( gt_res ).

*---------------------------------------------------------------------*
**2-2. 비행 거리가 가장 짧은 항공편만 보여주세요(단위가 마일인 경우 키로미터로 환산하세요 *직접 계산 , 소수점 버림)
*---------------------------------------------------------------------*

DATA gt_res2 TYPE TABLE OF t_res.
DATA gs_res2 TYPE t_res.
"기존 테이블을 신규 테이블로 옮기기
MOVE gt_res[] TO gt_res2[].

"신규 테이블을 정렬
SORT gt_res2 BY DISTANCE.
READ TABLE gt_res2 INDEX 1 INTO gs_res2 TRANSPORTING distance.

*단위 환산 ( Mile to Kilo)
DATA convert_mile_to_kilo TYPE p VALUE '1.609344'.
MULTIPLY gs_res2-distance BY convert_mile_to_kilo.

cl_demo_output=>display_data( gs_res2 ).

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
