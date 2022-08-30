package com.kt.ims.repository;

import com.kt.ims.domain.ImsMember;

import java.util.List;
import java.util.Optional;

public interface ImsMemberRepositoryCustom {
    Optional<ImsMember> findByMemberId(String memberId);
    Optional<ImsMember> findByMemberIdWithLeave(String memberId);
    String findByPasswordEncode(String memberPw);
    List<ImsMember> findMemberDatas(String memberId, String nickname, String email);
}
