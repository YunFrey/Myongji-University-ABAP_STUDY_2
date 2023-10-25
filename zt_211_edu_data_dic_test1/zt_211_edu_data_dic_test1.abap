*&---------------------------------------------------------------------*
*& Report ZT_211_EDU_DATA_DIC_TEST1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZT_211_EDU_DATA_DIC_TEST1.

DATA : gs_sflight TYPE sflight.

START-OF-SELECTION.
SELECT SINGLE * FROM sflight INTO gs_sflight WHERE CARRID = 'AA'.

cl_demo_output=>display( gs_sflight ).

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
