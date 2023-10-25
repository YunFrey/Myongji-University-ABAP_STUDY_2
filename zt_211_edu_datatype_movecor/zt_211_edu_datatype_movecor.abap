*&---------------------------------------------------------------------*
*& Report ZT_211_EDU_DATATYPE_MOVECOR
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZT_211_EDU_DATATYPE_MOVECOR.

DATA : BEGIN OF gs_rate,
  col1 TYPE i VALUE 8,
  col2 TYPE i VALUE 10,
END OF gs_rate.

DATA : BEGIN OF gs_mul,
  col1 TYPE i VALUE 95,
  col2 TYPE i VALUE 70,
END OF gs_mul.

MULTIPLY-CORRESPONDING gs_rate BY gs_mul.

cl_demo_output=>display( gs_rate ).

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
