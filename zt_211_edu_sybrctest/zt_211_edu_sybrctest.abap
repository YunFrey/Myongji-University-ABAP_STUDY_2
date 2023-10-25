*&---------------------------------------------------------------------*
*& Report ZT_211_EDU_SYBRCTEST
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZT_211_EDU_SYBRCTEST.

"입력값을 받는 p_id 생성
PARAMETERS p_carrid TYPE c LENGTH 2.
"결과값을 받는 c 타입의 lv_res 생성
DATA lv_res TYPE c.
"SQL문 생성
SELECT SINGLE CARRID
  FROM sflight
  INTO lv_res
  WHERE CARRID = p_carrid.

"시스템변수로 IF문 분기점
IF SY-SUBRC > 0.
  WRITE '뭔가 문제가 생김'.
ELSE.
  WRITE '문제없음'.
ENDIF.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
