*&---------------------------------------------------------------------*
*& Report ZT_211_EDU_ITAB_INSERT_TEST
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZT_211_EDU_ITAB_INSERT_TEST.

"인터널 테이블 1번 생성
DATA gt_itab1 TYPE TABLE OF sflight.
DATA gs_wa1 TYPE sflight.

"인터널 테이블 2번 생성
DATA gt_itab2 TYPE TABLE OF sflight.
DATA gs_wa2 TYPE sflight.

"인터널 테이블 1번에 데이터 넣기
SELECT * FROM sflight INTO gs_wa1.
  INSERT gs_wa1 INTO TABLE gt_itab1.
ENDSELECT.

cl_demo_output=>display( gt_itab1 ).

"1번 인터널 테이블의 2-4번째 줄 2번 인터널 테이블에 넣기
INSERT LINES OF gt_itab1 FROM 2 TO 4 INTO TABLE gt_itab2.

cl_demo_output=>display( gt_itab2 ).

"구조체 만들고 해당 내용을 2번쨰 줄에 추가
DATA gs_line TYPE sflight.
gs_line-carrid = 'AA'.
gs_line-connid = 0000.

"gs_line 의 내용을 gt_itab2의 2번째 INDEX 에 넣기
INSERT gs_line INTO gt_itab2 INDEX 2.

cl_demo_output=>display( gt_itab2 ).

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
