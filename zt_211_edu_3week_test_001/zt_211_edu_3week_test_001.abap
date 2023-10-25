*&---------------------------------------------------------------------*
*& Report ZT_211_EDU_3WEEK_TEST_1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZT_211_EDU_3WEEK_TEST_001.

DATA gv_num(8) TYPE c VALUE '60170029'.
DATA gv_name TYPE string VALUE 'Lee Jongun'.

cl_demo_output=>display( gv_num ).
cl_demo_output=>display( gv_name ).

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
