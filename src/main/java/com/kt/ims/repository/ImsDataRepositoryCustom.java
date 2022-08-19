package com.kt.ims.repository;

import java.util.HashMap;
import java.util.List;

public interface ImsDataRepositoryCustom {
    double findByAllLineAvgIaq(Integer hour);
    List<HashMap<String,Object>> findTimeTableAllLineAvgIaq();
    List<HashMap<String,Object>> findAllLineAvgData(Integer hour);
    List<HashMap<String,Object>> findMonitoringDatas(String imei, String lte, String line, String carNum, String pscarNum);
    List<HashMap<String,Object>> findLogDatas(String imei, String lte, String line, String carNum, String pscarNum, String ionStatus, String startDatetime, String endDatetime);
    int deleteImdData(List<Integer> imdIds);
}
