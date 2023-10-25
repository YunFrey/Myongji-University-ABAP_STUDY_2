*&---------------------------------------------------------------------*
*& Report ZT_211_EDU_3WEEK_TEST_11
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZT_211_EDU_3WEEK_TEST_011.

DATA gv_num(8) TYPE c VALUE '60170029'.
DATA gv_name TYPE string VALUE 'Lee Jongun'.
DATA gv_row TYPE p.

TYPES : BEGIN OF gt_line,
  row LIKE gv_row,
  name LIKE gv_name,
  num LIKE gv_num,
END OF gt_line.

DATA gs_str TYPE gt_line.
DATA gt_itab TYPE TABLE OF gt_line WITH NON-UNIQUE KEY name.

gs_str-row = 1.
gs_str-name = '가길동'.
gs_str-num = '60203301'.

APPEND gs_str TO gt_itab.
CLEAR gs_str. "APPENd 이후에 비워주기

gs_str-row = 2.
gs_str-name = '나길동'.
gs_str-num = '60203302'.

APPEND gs_str TO gt_itab.
CLEAR gs_str. "APPENd 이후에 비워주기

gs_str-row = 3.
gs_str-name = '다길동'.
gs_str-num = '60203303'.

APPEND gs_str TO gt_itab.
CLEAR gs_str. "APPENd 이후에 비워주기

gs_str-row = 0.
gs_str-name = '라길동'.
gs_str-num = '60203304'.

APPEND gs_str TO gt_itab.
CLEAR gs_str. "APPENd 이후에 비워주기

gs_str-row = 0.
gs_str-name = '나는 세번째 길동이가 될 거야'.
gs_str-num = '60203430'.
INSERT gs_str INTO gt_itab INDEX 3.
CLEAR gs_str. "APPENd 이후에 비워주기

*--------------------------------------------------------------------*
* 현재 채번이 제대로 되지 않은 상태이므로 새로 채번을 해줄거에요.
* 기존 인터널 테이블에서 수정하지 않고 새로운 테이블에 담아서 수정하도록 합니다.
*--------------------------------------------------------------------*
** "여러 줄"을 읽어서 다른 인터널 테이블에 담고 싶다면? (직접 선언하세요)
* 맨 첫번째 행부터 맨 마지막 행까지 ITAB에 있는 데이터를 스트럭처에 계속 옮겨 담습니다.
*--------------------------------------------------------------------*

DATA gt_itab2 LIKE gt_itab.
DATA gs_line2 LIKE LINE OF gt_itab.

MOVE gt_itab TO gt_itab2.

*--------------------------------------------------------------------*
** sy-tabix를 이용하여 gv_row가 행의 순서대로 채번되도록 LOOP문을 만드세요.
*sy-tabix : 인터널 테이블에 대한 작업(읽기나 변경) 이 있었을 경우 그 해당 행을 반환해요
*(1행 -> 1, 2행 -> 2)
*--------------------------------------------------------------------*

LOOP AT gt_itab2 INTO gs_line2.
  gs_line2-row = sy-tabix.
  MODIFY TABLE gt_itab2 FROM gs_line2 TRANSPORTING row.
ENDLOOP.

cl_demo_output=>display( gt_itab2 ).

"굳이 gv_tabix 쓴다면?

DATA gv_tabix TYPE sy-tabix.

LOOP AT gt_itab2 INTO gs_line2.
  gv_tabix = sy-tabix.
  gs_line2-row = gv_tabix.
  MODIFY TABLE gt_itab2 FROM gs_line2 TRANSPORTING row.
ENDLOOP.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
