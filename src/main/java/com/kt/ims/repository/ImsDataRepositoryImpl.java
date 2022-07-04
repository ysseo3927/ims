package com.kt.ims.repository;

import com.kt.ims.domain.ImsData;
import com.querydsl.jpa.impl.JPAQueryFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.support.QuerydslRepositorySupport;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;

@Transactional
public class ImsDataRepositoryImpl extends QuerydslRepositorySupport implements ImsDataRepositoryCustom {
    private final JPAQueryFactory queryFactory;

    @Autowired
    EntityManager entityManager;

    public ImsDataRepositoryImpl(JPAQueryFactory queryFactory) {
        super(ImsData.class);
        this.queryFactory = queryFactory;
    }
}