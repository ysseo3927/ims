package com.kt.ims.repository;

import com.kt.ims.domain.ImsData;
import com.kt.ims.domain.ImsMember;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface ImsMemberRepository extends JpaRepository<ImsMember, Long>, ImsMemberRepositoryCustom, QuerydslPredicateExecutor<ImsMember> {
}