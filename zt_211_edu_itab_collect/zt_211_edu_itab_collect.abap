*&---------------------------------------------------------------------*
*& Report ZT_211_EDU_ITAB_COLLECT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZT_211_EDU_ITAB_COLLECT.

"키는 carrid 와 connid
TYPES : BEGIN OF gt_str,
  carrid TYPE sflight-carrid,
  connid TYPE sflight-connid,
  seatsmax TYPE sflight-seatsmax,
END OF gt_str.

DATA gt_itab TYPE TABLE OF gt_str WITH NON-UNIQUE KEY carrid connid.
DATA gs_line TYPE gt_str.

SELECT * FROM sflight INTO CORRESPONDING FIELDS OF gs_line.
  COLLECT gs_line INTO gt_itab.
ENDSELECT.

cl_demo_output=>display( gt_itab ).

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
