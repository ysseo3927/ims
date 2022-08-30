package com.kt.ims.repository;

import com.kt.ims.domain.ImsMember;
import com.kt.ims.domain.QImsMember;
import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.jpa.JPQLQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;
import org.codehaus.plexus.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.support.QuerydslRepositorySupport;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;
import java.util.Optional;

@Transactional
public class ImsMemberRepositoryImpl extends QuerydslRepositorySupport implements ImsMemberRepositoryCustom {
    private final JPAQueryFactory queryFactory;

    @Autowired
    EntityManager entityManager;

    public ImsMemberRepositoryImpl(JPAQueryFactory queryFactory) {
        super(ImsMember.class);
        this.queryFactory = queryFactory;
    }

    @Override
    public Optional<ImsMember> findByMemberId(String memberId) {
        final QImsMember member = QImsMember.imsMember;
        final JPQLQuery<ImsMember> query;
        query = from(member)
                .where(member.memberId.eq(memberId))
                .where(member.leaveDate.isNull());

        return Optional.ofNullable(query.fetchOne());
    }

    @Override
    public Optional<ImsMember> findByMemberIdWithLeave(String memberId) {
        final QImsMember member = QImsMember.imsMember;
        final JPQLQuery<ImsMember> query;
        query = from(member)
                .where(member.memberId.eq(memberId));

        return Optional.ofNullable(query.fetchOne());
    }

    @Override
    public String findByPasswordEncode(String memberPw) {

        String q = "select password(?0)";
        String where = "";
        String sql = q + where;

        Query query = entityManager.createNativeQuery(sql);
        query.setParameter(0, memberPw);

        return (String)query.getSingleResult();
    }

    @Override
    public List<ImsMember> findMemberDatas(String memberId, String nickname, String email) {
        final QImsMember member = QImsMember.imsMember;
        final JPQLQuery<ImsMember> query;
        query = from(member)
                .where(eqMemberId(memberId))
                .where(eqNickname(nickname))
                .where(eqEmail(email))
                .orderBy(member.id.asc());

        return query.fetch();
    }

    private BooleanExpression eqMemberId(String memberId){
        if(StringUtils.isEmpty(memberId)){
            return null;
        }
        return QImsMember.imsMember.memberId.eq(memberId);
    }

    private BooleanExpression eqNickname(String nickname){
        if(StringUtils.isEmpty(nickname)){
            return null;
        }
        return QImsMember.imsMember.nickname.eq(nickname);
    }

    private BooleanExpression eqEmail(String email){
        if(StringUtils.isEmpty(email)){
            return null;
        }
        return QImsMember.imsMember.email.eq(email);
    }
}