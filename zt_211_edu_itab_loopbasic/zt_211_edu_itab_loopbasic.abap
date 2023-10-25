*&---------------------------------------------------------------------*
*& Report ZT_211_EDU_ITAB_LOOPBASIC
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZT_211_EDU_ITAB_LOOPBASIC.

DATA gt_itab TYPE TABLE OF sflight.
DATA gs_line TYPE sflight.

"인터널 테이블에 sflight 정보 넣기
SELECt * INTO gs_line FROM sflight.
  INSERT gs_line INTO TABLE gt_itab.
ENDSELECT.

"인터널 테이블을 gs_ilne 으로 긁으면서 출력
LOOP AT gt_itab INTO gs_line.
  WRITe : / gs_line-carrid, gs_line-connid.
ENDLOOP.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
