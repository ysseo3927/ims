package com.kt.ims.repository;

import com.kt.ims.domain.ImsAssign;
import com.kt.ims.domain.ImsMember;

import java.util.List;

public interface ImsAssignRepositoryCustom {

    List<ImsAssign> findDeviceDatas(String imei, String line, String car, String psCar, String lteS);
    ImsAssign findByImei(String imei);

}
