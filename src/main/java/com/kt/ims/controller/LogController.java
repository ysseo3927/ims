package com.kt.ims.controller;

import com.kt.ims.domain.ImsMember;
import com.kt.ims.dto.LogDataDto;
import com.kt.ims.dto.MonitoringDataDto;
import com.kt.ims.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigInteger;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class LogController {

    @Autowired
    LogService logService;

    @PostMapping("/log")
    public String getMain(Model model, HttpServletRequest servletRequest, HttpSession httpSession) {
        ImsMember member = (ImsMember) httpSession.getAttribute("member");

        if (member == null) {
            return "login";
        }

        return "log";
    }

    @PostMapping("/graph")
    public String getGraphPopup(Model model, HttpServletRequest servletRequest, HttpSession httpSession) {
        ImsMember member = (ImsMember) httpSession.getAttribute("member");

        if (member == null) {
            return "login";
        }

        return "graph";
    }

    @ResponseBody
    @PostMapping("/log/data/search")
    public Map<String, Object> dataSearch(@RequestBody Map<String, String> map, HttpServletRequest servletRequest) {

        String imei = (String) map.get("imei");          //IMEI
        String lte = (String) map.get("lte");            //LTE#
        String line = (String) map.get("line");          //노선
        String carNum = (String) map.get("carNum");      //차량번호
        String pscarNum = (String) map.get("pscarNum");  //객차번호
        String ionStatus = (String) map.get("ionStatus");  //ION상태
        String startDatetime = (String) map.get("startDatetime");  //조회시작일시
        String endDatetime = (String) map.get("endDatetime");  //조회종료일시

        if(startDatetime != null && !"".equals(startDatetime)){
            startDatetime += ":00";
        }
        if(endDatetime != null && !"".equals(endDatetime)){
            endDatetime += ":00";
        }

        System.out.println(imei);
        System.out.println(lte);
        System.out.println(line);
        System.out.println(carNum);
        System.out.println(pscarNum);
        System.out.println(ionStatus);
        System.out.println(startDatetime);
        System.out.println(endDatetime);

        Map<String, Object> result = new HashMap<>();

        List<HashMap<String,Object>> logDatas = logService.getLogDatas(imei, lte, line, carNum, pscarNum,ionStatus,startDatetime,endDatetime);

        List<LogDataDto> logDataDtos = new ArrayList<>();
        int no = 0;

        for(HashMap<String,Object> logData : logDatas){
            no++;
            Integer imdId = (int)logData.get("imd_id");
            Timestamp imdRegdateTs = (Timestamp)logData.get("imd_regdate");
            String imdRegdate = imdRegdateTs.toLocalDateTime().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
            String imaImei = (String)logData.get("ima_imei");
            String imaLteS = (String)logData.get("ima_lte_s");
            String imaLine = (String)logData.get("ima_line");
            String imaCar = (String)logData.get("ima_car");
            String imaPscar = (String)logData.get("ima_ps_car");
            String imaIonStatus = (String)logData.get("ima_ion_status");
            String imdIaq = (String)logData.get("imd_iaq");
            String imdGp10 = (String)logData.get("imd_gp10");
            String imdGp1_0 = (String)logData.get("imd_gp1_0");
            String imdGp2_5 = (String)logData.get("imd_gp2_5");
            String imdVoc = (String)logData.get("imd_voc");
            String imdCo2 = (String)logData.get("imd_co2");
            String imdTemp = (String)logData.get("imd_temp");
            String imdHumi = (String)logData.get("imd_humi");
            String imdEtc = (String)logData.get("imd_etc");

            LogDataDto logDataDto = LogDataDto.builder()
                    .no(no)
                    .imd_id(imdId)
                    .imd_regdate(imdRegdate)
                    .ima_imei(imaImei)
                    .ima_lte_s(imaLteS)
                    .ima_line(imaLine)
                    .ima_car(imaCar)
                    .ima_ps_car(imaPscar)
                    .ima_ion_status(imaIonStatus)
                    .imd_iaq(imdIaq)
                    .imd_gp10(imdGp10)
                    .imd_gp1_0(imdGp1_0)
                    .imd_gp2_5(imdGp2_5)
                    .imd_voc(imdVoc)
                    .imd_co2(imdCo2)
                    .imd_temp(imdTemp)
                    .imd_humi(imdHumi)
                    .imd_etc(imdEtc)
                    .build();

            logDataDtos.add(logDataDto);
        }

        result.put("data",logDataDtos);

        return result;
    }

    @ResponseBody
    @PostMapping("/log/data/remove")
    public Map<String, Object> dataRemove(@RequestBody Map<String, List<Integer>> map, HttpServletRequest servletRequest) {

        List<Integer> imdIds = map.get("imdIds");          //IMEI
        int resultCnt = logService.deleteImdData(imdIds);

        String result = "fail";
        if(resultCnt > 0){
            result = "success";
        }

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("data",result);

        return resultMap;
    }
}
