*&---------------------------------------------------------------------*
*& Report ZT_211_EDU_DATAVAR2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZT_211_EDU_DATAVAR2.

*상수 선언
CONSTANTS gc_abc VALUE '123'.

"STATIC 변수 선언
*" STATICS gv_val VALUE '123'.



"ABAP Dictionary 테이블 불러오기
"TABLES : sflight.

"구조체 선언
DATA gs_wa LIKE sflight.

"SQL문을 통해 불러서 gs_wa 에 한줄씩 넣으면서 carrid 불러오기
SELECT * FROM sflight INTO gs_wa.
  WRITE : / gs_wa-carrid, gs_wa-fldate.
ENDSELECT.

cl_demo_output=>display( gs_wa ).

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
