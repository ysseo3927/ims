package com.kt.ims.dto;

import lombok.*;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class LogDataDto {
    private Integer no;
    private Integer imd_id;
    private String imd_regdate;
    private String ima_imei;
    private String ima_lte_s;
    private String ima_line;
    private String ima_car;
    private String ima_ps_car;
    private String ima_ion_status;
    private String imd_iaq;
    private String imd_gp10;
    private String imd_gp1_0;
    private String imd_gp2_5;
    private String imd_voc;
    private String imd_co2;
    private String imd_temp;
    private String imd_humi;
    private String imd_etc;
}
