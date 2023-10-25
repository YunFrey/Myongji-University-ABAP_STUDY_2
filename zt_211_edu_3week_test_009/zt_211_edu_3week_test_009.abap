*&---------------------------------------------------------------------*
*& Report ZT_211_EDU_3WEEK_TEST_9
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZT_211_EDU_3WEEK_TEST_009.

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

** 인터널 테이블 읽고 쓰고 지우기
" Key값으로 읽는법 (이름이 다길동인 사람을 읽어오세요)

"중요 : INTERNAL TABLE 생성 시 따로 KEY 를 지정하지 않았으므로
" KEY 칼럼은 c 타입인 칼럼 모두이다. (여기서는 name 만 key 칼럼)

"기존 코드에서 19번째줄을 아래로 변경하여 name 칼럼을 키로 변경함
"DATA gt_itab TYPE TABLE OF gt_line WITH NON-UNIQUE KEY name.

READ TABLE gt_itab WITH TABLE KEY name = '다길동' INTO gs_str.

cl_demo_output=>display( gs_str ).

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
