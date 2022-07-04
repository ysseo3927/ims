package com.kt.ims.repository;

import com.kt.ims.domain.ImsAssign;
import com.querydsl.jpa.impl.JPAQueryFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.support.QuerydslRepositorySupport;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;

@Transactional
public class ImsAssignRepositoryImpl extends QuerydslRepositorySupport implements ImsAssignRepositoryCustom {
    private final JPAQueryFactory queryFactory;

    @Autowired
    EntityManager entityManager;

    public ImsAssignRepositoryImpl(JPAQueryFactory queryFactory) {
        super(ImsAssign.class);
        this.queryFactory = queryFactory;
    }
}