package com.kt.ims.dto;

import lombok.*;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class MonitoringDataDto {
    private String no;
    private String line;
    private String car;
    private String pscar;
    private String imei;
    private String lte;
    private String ionm;
    private String ions;
    private String systemStatus;
    private String ionStatus;
    private String iaq;
    private String gp10;
    private String gp2_5;
    private String gp1_0;
    private String tvoc;
    private String co2;
    private String temp;
    private String humi;
}
