package com.kt.ims.repository;

import com.kt.ims.domain.ImsAssign;
import com.kt.ims.domain.ImsMember;
import com.kt.ims.domain.QImsAssign;
import com.kt.ims.domain.QImsMember;
import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.jpa.JPQLQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;
import org.codehaus.plexus.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.support.QuerydslRepositorySupport;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.util.List;

@Transactional
public class ImsAssignRepositoryImpl extends QuerydslRepositorySupport implements ImsAssignRepositoryCustom {
    private final JPAQueryFactory queryFactory;

    @Autowired
    EntityManager entityManager;

    public ImsAssignRepositoryImpl(JPAQueryFactory queryFactory) {
        super(ImsAssign.class);
        this.queryFactory = queryFactory;
    }

    @Override
    public List<ImsAssign> findDeviceDatas(String imei, String line, String car, String psCar, String lteS){
        final QImsAssign assign = QImsAssign.imsAssign;
        final JPQLQuery<ImsAssign> query;
        query = from(assign)
                .where(eqImei(imei))
                .where(eqLine(line))
                .where(eqCar(car))
                .where(eqPsCar(psCar))
                .where(eqLteS(lteS))
                .orderBy(assign.id.asc());
        return query.fetch();

    }

    @Override
    public ImsAssign findByImei(String imei) {
        final QImsAssign assign = QImsAssign.imsAssign;
        final JPQLQuery<ImsAssign> query;
        query = from(assign)
                .where(assign.imei.eq(imei))
                .orderBy(assign.id.desc())
                .limit(1);

        return query.fetchOne();
    }

    private BooleanExpression eqImei(String imei){
        if(StringUtils.isEmpty(imei)){
            return null;
        }
        return QImsAssign.imsAssign.imei.eq(imei);
    }

    private BooleanExpression eqLine(String line){
        if(StringUtils.isEmpty(line)){
            return null;
        }
        return QImsAssign.imsAssign.line.eq(line);
    }

    private BooleanExpression eqCar(String car){
        if(StringUtils.isEmpty(car)){
            return null;
        }
        return QImsAssign.imsAssign.car.eq(car);
    }

    private BooleanExpression eqPsCar(String psCar){
        if(StringUtils.isEmpty(psCar)){
            return null;
        }
        return QImsAssign.imsAssign.psCar.eq(psCar);
    }

    private BooleanExpression eqLteS(String lteS){
        if(StringUtils.isEmpty(lteS)){
            return null;
        }
        return QImsAssign.imsAssign.lteS.eq(lteS);
    }
}