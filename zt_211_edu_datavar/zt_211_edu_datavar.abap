*&---------------------------------------------------------------------*
*& Report ZT_211_EDU_DATAVAR
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZT_211_EDU_DATAVAR.

"데이터 선언 후
TYPES lt_abc1 TYPE c LENGTH 3.
DATA lv_abc1 TYPE lt_abc1.
MOVE 'HELLO ABAP' TO lv_abc1.

"데이터 타입 선언
DATA lv_abc2 TYPE c LENGTH 3 VALUE 'HELLO ABAP'.

"LIKE 를 통한 선언
DATA lv_abc3 LIKE lv_abc1 VALUE 'HELLO ABAP'.

"lv_abc1 과 lv_abc2 표시하기(단, 엔터 치고)
WRITE : / lv_abc1.
WRITE : / lv_abc2.

* 타입의 길이가 3이기 때문에 HEL 만 출력된다.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
