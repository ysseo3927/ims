package com.kt.ims.controller;

import com.kt.ims.domain.ImsMember;
import com.kt.ims.dto.*;
import com.kt.ims.service.MonitoringService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class MonitoringController {

    @Autowired
    MonitoringService monitoringService;

    @PostMapping("/monitoring")
    public String getMonitoring(Model model, HttpServletRequest servletRequest, HttpSession httpSession) {
        ImsMember member = (ImsMember)httpSession.getAttribute("member");

        if(member == null){
            return "login";
        }

        return "monitoring";
    }

    ///monitoring/data/search

    @ResponseBody
    @PostMapping("/monitoring/data/search")
    public Map<String,Object> dataSearch(@RequestBody Map<String,String> map, HttpServletRequest servletRequest) {

        String imei = (String)map.get("imei");          //IMEI
        String lte = (String)map.get("lte");            //LTE#
        String line = (String)map.get("line");          //노선
        String carNum = (String)map.get("carNum");      //차량번호
        String pscarNum = (String)map.get("pscarNum");  //객차번호

        System.out.println(imei);
        System.out.println(lte);
        System.out.println(line);
        System.out.println(carNum);
        System.out.println(pscarNum);

        Map<String,Object> result = new HashMap<>();

        List<HashMap<String,Object>> monitoringDatas = monitoringService.getMonitoringDatas(imei, lte, line, carNum, pscarNum);

        List<MonitoringDataDto> monitoringDataDtos = new ArrayList<>();
        int no = 0;

        for(HashMap<String,Object> monitoringData : monitoringDatas){
            no++;
            Integer imaId = (int)monitoringData.get("ima_id");
            String imaImei = (String)monitoringData.get("ima_imei");
            String imaLine = (String)monitoringData.get("ima_line");
            String imaCar = (String)monitoringData.get("ima_car");
            String imaPscar = (String)monitoringData.get("ima_ps_car");
            String imaLteS = (String)monitoringData.get("ima_lte_s");
            Integer imaIonM = (Integer)monitoringData.get("ima_ion_m");
            Integer imaIonS = (Integer)monitoringData.get("ima_ion_s");
            String imaIonStatus = (String)monitoringData.get("ima_ion_status");
            BigInteger recentId = (BigInteger)monitoringData.get("recent_id");
            String imdIaq = (String)monitoringData.get("imd_iaq");
            String imdGp10 = (String)monitoringData.get("imd_gp10");
            String imdGp1_0 = (String)monitoringData.get("imd_gp1_0");
            String imdGp2_5 = (String)monitoringData.get("imd_gp2_5");
            String imdVoc = (String)monitoringData.get("imd_voc");
            String imdCo2 = (String)monitoringData.get("imd_co2");
            String imdTemp = (String)monitoringData.get("imd_temp");
            String imdHumi = (String)monitoringData.get("imd_humi");
            String imdSystemStatus = (String)monitoringData.get("imd_system_status");
            String imdRegdate = (String)monitoringData.get("imd_regdate");

            MonitoringDataDto monitoringDataDto = MonitoringDataDto.builder()
                    .no(no)
                    .ima_imei(imaImei)
                    .ima_line(imaLine)
                    .ima_car(imaCar)
                    .ima_ps_car(imaPscar)
                    .ima_lte_s(imaLteS)
                    .ima_ion_m(imaIonM)
                    .ima_ion_s(imaIonS)
                    .ima_ion_status(imaIonStatus)
                    .recent_id(recentId.intValue())
                    .imd_iaq(imdIaq)
                    .imd_gp10(imdGp10)
                    .imd_gp1_0(imdGp1_0)
                    .imd_gp2_5(imdGp2_5)
                    .imd_voc(imdVoc)
                    .imd_co2(imdCo2)
                    .imd_temp(imdTemp)
                    .imd_humi(imdHumi)
                    .imd_system_status(imdSystemStatus)
                    .imd_regdate(imdRegdate)
                    .build();

            monitoringDataDtos.add(monitoringDataDto);
        }

        result.put("data",monitoringDataDtos);

        return result;
    }
    @ResponseBody
    @PostMapping("/monitoring/data/refresh")
    public Map<String,Object> dataRefresh(@RequestBody Map<String,String> map, HttpServletRequest servletRequest) {

        List<MonitoringDataDto > list = new ArrayList<>();

        Map<String,Object> result = new HashMap<>();

        result.put("data",list);

        return result;
    }

}
