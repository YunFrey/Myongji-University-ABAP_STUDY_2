*&---------------------------------------------------------------------*
*& Report ZT_211_EDU_PARAM_SELECTOPTION
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZT_211_EDU_PARAM_SELECTOPTION.

*************변수 선언**************

" 테이블 및 구조체 선언
DATA : gt_sflight TYPE TABLE OF sflight,
      gs_sflight TYPE sflight.

"Parameter 용 변수
PARAMETERS : p_carrid LIKE gs_sflight-carrid LENGTH 4 DEFAULT 'AA'.
SELECT-OPTIONS: s_carrid FOR gs_sflight-carrid.
RANGES : r_carrid FOR gs_sflight-carrid.



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

START-OF-SELECTION.
  "여기서 SELECT 문 실행

END-OF-SELECTION.
 "여기서 읽은 데이터 출력

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
