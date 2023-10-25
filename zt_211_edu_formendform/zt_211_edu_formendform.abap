*&---------------------------------------------------------------------*
*& Report ZT_211_EDU_FORMENDFORM
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZT_211_EDU_FORMENDFORM.




"FUNCTION MODULE

"MACRO

"Subroutine

DATA : gv_data TYPE i VALUE 1.

PERFORM get_data USING gv_data.



FORM get_data USING gv_data.

  gv_data = gv_data + 1.

  ENDFORM.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
