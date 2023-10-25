*&---------------------------------------------------------------------*
*& Report ZT_211_EDU_ITAB_HEADERLINE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZT_211_EDU_ITAB_HEADERLINE.

TYPES : BEGIN OF s_str,
  col1 TYPE c,
  col2 TYPE c,
  col3 TYPE c,
END OF s_str.

"헤더라인 있는 테이블
DATA itab1 TYPE TABLE OF s_str WITH HEADER LINE.

itab1-col1 = 'a'.
itab1-col2 = 'b'.
itab1-col3 = 'c'.

INSERT itab1 INTO itab1.
"APPEND itab1 도 사용 가능


"헤더라인 없는 테이블
DATA itab2 TYPE TABLE OF s_str.
DATA gs_wa LIKE LINE OF itab2.

gs_wa-col1 = 'a'.
gs_wa-col2 = 'b'.
gs_wa-col3 = 'c'.

INSERT gs_wa INTO itab2.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
