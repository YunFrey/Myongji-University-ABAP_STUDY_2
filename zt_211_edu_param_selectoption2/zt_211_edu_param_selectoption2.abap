*&---------------------------------------------------------------------*
*& Report ZT_211_EDU_PARAM_SELECTOPTION2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZT_211_EDU_PARAM_SELECTOPTION2.

*************변수 선언**************

TABLES : sflight.

"Parameter 용 변수
PARAMETERS : p_carrid LIKE sflight-carrid LENGTH 4 DEFAULT 'AA'.
SELECT-OPTIONS: s_carrid FOR sflight-carrid.
RANGES : r_carrid FOR sflight-carrid.

*인터널 테이블과 구조체 생성
DATA : gt_sflight TYPE TABLE OF sflight.
DATA : gs_wa TYPE sflight.



*********************************
INITIALIZATION.
  "SELECT-OPTIONS 초기값 세팅
  s_carrid-sign = 'I'.
  s_carrid-option = 'EQ'.
  s_carrid-low = 'AA'.
  s_carrid-high = 'CC'.
  "구조체를 인터널 테이블에 추가하고 구조체 클리어
  APPEND s_carrid.
  CLEAR s_carrid.

  "RANGES 초기값 세팅
  r_carrid-sign = 'I'.
  r_carrid-option = 'BT'.
  r_carrid-low = 'AA'. "AA와 같은 걸 포함하게 세팅
  r_carrid-high = 'ZZ'.
  "구조체를 인터널 테이블에 추가하고 구조체 클리어S
  APPEND r_carrid.
  CLEAR r_carrid.

  SELECTION-SCREEN BEGIN OF BLOCK b00 WITH FRAME TITLE TEXT-010.

    "여기에 조건 입력 화면이 나왔을때 처리할 구문 넣게 됨

  SELECTION-SCREEN END OF BLOCK b00.



START-OF-SELECTION.

  SELECT * FROM sflight INTO gs_wa WHERE carrid IN s_carrid .
    INSERT gs_wa INTO TABLE gt_sflight.
  ENDSELECT.


END-OF-SELECTION.

 LOOP AT gt_sflight INTO gs_wa.
   WRITE : / gs_wa-carrid, gs_wa-connid .
 ENDLOOP.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
