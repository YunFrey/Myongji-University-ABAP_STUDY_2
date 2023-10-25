*&---------------------------------------------------------------------*
*& Report ZT_211_EDU_ITAB_MODIFY_MULTI
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZT_211_EDU_ITAB_MODIFY_MULTI.

DATA: BEGIN OF gs_line,
  col1 TYPE c,
  col2 TYPE i,
END OF gs_line.

DATA gt_itab LIKE TABLE OF gs_line WITH NON-UNIQUE KEY col1.

gs_line-col1 = 'A'.
gs_line-col2 = 50.
INSERT gs_line INTO TABLE gt_itab.

gs_line-col1 = 'B'.
gs_line-col2 = 25.
INSERT gs_line INTO TABLE gt_itab.

gs_line-col1 = 'B'.
gs_line-col2 = 40.
INSERT gs_line INTO TABLE gt_itab.

LOOP AT gt_itab INTO gs_line.
  gs_line-col1 = 'B'.
  gs_line-col2 = 30.
  MODIFY gt_itab FROM gs_line TRANSPORTING col2 WHERE col1 = 'B'.
ENDLOOP.

cl_demo_output=>display( gt_itab ).

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
