package com.kt.ims.dto;

import lombok.*;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class DashboardDataDto {

    //전 노선 평균 통합 공기질 지수
    private Double dashboardDataAvgIaqAllLine;

    //노선별 평균 통합 공기질 지수
    private DashboardDataLineAvgIaqDto dashboardDataLineAvgIaqDto;

    //시간대별 전 노선 평균 통합 공기질 지수
    private DashboardDataTimeAvgIaqDto dashboardDataTimeAvgIaqDto;

    //통합 공기질 지수
    private DashboardDataAvgIaqDto dashboardDataAvgIaqDto;

    //미세먼지 농도
    private DashboardDataAvgGp10Dto dashboardDataAvgGp10Dto;

    //초미세먼지 농도
    private DashboardDataAvgGp1_0Dto dashboardDataAvgGp1_0Dto;

    //극초미세먼지 농도
    private DashboardDataAvgGp2_5Dto dashboardDataAvgGp2_5Dto;

    //TVOC
    private DashboardDataAvgVocDto dashboardDataAvgVocDto;

    //이산화탄소
    private DashboardDataAvgCo2Dto dashboardDataAvgCo2Dto;

    //온도
    private DashboardDataAvgTempDto dashboardDataAvgTempDto;

    //습도
    private DashboardDataAvgHumiDto dashboardDataAvgHumiDto;

}
