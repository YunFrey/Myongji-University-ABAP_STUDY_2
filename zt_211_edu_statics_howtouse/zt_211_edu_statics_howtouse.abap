*&---------------------------------------------------------------------*
*& Report ZT_211_EDU_STATICS_HOWTOUSE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZT_211_EDU_STATICS_HOWTOUSE.

DO 3 TIMES.
  PERFORM call_subr.
ENDDO.


" 이러면 lv_val 은 FORM 문 안에서만 존재하며 0,1,2,3 으로 변화한다.

*아래처럼 STATICS 가 아닌 DATA 로 선언하면  0,0,0,0 으로 초기화만 된다.

DO 3 TIMES.
  PERFORM call_subr2.
ENDDO.


FORM call_subr.
  STATICS lv_val TYPE i. "로컬 변수 선언
  lv_val = lv_val + 1.
  WRITE : / 'STATIC Variable :', lv_val.
ENDFORM.

FORM call_subr2.
  DATA lv_val TYPE i. "로컬 변수 선언
  lv_val = lv_val + 1.
  WRITE : / 'STATIC Variable :', lv_val.
ENDFORM.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
