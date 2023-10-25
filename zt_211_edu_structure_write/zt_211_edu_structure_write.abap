*&---------------------------------------------------------------------*
*& Report ZT_211_EDU_STRUCTURE_WRITE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZT_211_EDU_STRUCTURE_WRITE.

DATA : BEGIN OF s_str,
  col1 TYPE c VALUE 'a',
  col2 TYPE c VALUE 'b',
  col3 TYPE c VALUE 'c',
END OF s_str.

WRITE : s_str-col1, s_str-col2, s_str-col3.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
