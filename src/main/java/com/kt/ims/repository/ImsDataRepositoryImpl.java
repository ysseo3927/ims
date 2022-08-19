package com.kt.ims.repository;

import com.kt.ims.domain.ImsData;
import com.querydsl.jpa.impl.JPAQueryFactory;
import org.hibernate.query.internal.NativeQueryImpl;
import org.hibernate.transform.AliasToEntityMapResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.support.QuerydslRepositorySupport;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.*;

@Transactional
public class ImsDataRepositoryImpl extends QuerydslRepositorySupport implements ImsDataRepositoryCustom {
    private final JPAQueryFactory queryFactory;

    @Autowired
    EntityManager entityManager;

    public ImsDataRepositoryImpl(JPAQueryFactory queryFactory) {
        super(ImsData.class);
        this.queryFactory = queryFactory;
    }

    @Override
    public double findByAllLineAvgIaq(Integer hour) {

        String sql =
                "SELECT IFNULL(ROUND(AVG(t.imd_iaq),2),0) AS iaq " +
                "FROM ( " +
                "SELECT imd.* FROM tb_ims_data imd " +
                "WHERE imd_regdate > DATE_ADD(NOW(), INTERVAL -" + hour + " HOUR) " +
                ") t ";


        Query query = entityManager.createNativeQuery(sql);

        double avgIaq = (double) entityManager.createNativeQuery(sql).getSingleResult();

        return avgIaq;
    }

    @Override
    public List<HashMap<String,Object>> findTimeTableAllLineAvgIaq() {
        String sql = "SELECT " +
                "CASE " +
                "WHEN DATE_FORMAT(imd_regdate,'%H') = '04' THEN '04:00' " +
                "WHEN DATE_FORMAT(imd_regdate,'%H') = '05' THEN '05:00' " +
                "WHEN DATE_FORMAT(imd_regdate,'%H') = '06' THEN '06:00' " +
                "WHEN DATE_FORMAT(imd_regdate,'%H') = '07' THEN '07:00' " +
                "WHEN DATE_FORMAT(imd_regdate,'%H') = '08' THEN '08:00' " +
                "WHEN DATE_FORMAT(imd_regdate,'%H') = '09' THEN '09:00' " +
                "WHEN DATE_FORMAT(imd_regdate,'%H') = '10' THEN '10:00' " +
                "WHEN DATE_FORMAT(imd_regdate,'%H') = '11' THEN '11:00' " +
                "WHEN DATE_FORMAT(imd_regdate,'%H') = '12' THEN '12:00' " +
                "WHEN DATE_FORMAT(imd_regdate,'%H') = '13' THEN '13:00' " +
                "WHEN DATE_FORMAT(imd_regdate,'%H') = '14' THEN '14:00' " +
                "WHEN DATE_FORMAT(imd_regdate,'%H') = '15' THEN '15:00' " +
                "WHEN DATE_FORMAT(imd_regdate,'%H') = '16' THEN '16:00' " +
                "WHEN DATE_FORMAT(imd_regdate,'%H') = '17' THEN '17:00' " +
                "WHEN DATE_FORMAT(imd_regdate,'%H') = '18' THEN '18:00' " +
                "WHEN DATE_FORMAT(imd_regdate,'%H') = '19' THEN '19:00' " +
                "WHEN DATE_FORMAT(imd_regdate,'%H') = '20' THEN '20:00' " +
                "WHEN DATE_FORMAT(imd_regdate,'%H') = '21' THEN '21:00' " +
                "WHEN DATE_FORMAT(imd_regdate,'%H') = '22' THEN '22:00' " +
                "WHEN DATE_FORMAT(imd_regdate,'%H') = '23' THEN '23:00' " +
                "END AS time_table, " +
                "ROUND(AVG(t.imd_iaq),2) AS iaq " +
                "FROM ( " +
                "SELECT imd.* FROM tb_ims_data imd " +
                "WHERE DATE_FORMAT(imd.imd_regdate,'%Y-%m-%d') = CURDATE() " +
                "AND DATE_FORMAT(imd_regdate,'%H') >= '04' " +
                "AND DATE_FORMAT(imd_regdate,'%H') <= '23' " +
                ") t " +
                "GROUP BY time_table ";

        Query query = entityManager.createNativeQuery(sql);

        NativeQueryImpl nativeQuery = (NativeQueryImpl) query;
        nativeQuery.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
        List<HashMap<String,Object>> list = query.getResultList();

        return list;

    }

