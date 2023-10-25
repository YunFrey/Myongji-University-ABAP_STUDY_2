*&---------------------------------------------------------------------*
*& Report ZT_211_EDU_ITAB_TEST1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZT_211_EDU_ITAB_TEST1.

DATA gt_sflight TYPE STANDARD TABLE OF sflight.
DATA gs_sflight TYPE sflight.

gs_sflight-carrid = 'FF'.
gs_sflight-connid = 0112.

INSERT gs_sflight INTO TABLE gt_sflight.
cl_demo_output=>display( gt_sflight ).

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
