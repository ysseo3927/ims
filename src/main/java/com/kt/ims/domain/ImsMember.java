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
@Table(name="tb_ims_member")
public class ImsMember {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="imm_id")
    private Long id;

    @Column(name="imm_member_id")
    private String memberId;

    @Column(name="imm_member_pw")
    private String memberPw;

    @Column(name="imm_nickname")
    private String nickname;

    @Column(name="imm_email")
    private String email;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    @Column(name="imm_join_date")
    private LocalDateTime joinDate;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    @Column(name="imm_visit_date")
    private LocalDateTime visitDate;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    @Column(name="imm_rest_date")
    private LocalDateTime restDate;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    @Column(name="imm_leave_date")
    private LocalDateTime leaveDate;

    @Column(name="imm_etc")
    private String etc;

    @Column(name="imm_regdate")
    private LocalDateTime regdate;

}
