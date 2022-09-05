package com.kt.ims.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
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
@Table(name="tb_ims_assign")
public class ImsAssign {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="ima_id")
    private Long id;

    @Column(name="ima_imei")
    private String imei;

    @Column(name="ima_line")
    private String line;

    @Column(name="ima_car")
    private String car;

    @Column(name="ima_ps_car")
    private String psCar;

    @Column(name="ima_lte_s")
    private String lteS;

    @Column(name="ima_ion_m")
    private Integer ionM;

    @Column(name="ima_ion_s")
    private Integer ionS;

    @Column(name="ima_system_status")
    private String systemStatus;

    @Column(name="ima_ion_status")
    private String ionStatus;

    @Column(name="ima_etc")
    private String etc;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    @Column(name="ima_regdate")
    private LocalDateTime regdate;

}