    @Override
    public List<HashMap<String,Object>> findAllLineAvgData(Integer hour) {
        String sql = "SELECT t.ima_line, " +
                "ROUND(AVG(t.imd_iaq),2) AS iaq, " +
                "ROUND(AVG(t.imd_gp10),2) AS gp10, " +
                "ROUND(AVG(t.imd_gp1_0),2) AS gp1_0, " +
                "ROUND(AVG(t.imd_gp2_5),2) AS gp2_5, " +
                "ROUND(AVG(t.imd_voc),2) AS voc, " +
                "ROUND(AVG(t.imd_co2),2) AS co2, " +
                "ROUND(AVG(t.imd_temp),2) AS temp, " +
                "ROUND(AVG(t.imd_humi),2) AS humi " +
                "FROM ( " +
                "SELECT ima.ima_line, imd.* FROM tb_ims_data imd " +
                "JOIN tb_ims_assign ima ON ima.ima_imei = imd.imd_imei " +
                "WHERE imd_regdate > DATE_ADD(NOW(), INTERVAL -" + hour + " HOUR) " +
                ") t " +
                "GROUP BY t.ima_line " +
                "ORDER BY ima_line ASC";

        Query query = entityManager.createNativeQuery(sql);

        NativeQueryImpl nativeQuery = (NativeQueryImpl) query;
        nativeQuery.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
        List<HashMap<String,Object>> list = query.getResultList();

        return list;

    }

    @Override
    public List<HashMap<String, Object>> findMonitoringDatas(String imei, String lte, String line, String carNum, String pscarNum) {


        String prepareSql = "SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' ";
        Query prepareQuery = entityManager.createNativeQuery(prepareSql);
        prepareQuery.executeUpdate();

        String sql = "SELECT  t1.ima_id, " +
                "t1.ima_imei, " +
                "t1.ima_line, " +
                "t1.ima_car, " +
                "t1.ima_ps_car, " +
                "t1.ima_lte_s, " +
                "t1.ima_ion_m, " +
                "t1.ima_ion_s, " +
                "t1.ima_ion_status, " +
                "t1.recent_id," +
                "IFNULL(t2.imd_iaq,0) AS imd_iaq, " +
                "IFNULL(t2.imd_gp10,0) AS imd_gp10, " +
                "IFNULL(t2.imd_gp1_0,0) AS imd_gp1_0, " +
                "IFNULL(t2.imd_gp2_5,0) AS imd_gp2_5, " +
                "IFNULL(t2.imd_voc,0) AS imd_voc, " +
                "IFNULL(t2.imd_co2,0) AS imd_co2, " +
                "IFNULL(t2.imd_temp,0) AS imd_temp, " +
                "IFNULL(t2.imd_humi,0) AS imd_humi, " +
                "IF(TIMESTAMPDIFF(MINUTE, imd_regdate, NOW()) >= 5 OR recent_id = 0, 'OFF', 'ON') AS imd_system_status, " +
                "IFNULL(t2.imd_regdate,'') AS imd_regdate " +
                "FROM ( " +
                "SELECT ima.ima_id, ima.ima_imei, ima.ima_line, ima.ima_car, ima.ima_ps_car, ima.ima_lte_s, ima.ima_ion_m, " +
                "ima.ima_ion_s,ima.ima_ion_status, MAX(IFNULL(imd.imd_id,0)) recent_id " +
                "FROM tb_ims_assign ima " +
                "LEFT JOIN tb_ims_data imd " +
                "ON ima.ima_imei = imd.imd_imei " +
                "WHERE 1=1 ";

                if(imei != null && !"".equals(imei)){
                    sql += "AND ima.ima_imei = '"+imei+"' ";
                }
                if(lte != null && !"".equals(lte)){
                    sql += "AND ima.ima_lte_s = '"+lte+"' ";
                }
                if(line != null && !"".equals(line)){
                    sql += "AND ima.ima_line = '"+line+"' ";
                }
                if(carNum != null && !"".equals(carNum)){
                    sql += "AND ima.ima_car = '"+carNum+"' ";
                }
                if(pscarNum != null && !"".equals(pscarNum)){
                    sql += "AND ima.ima_ps_car = '"+pscarNum+"' ";
                }

        sql += "GROUP BY ima.ima_imei " +
        ") t1 " +
        "LEFT JOIN tb_ims_data t2 " +
        "ON t2.imd_id= t1.recent_id " +
        "ORDER BY ima_line, ima_car, ima_ps_car ASC ";

        Query query = entityManager.createNativeQuery(sql);

        NativeQueryImpl nativeQuery = (NativeQueryImpl) query;
        nativeQuery.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
        List<HashMap<String,Object>> list = query.getResultList();

        return list;
    }

