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

        String imei = (String)map.get("imei");
        String lte = (String)map.get("lte");
        String carNum = (String)map.get("carNum");
        String pscarNum = (String)map.get("pscarNum");

        System.out.println(imei);
        System.out.println(lte);
        System.out.println(carNum);
        System.out.println(pscarNum);

        Map<String,Object> result = new HashMap<>();

        result.put("data",null);

        return result;
    }
    @ResponseBody
    @PostMapping("/monitoring/data/refresh")
    public Map<String,Object> dataRefresh(@RequestBody Map<String,String> map, HttpServletRequest servletRequest) {

        List<MonitoringDataDto > list = new ArrayList<>();

        for(int i=0; i < 100; i++){
            MonitoringDataDto monitoringDataDto = MonitoringDataDto.builder()
                    .no(i+"")
                    .line(monitoringService.genLine())
                    .car(monitoringService.genCar())
                    .pscar(monitoringService.genPscar())
                    .imei(monitoringService.genImei())
                    .lte(monitoringService.genLte())
                    .ionm(monitoringService.getIonm())
                    .ions(monitoringService.getIons())
                    .systemStatus(monitoringService.genSystemStatus())
                    .ionStatus(monitoringService.genIonStatus())
                    .iaq(monitoringService.genIaq()+"")
                    .gp10(monitoringService.genGp10()+"")
                    .gp2_5(monitoringService.genGp2_5()+"")
                    .gp1_0(monitoringService.genGp1_0()+"")
                    .tvoc(monitoringService.genTvoc()+"")
                    .co2(monitoringService.genCo2()+"")
                    .temp(monitoringService.genTemp()+"")
                    .humi(monitoringService.genHumi()+"")
                    .build();
            list.add(monitoringDataDto);
        }
        Map<String,Object> result = new HashMap<>();

        result.put("data",list);

        return result;
    }

}
