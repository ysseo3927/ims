package com.kt.ims.service;

import com.kt.ims.repository.ImsDataRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class LogService {

    @Autowired
    ImsDataRepository imsDataRepository;
    public List<HashMap<String, Object>> getLogDatas(String imei, String lte, String line, String carNum,
                                                     String pscarNum, String ionStatus, String startDatetime, String endDatetime){
        List<HashMap<String, Object>> logDatas = imsDataRepository.findLogDatas(imei, lte, line, carNum, pscarNum, ionStatus, startDatetime, endDatetime);
        return logDatas;
    }

    public int deleteImdData(List<Integer> imdIds){
        return imsDataRepository.deleteImdData(imdIds);
    }
}
