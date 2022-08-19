package com.kt.ims.dto;

import lombok.*;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class MainDataDto {

    /** 전 노선 평균 통합 공기질 지수 */
    private Double lineAllAvgIaq;

    /** 전 노선 평균 통합 공기질 지수 */
    //1호선
    private Double line1AvgIaq;

    //2호선
    private Double line2AvgIaq;

    //3호선
    private Double line3AvgIaq;

    //4호선
    private Double line4AvgIaq;

    //5호선
    private Double line5AvgIaq;

    //6호선
    private Double line6AvgIaq;

    //7호선
    private Double line7AvgIaq;

    //8호선
    private Double line8AvgIaq;


    /** 전노선 시간대별 평균 통합 공기질 지수 */
    //04:00
    private Double time04AvgIaq;

    //05:00
    private Double time05AvgIaq;

    //06:00
    private Double time06AvgIaq;

    //07:00
    private Double time07AvgIaq;

    //08:00
    private Double time08AvgIaq;

    //09:00
    private Double time09AvgIaq;

    //10:00
    private Double time10AvgIaq;

    //11:00
    private Double time11AvgIaq;

    //12:00
    private Double time12AvgIaq;

    //13:00
    private Double time13AvgIaq;

    //14:00
    private Double time14AvgIaq;

    //15:00
    private Double time15AvgIaq;

    //16:00
    private Double time16AvgIaq;

    //17:00
    private Double time17AvgIaq;

    //18:00
    private Double time18AvgIaq;

    //19:00
    private Double time19AvgIaq;

    //20:00
    private Double time20AvgIaq;

    //21:00
    private Double time21AvgIaq;

    //22:00
    private Double time22AvgIaq;

    //23:00
    private Double time23AvgIaq;



    /** 노선별 미세먼지 농도 */
    //1호선
    private Double line1AvgGp10;

    //2호선
    private Double line2AvgGp10;

    //3호선
    private Double line3AvgGp10;

    //4호선
    private Double line4AvgGp10;

    //5호선
    private Double line5AvgGp10;

    //6호선
    private Double line6AvgGp10;

    //7호선
    private Double line7AvgGp10;

    //8호선
    private Double line8AvgGp10;


    /** 노선별 초미세먼지 농도 */
    //1호선
    private Double line1AvgGp1_0;

    //2호선
    private Double line2AvgGp1_0;

    //3호선
    private Double line3AvgGp1_0;

    //4호선
    private Double line4AvgGp1_0;

    //5호선
    private Double line5AvgGp1_0;

    //6호선
    private Double line6AvgGp1_0;

    //7호선
    private Double line7AvgGp1_0;

    //8호선
    private Double line8AvgGp1_0;

    /** 노선별 극초미세먼지 농도 */
    //1호선
    private Double line1AvgGp2_5;

    //2호선
    private Double line2AvgGp2_5;

    //3호선
    private Double line3AvgGp2_5;

    //4호선
    private Double line4AvgGp2_5;

    //5호선
    private Double line5AvgGp2_5;

    //6호선
    private Double line6AvgGp2_5;

    //7호선
    private Double line7AvgGp2_5;

    //8호선
    private Double line8AvgGp2_5;



    /** 노선별 TVOC 농도 */
    //1호선
    private Double line1AvgTvoc;

    //2호선
    private Double line2AvgTvoc;

    //3호선
    private Double line3AvgTvoc;

    //4호선
    private Double line4AvgTvoc;

    //5호선
    private Double line5AvgTvoc;

    //6호선
    private Double line6AvgTvoc;

    //7호선
    private Double line7AvgTvoc;

    //8호선
    private Double line8AvgTvoc;


    /** 노선별 이산화탄소 농도 */
    //1호선
    private Double line1AvgCo2;

    //2호선
    private Double line2AvgCo2;

    //3호선
    private Double line3AvgCo2;

    //4호선
    private Double line4AvgCo2;

    //5호선
    private Double line5AvgCo2;

    //6호선
    private Double line6AvgCo2;

    //7호선
    private Double line7AvgCo2;

    //8호선
    private Double line8AvgCo2;


    /** 노선별 온도 */
    //1호선
    private Double line1AvgTemp;

    //2호선
    private Double line2AvgTemp;

    //3호선
    private Double line3AvgTemp;

    //4호선
    private Double line4AvgTemp;

    //5호선
    private Double line5AvgTemp;

    //6호선
    private Double line6AvgTemp;

    //7호선
    private Double line7AvgTemp;

    //8호선
    private Double line8AvgTemp;



    /** 노선별 습도 */
    //1호선
    private Double line1AvgHumi;

    //2호선
    private Double line2AvgHumi;

    //3호선
    private Double line3AvgHumi;

    //4호선
    private Double line4AvgHumi;

    //5호선
    private Double line5AvgHumi;

    //6호선
    private Double line6AvgHumi;

    //7호선
    private Double line7AvgHumi;

    //8호선
    private Double line8AvgHumi;
}
