package com.kt.ims.repository;

import com.kt.ims.domain.ImsAssign;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface ImsAssignRepository extends JpaRepository<ImsAssign, Long>, ImsAssignRepositoryCustom, QuerydslPredicateExecutor<ImsAssign> {
}
