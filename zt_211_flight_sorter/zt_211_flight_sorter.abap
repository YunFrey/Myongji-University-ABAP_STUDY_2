*&---------------------------------------------------------------------*
*& Report ZT_211_FLIGHT_SORTER
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZT_211_FLIGHT_SORTER.

TABLES sflight.

SELECT-OPTIONS : r_carrid FOR sflight-carrid.
SELECT-OPTIONS : r_fldate FOR sflight-fldate.

DATA gt_itab TYPE TABLE OF sflight.
DATA gs_wa TYPE sflight.

TYPES : BEGIN OF t_res,
  carrid TYPE sflight-carrid,
  connid TYPE sflight-connid,
  carrname TYPE scarr-carrname,
  fldate TYPE sflight-fldate,
  cityfrom TYPE spfli-cityfrom,
  cityto TYPE spfli-cityto,
  distance TYPE spfli-distance,
  END OF t_res.

*결과 담을 인터널  테이블
DATA gt_res TYPE TABLE OF t_res.
*결과 담을 구조체
DATA gs_res TYPE t_res.



*방법 1 ) INNER JOIN 두번쓰기
*방법 2 ) LOOP문으로 추가하기
*방법 3) SELECT...ENDSELECT문으로 추가하기

SELECT carrid connid fldate INTO CORRESPONDING FIELDS OF gs_res
  FROM sflight
  WHERE carrid IN r_carrid
  AND fldate IN r_fldate.

  SELECT SINGLE carrname INTO CORRESPONDING FIELDS OF gs_res
    FROM scarr
    WHERE carrid = gs_res-carrid.

  SELECT SINGLE cityfrom cityto distance INTO CORRESPONDING FIELDS OF gs_res
    FROM spfli
    WHERE carrid = gs_res-carrid
    AND connid = gs_res-connid.

  INSERT gs_res INTO TABLE gt_res.
  CLEAR gs_res.

ENDSELECT.

*정렬 (아니면 첨부터 SORTED TABLE 써도 됨)
SORT gt_res BY carrid ASCENDING connid ASCENDING.

cl_demo_output=>display_data( gt_res ).

**2-2. 비행 거리가 가장 짧은 항공편만 보여주세요(단위가 마일인 경우 키로미터로 환산하세요 *직접 계산 , 소수점 버림)
SORT gt_res BY distance ASCENDING.

READ TABLE gt_res INTO gs_res INDEX 1.

*단위 환산 ( Mile to Kilo)
DATA convert_mile_to_kilo TYPE p VALUE '1.609344'.
MULTIPLY gs_res-distance BY convert_mile_to_kilo.

cl_demo_output=>display_data( gs_res ).

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
