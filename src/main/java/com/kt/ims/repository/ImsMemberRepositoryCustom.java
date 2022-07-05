package com.kt.ims.repository;

import com.kt.ims.domain.ImsMember;

import java.util.Optional;

public interface ImsMemberRepositoryCustom {
    Optional<ImsMember> findByMemberId(String memberId);
    String findByPasswordEncode(String memberPw);
}
