*&---------------------------------------------------------------------*
*& Report ZT_211_EDU_ITAB_COMPARE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZT_211_EDU_ITAB_COMPARE.

"헤더라인 있는 인터널 테이블

DATA gt_itabh TYPE TABLE OF sflight WITH HEADER LINE.

SELECT * INTO gt_itabh FROM sflight WHERE CARRID = 'AA'.
  INSERT gt_itabh INTO TABLE gt_itabh. "INTO TABLE gt_itabh[] 도 가능
ENDSELECT.

" 헤더라인 없는 인터널 테이블

DATA gt_itab TYPE TABLE OF sflight.
DATA gs_wa TYPE sflight.

SELECT * INTO gs_wa FROM sflight WHERE CARRID = 'AA'.
  INSERT gs_wa INTO TABLE gt_itab.
ENDSELECT.


"출력

cl_demo_output=>display( gt_itabh ).
cl_demo_output=>display( gt_itabh[] ).
cl_demo_output=>display( gt_itab ).

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