    @Override
    public List<HashMap<String, Object>> findLogDatas(String imei, String lte, String line, String carNum, String pscarNum, String ionStatus, String startDatetime, String endDatetime) {

        String prepareSql = "SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' ";
        Query prepareQuery = entityManager.createNativeQuery(prepareSql);
        prepareQuery.executeUpdate();

        String sql = "SELECT imd.imd_regdate, " +
                "ima.ima_imei, " +
                "ima.ima_lte_s, " +
                "ima.ima_line, " +
                "ima.ima_car, " +
                "ima.ima_ps_car, " +
                "ima.ima_ion_status," +
                "imd.imd_id, " +
                "imd.imd_iaq, " +
                "imd.imd_gp10, " +
                "imd.imd_gp1_0, " +
                "imd.imd_gp2_5, " +
                "imd.imd_voc, " +
                "imd.imd_co2, " +
                "imd.imd_temp, " +
                "imd.imd_humi, " +
                "ima.ima_etc " +
                "FROM tb_ims_data imd " +
                "LEFT JOIN tb_ims_assign ima ON imd.imd_imei = ima.ima_imei " +
                "WHERE 1=1 ";

        if(imei != null && !"".equals(imei)){
            sql += "AND imd.imd_imei = '"+imei+"' ";
        }
        if(lte != null && !"".equals(lte)){
            sql += "AND ima.ima_lte_s = '"+lte+"' ";
        }
        if(line != null && !"".equals(line)){
            sql += "AND ima.ima_line = '"+line+"' ";
        }
        if(carNum != null && !"".equals(carNum)){
            sql += "AND ima.ima_car = '"+carNum+"' ";
        }
        if(pscarNum != null && !"".equals(pscarNum)){
            sql += "AND ima.ima_ps_car = '"+pscarNum+"' ";
        }
        if(ionStatus != null && !"".equals(ionStatus)){
            sql += "AND ima.ima_ion_status = '"+ionStatus+"' ";
        }
        if(startDatetime != null && !"".equals(startDatetime)){
            sql += "AND imd.imd_regdate > '"+startDatetime+"' ";
        }
        if(endDatetime != null && !"".equals(endDatetime)){
            sql += "AND imd.imd_regdate < '"+endDatetime+"' ";
        }

        sql += "ORDER BY imd_regdate DESC ";

        Query query = entityManager.createNativeQuery(sql);
        NativeQueryImpl nativeQuery = (NativeQueryImpl) query;
        nativeQuery.setResultTransformer(AliasToEntityMapResultTransformer.INSTANCE);
        List<HashMap<String,Object>> list = query.getResultList();

        return list;
    }

    @Override
    public int deleteImdData(List<Integer> imdIds) {

        StringJoiner scheduleJoiner = new StringJoiner(",");
        for(Integer imdId : imdIds){
            scheduleJoiner.add(imdId+"");
        }

        String sql = "delete from tb_ims_data where imd_id in (" + scheduleJoiner.toString() + ")";
        return entityManager.createNativeQuery(sql)
                .executeUpdate();
    }

    }