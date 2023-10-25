*&---------------------------------------------------------------------*
*& Report ZT_211_EDU_3WEEK_TEST_5
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZT_211_EDU_3WEEK_TEST_005.

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

gs_str-row = 1.
gs_str-name = 'Kim Minsu'.
gs_str-num = '60203302'.

cl_demo_output=>display( gs_str ).

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
