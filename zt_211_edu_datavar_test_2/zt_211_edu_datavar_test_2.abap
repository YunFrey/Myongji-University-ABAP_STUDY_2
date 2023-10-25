*&---------------------------------------------------------------------*
*& Report ZT_211_EDU_DATAVAR_TEST_2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZT_211_EDU_DATAVAR_TEST_2.

DATA : BEGIN OF gs_sflight,
  carrid TYPE sflight-carrid,
  connid TYPE sflight-connid,
  fldate TYPE sflight-fldate,
  END OF gs_sflight.

cl_demo_output=>display( gs_sflight ).

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
