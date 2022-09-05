package com.kt.ims.service;

import com.kt.ims.domain.ImsAssign;
import com.kt.ims.domain.ImsMember;
import com.kt.ims.repository.ImsAssignRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class DeviceService {

    @Autowired
    ImsAssignRepository imsAssignRepository;

    public List<ImsAssign> getDeviceDatas(String imei, String line, String car, String psCar, String lteS){
        List<ImsAssign> deviceDatas = imsAssignRepository.findDeviceDatas(imei, line, car, psCar, lteS);
        return deviceDatas;
    }

    public String remove(String rowId){

        String result = "success";
        try {
            imsAssignRepository.deleteById(Long.valueOf(rowId));
        }catch (Exception e){
            result = "fail";
        }
        return result;
    }

    public String modify(String no, String imei, String line, String car, String pscar, String lte, String ionm,String ions,String ionStatus,String etc){

        String result = "success";

        try {
            ImsAssign imsAssign = imsAssignRepository.findById(Long.valueOf(no)).orElseThrow();
            imsAssign.setLine(line);
            imsAssign.setCar(car);
            imsAssign.setPsCar(pscar);
            imsAssign.setLteS(lte);
            imsAssign.setIonM(Integer.valueOf(ionm));
            imsAssign.setIonS(Integer.valueOf(ions));
            imsAssign.setIonStatus(ionStatus);
            imsAssign.setEtc(etc);

            imsAssignRepository.save(imsAssign);
        }catch (Exception e){
            result = "fail";
        }
        return result;
    }

    public ImsAssign checkImei(String imei){
        ImsAssign deviceData = imsAssignRepository.findByImei(imei);
        return deviceData;
    }

    public String regist(String imei, String line, String car, String pscar, String lte, String ionm,String ions,String ionStatus,String etc){

        String result = "success";

        try {
            ImsAssign imsAssign = ImsAssign.builder()
                            .imei(imei)
                            .line(line)
                            .car(car)
                            .psCar(pscar)
                            .lteS(lte)
                            .ionM(Integer.valueOf(ionm))
                            .ionS(Integer.valueOf(ions))
                            .ionStatus(ionStatus)
                            .etc(etc)
                            .regdate(LocalDateTime.now())
                            .build();

            imsAssignRepository.save(imsAssign);

        }catch (Exception e){
            result = "fail";
            e.printStackTrace();
        }
        return result;
    }


}
