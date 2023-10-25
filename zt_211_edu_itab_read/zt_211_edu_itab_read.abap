*&---------------------------------------------------------------------*
*& Report ZT_211_EDU_ITAB_READ
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZT_211_EDU_ITAB_READ.

"인터널 테이블 선언
DATA gt_itab TYPE TABLE OF sflight.
DATA gs_wa TYPE sflight.

"테이블에 sflight 데이터 넣기

SELECT * FROM sflight INTO gs_wa.
  INSERT gs_wa INTO TABLE gt_itab.
ENDSELECT.

"READ 한 데이터를 받을 구조체 선언
DATA gs_str TYPE sflight.

"READ문 실행
READ TABLE gt_itab INDEX 2 INTO gs_str.

cl_demo_output=>display( gs_str ).

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
