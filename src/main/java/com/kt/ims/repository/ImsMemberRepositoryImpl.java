package com.kt.ims.repository;

import com.kt.ims.domain.ImsMember;
import com.querydsl.jpa.impl.JPAQueryFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.support.QuerydslRepositorySupport;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;

@Transactional
public class ImsMemberRepositoryImpl extends QuerydslRepositorySupport implements ImsMemberRepositoryCustom {
    private final JPAQueryFactory queryFactory;

    @Autowired
    EntityManager entityManager;

    public ImsMemberRepositoryImpl(JPAQueryFactory queryFactory) {
        super(ImsMember.class);
        this.queryFactory = queryFactory;
    }
}