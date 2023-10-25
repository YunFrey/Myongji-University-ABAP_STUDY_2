*&---------------------------------------------------------------------*
*& Report ZT_211_EDU_DATAVAR_TEST
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZT_211_EDU_DATAVAR_TEST.

DATA : BEGIN OF gs_str,
  id TYPE i,
  name TYPE c,
  grade TYPE c,
  END OF gs_str.

gs_str-id = 60229394.
gs_str-name = 'Jong'.
gs_Str-grade = 'A'.

cl_demo_output=>display( gs_str ).

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
