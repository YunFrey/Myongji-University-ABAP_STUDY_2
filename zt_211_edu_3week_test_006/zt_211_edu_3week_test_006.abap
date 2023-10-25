*&---------------------------------------------------------------------*
*& Report ZT_211_EDU_3WEEK_TEST_6
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZT_211_EDU_3WEEK_TEST_006.

DATA gv_num(8) TYPE c VALUE '60170029'.
DATA gv_name TYPE string VALUE 'Lee Jongun'.
DATA gv_row TYPE p.

TYPES : BEGIN OF gt_line,
  row LIKE gv_row,
  name LIKE gv_name,
  num LIKE gv_num,
END OF gt_line.

DATA gs_str TYPE gt_line.
DATA gt_itab TYPE TABLE OF gt_line.

** 인터널 테이블에 값 담기
*- 인터널 테이블은 스트럭처을 통해서 핸들링 하게 돼요 !!!
"- APPEND문을 사용하여 4명의 정보를 담으세요. (가길동 나길동 다길동 라길동)


gs_str-row = 0.
gs_str-name = '가길동'.
gs_str-num = '60203301'.

APPEND gs_str TO gt_itab.
CLEAR gs_str. "APPENd 이후에 비워주기

gs_str-row = 0.
gs_str-name = '나길동'.
gs_str-num = '60203302'.

APPEND gs_str TO gt_itab.
CLEAR gs_str. "APPENd 이후에 비워주기

gs_str-row = 0.
gs_str-name = '다길동'.
gs_str-num = '60203303'.

APPEND gs_str TO gt_itab.
CLEAR gs_str. "APPENd 이후에 비워주기

gs_str-row = 0.
gs_str-name = '라길동'.
gs_str-num = '60203304'.

APPEND gs_str TO gt_itab.
CLEAR gs_str. "APPENd 이후에 비워주기

cl_demo_output=>display( gt_itab ).

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
