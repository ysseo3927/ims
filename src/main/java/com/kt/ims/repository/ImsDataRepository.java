package com.kt.ims.repository;

import com.kt.ims.domain.ImsData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface ImsDataRepository extends JpaRepository<ImsData, Long>, ImsDataRepositoryCustom, QuerydslPredicateExecutor<ImsData> {
}

