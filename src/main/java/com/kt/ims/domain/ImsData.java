package com.kt.ims.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name="tb_ims_data")
public class ImsData {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="imd_id")
    private Long id;

    @Column(name="imd_imei")
    private String imei;

    @Column(name="imd_temp")
    private String temp;

    @Column(name="imd_humi")
    private String humi;

    @Column(name="imd_pres")
    private String pres;

    @Column(name="imd_gass")
    private String gass;

    @Column(name="imd_iaq")
    private String iaq;

    @Column(name="imd_voc")
    private String voc;

    @Column(name="imd_co2")
    private String co2;

    @Column(name="imd_p1")
    private String p1;

    @Column(name="imd_p1.0")
    private String p1_0;

    @Column(name="imd_np2.5")
    private String np2_5;

    @Column(name="imd_np10")
    private String np10;

    @Column(name="imd_gp1.0")
    private String gp1_0;

    @Column(name="imd_gp2.5")
    private String gp2_5;

    @Column(name="imd_gp10")
    private String gp10;

    @Column(name="imd_regdate")
    private LocalDateTime regdate;

}
