package com.kt.ims.controller;

import com.kt.ims.domain.ImsMember;
import com.kt.ims.dto.*;
import com.kt.ims.service.MainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class MainController {

    @Autowired
    MainService mainService;

    @PostMapping("/index")
    public String getMain(Model model, HttpServletRequest servletRequest, HttpSession httpSession) {
        ImsMember member = (ImsMember)httpSession.getAttribute("member");

        if(member == null){
            return "login";
        }

        return "index";

    }

    @ResponseBody
    @PostMapping("/index/data/refresh")
    public Map<String,Object> dataRefresh(@RequestBody Map<String,String> map, HttpServletRequest servletRequest) {

        String refreshYn = (String) map.get("refreshYn");  //Y, N
        Integer hour = Integer.valueOf(map.get("avgCalcTime")); // 01, 24

        MainDataDto mainDataDto = new MainDataDto();

        if ("Y".equals(refreshYn)) {
            double lineAllAvgIaq = mainService.getAllLineAvgIaq(hour);
            mainDataDto.setLineAllAvgIaq(lineAllAvgIaq);

            List<HashMap<String, Object>> timeTableAllLineAvgIaqs = mainService.getTimeTableAllLineAvgIaq();

            for (HashMap<String, Object> timeTableAllLineAvgIaq : timeTableAllLineAvgIaqs) {
                String time = String.valueOf(timeTableAllLineAvgIaq.get("time_table"));
                Double iaq = (double) timeTableAllLineAvgIaq.get("iaq");

                switch (time) {
                    case "04:00":
                        mainDataDto.setTime04AvgIaq(iaq);
                        break;
                    case "05:00":
                        mainDataDto.setTime05AvgIaq(iaq);
                        break;
                    case "06:00":
                        mainDataDto.setTime06AvgIaq(iaq);
                        break;
                    case "07:00":
                        mainDataDto.setTime07AvgIaq(iaq);
                        break;
                    case "08:00":
                        mainDataDto.setTime08AvgIaq(iaq);
                        break;
                    case "09:00":
                        mainDataDto.setTime09AvgIaq(iaq);
                        break;
                    case "10:00":
                        mainDataDto.setTime10AvgIaq(iaq);
                        break;
                    case "11:00":
                        mainDataDto.setTime11AvgIaq(iaq);
                        break;
                    case "12:00":
                        mainDataDto.setTime12AvgIaq(iaq);
                        break;
                    case "13:00":
                        mainDataDto.setTime13AvgIaq(iaq);
                        break;
                    case "14:00":
                        mainDataDto.setTime14AvgIaq(iaq);
                        break;
                    case "15:00":
                        mainDataDto.setTime15AvgIaq(iaq);
                        break;
                    case "16:00":
                        mainDataDto.setTime16AvgIaq(iaq);
                        break;
                    case "17:00":
                        mainDataDto.setTime17AvgIaq(iaq);
                        break;
                    case "18:00":
                        mainDataDto.setTime18AvgIaq(iaq);
                        break;
                    case "19:00":
                        mainDataDto.setTime19AvgIaq(iaq);
                        break;
                    case "20:00":
                        mainDataDto.setTime20AvgIaq(iaq);
                        break;
                    case "21:00":
                        mainDataDto.setTime21AvgIaq(iaq);
                        break;
                    case "22:00":
                        mainDataDto.setTime22AvgIaq(iaq);
                        break;
                    case "23:00":
                        mainDataDto.setTime23AvgIaq(iaq);
                        break;
                }

            }

            if (mainDataDto.getTime04AvgIaq() == null) mainDataDto.setTime04AvgIaq(0.0);
            if (mainDataDto.getTime05AvgIaq() == null) mainDataDto.setTime05AvgIaq(0.0);
            if (mainDataDto.getTime06AvgIaq() == null) mainDataDto.setTime06AvgIaq(0.0);
            if (mainDataDto.getTime07AvgIaq() == null) mainDataDto.setTime07AvgIaq(0.0);
            if (mainDataDto.getTime08AvgIaq() == null) mainDataDto.setTime08AvgIaq(0.0);
            if (mainDataDto.getTime09AvgIaq() == null) mainDataDto.setTime09AvgIaq(0.0);
            if (mainDataDto.getTime10AvgIaq() == null) mainDataDto.setTime10AvgIaq(0.0);
            if (mainDataDto.getTime11AvgIaq() == null) mainDataDto.setTime11AvgIaq(0.0);
            if (mainDataDto.getTime12AvgIaq() == null) mainDataDto.setTime12AvgIaq(0.0);
            if (mainDataDto.getTime13AvgIaq() == null) mainDataDto.setTime13AvgIaq(0.0);
            if (mainDataDto.getTime14AvgIaq() == null) mainDataDto.setTime14AvgIaq(0.0);
            if (mainDataDto.getTime15AvgIaq() == null) mainDataDto.setTime15AvgIaq(0.0);
            if (mainDataDto.getTime16AvgIaq() == null) mainDataDto.setTime16AvgIaq(0.0);
            if (mainDataDto.getTime17AvgIaq() == null) mainDataDto.setTime17AvgIaq(0.0);
            if (mainDataDto.getTime18AvgIaq() == null) mainDataDto.setTime18AvgIaq(0.0);
            if (mainDataDto.getTime19AvgIaq() == null) mainDataDto.setTime19AvgIaq(0.0);
            if (mainDataDto.getTime20AvgIaq() == null) mainDataDto.setTime20AvgIaq(0.0);
            if (mainDataDto.getTime21AvgIaq() == null) mainDataDto.setTime21AvgIaq(0.0);
            if (mainDataDto.getTime22AvgIaq() == null) mainDataDto.setTime22AvgIaq(0.0);
            if (mainDataDto.getTime23AvgIaq() == null) mainDataDto.setTime23AvgIaq(0.0);

            List<HashMap<String, Object>> allLineAvgDatas = mainService.getAllLineAvgData(hour);

            for (HashMap<String, Object> allLineAvgData : allLineAvgDatas) {
                String line = String.valueOf(allLineAvgData.get("ima_line"));
                if ("1".equals(line)) {
                    mainDataDto.setLine1AvgIaq((double) allLineAvgData.get("iaq"));
                    mainDataDto.setLine1AvgGp10((double) allLineAvgData.get("gp10"));
                    mainDataDto.setLine1AvgGp1_0((double) allLineAvgData.get("gp1_0"));
                    mainDataDto.setLine1AvgGp2_5((double) allLineAvgData.get("gp2_5"));
                    mainDataDto.setLine1AvgTvoc((double) allLineAvgData.get("voc"));
                    mainDataDto.setLine1AvgCo2((double) allLineAvgData.get("co2"));
                    mainDataDto.setLine1AvgTemp((double) allLineAvgData.get("temp"));
                    mainDataDto.setLine1AvgHumi((double) allLineAvgData.get("humi"));
                } else if ("2".equals(line)) {
                    mainDataDto.setLine2AvgIaq((double) allLineAvgData.get("iaq"));
                    mainDataDto.setLine2AvgGp10((double) allLineAvgData.get("gp10"));
                    mainDataDto.setLine2AvgGp1_0((double) allLineAvgData.get("gp1_0"));
                    mainDataDto.setLine2AvgGp2_5((double) allLineAvgData.get("gp2_5"));
                    mainDataDto.setLine2AvgTvoc((double) allLineAvgData.get("voc"));
                    mainDataDto.setLine2AvgCo2((double) allLineAvgData.get("co2"));
                    mainDataDto.setLine2AvgTemp((double) allLineAvgData.get("temp"));
                    mainDataDto.setLine2AvgHumi((double) allLineAvgData.get("humi"));
                } else if ("3".equals(line)) {
                    mainDataDto.setLine3AvgIaq((double) allLineAvgData.get("iaq"));
                    mainDataDto.setLine3AvgGp10((double) allLineAvgData.get("gp10"));
                    mainDataDto.setLine3AvgGp1_0((double) allLineAvgData.get("gp1_0"));
                    mainDataDto.setLine3AvgGp2_5((double) allLineAvgData.get("gp2_5"));
                    mainDataDto.setLine3AvgTvoc((double) allLineAvgData.get("voc"));
                    mainDataDto.setLine3AvgCo2((double) allLineAvgData.get("co2"));
                    mainDataDto.setLine3AvgTemp((double) allLineAvgData.get("temp"));
                    mainDataDto.setLine3AvgHumi((double) allLineAvgData.get("humi"));
                } else if ("4".equals(line)) {
                    mainDataDto.setLine4AvgIaq((double) allLineAvgData.get("iaq"));
                    mainDataDto.setLine4AvgGp10((double) allLineAvgData.get("gp10"));
                    mainDataDto.setLine4AvgGp1_0((double) allLineAvgData.get("gp1_0"));
                    mainDataDto.setLine4AvgGp2_5((double) allLineAvgData.get("gp2_5"));
                    mainDataDto.setLine4AvgTvoc((double) allLineAvgData.get("voc"));
                    mainDataDto.setLine4AvgCo2((double) allLineAvgData.get("co2"));
                    mainDataDto.setLine4AvgTemp((double) allLineAvgData.get("temp"));
                    mainDataDto.setLine4AvgHumi((double) allLineAvgData.get("humi"));
                } else if ("5".equals(line)) {
                    mainDataDto.setLine5AvgIaq((double) allLineAvgData.get("iaq"));
                    mainDataDto.setLine5AvgGp10((double) allLineAvgData.get("gp10"));
                    mainDataDto.setLine5AvgGp1_0((double) allLineAvgData.get("gp1_0"));
                    mainDataDto.setLine5AvgGp2_5((double) allLineAvgData.get("gp2_5"));
                    mainDataDto.setLine5AvgTvoc((double) allLineAvgData.get("voc"));
                    mainDataDto.setLine5AvgCo2((double) allLineAvgData.get("co2"));
                    mainDataDto.setLine5AvgTemp((double) allLineAvgData.get("temp"));
                    mainDataDto.setLine5AvgHumi((double) allLineAvgData.get("humi"));
                } else if ("6".equals(line)) {
                    mainDataDto.setLine6AvgIaq((double) allLineAvgData.get("iaq"));
                    mainDataDto.setLine6AvgGp10((double) allLineAvgData.get("gp10"));
                    mainDataDto.setLine6AvgGp1_0((double) allLineAvgData.get("gp1_0"));
                    mainDataDto.setLine6AvgGp2_5((double) allLineAvgData.get("gp2_5"));
                    mainDataDto.setLine6AvgTvoc((double) allLineAvgData.get("voc"));
                    mainDataDto.setLine6AvgCo2((double) allLineAvgData.get("co2"));
                    mainDataDto.setLine6AvgTemp((double) allLineAvgData.get("temp"));
                    mainDataDto.setLine6AvgHumi((double) allLineAvgData.get("humi"));
                } else if ("7".equals(line)) {
                    mainDataDto.setLine7AvgIaq((double) allLineAvgData.get("iaq"));
                    mainDataDto.setLine7AvgGp10((double) allLineAvgData.get("gp10"));
                    mainDataDto.setLine7AvgGp1_0((double) allLineAvgData.get("gp1_0"));
                    mainDataDto.setLine7AvgGp2_5((double) allLineAvgData.get("gp2_5"));
                    mainDataDto.setLine7AvgTvoc((double) allLineAvgData.get("voc"));
                    mainDataDto.setLine7AvgCo2((double) allLineAvgData.get("co2"));
                    mainDataDto.setLine7AvgTemp((double) allLineAvgData.get("temp"));
                    mainDataDto.setLine7AvgHumi((double) allLineAvgData.get("humi"));
                } else if ("8".equals(line)) {
                    mainDataDto.setLine8AvgIaq((double) allLineAvgData.get("iaq"));
                    mainDataDto.setLine8AvgGp10((double) allLineAvgData.get("gp10"));
                    mainDataDto.setLine8AvgGp1_0((double) allLineAvgData.get("gp1_0"));
                    mainDataDto.setLine8AvgGp2_5((double) allLineAvgData.get("gp2_5"));
                    mainDataDto.setLine8AvgTvoc((double) allLineAvgData.get("voc"));
                    mainDataDto.setLine8AvgCo2((double) allLineAvgData.get("co2"));
                    mainDataDto.setLine8AvgTemp((double) allLineAvgData.get("temp"));
                    mainDataDto.setLine8AvgHumi((double) allLineAvgData.get("humi"));
                }

                if (mainDataDto.getLine1AvgIaq() == null) mainDataDto.setLine1AvgIaq(0.0);
                if (mainDataDto.getLine1AvgGp10() == null) mainDataDto.setLine1AvgGp10(0.0);
                if (mainDataDto.getLine1AvgGp1_0() == null) mainDataDto.setLine1AvgGp1_0(0.0);
                if (mainDataDto.getLine1AvgGp2_5() == null) mainDataDto.setLine1AvgGp2_5(0.0);
                if (mainDataDto.getLine1AvgTvoc() == null) mainDataDto.setLine1AvgTvoc(0.0);
                if (mainDataDto.getLine1AvgCo2() == null) mainDataDto.setLine1AvgCo2(0.0);
                if (mainDataDto.getLine1AvgTemp() == null) mainDataDto.setLine1AvgTemp(0.0);
                if (mainDataDto.getLine1AvgHumi() == null) mainDataDto.setLine1AvgHumi(0.0);

                if (mainDataDto.getLine2AvgIaq() == null) mainDataDto.setLine2AvgIaq(0.0);
                if (mainDataDto.getLine2AvgGp10() == null) mainDataDto.setLine2AvgGp10(0.0);
                if (mainDataDto.getLine2AvgGp1_0() == null) mainDataDto.setLine2AvgGp1_0(0.0);
                if (mainDataDto.getLine2AvgGp2_5() == null) mainDataDto.setLine2AvgGp2_5(0.0);
                if (mainDataDto.getLine2AvgTvoc() == null) mainDataDto.setLine2AvgTvoc(0.0);
                if (mainDataDto.getLine2AvgCo2() == null) mainDataDto.setLine2AvgCo2(0.0);
                if (mainDataDto.getLine2AvgTemp() == null) mainDataDto.setLine2AvgTemp(0.0);
                if (mainDataDto.getLine2AvgHumi() == null) mainDataDto.setLine2AvgHumi(0.0);

                if (mainDataDto.getLine3AvgIaq() == null) mainDataDto.setLine3AvgIaq(0.0);
                if (mainDataDto.getLine3AvgGp10() == null) mainDataDto.setLine3AvgGp10(0.0);
                if (mainDataDto.getLine3AvgGp1_0() == null) mainDataDto.setLine3AvgGp1_0(0.0);
                if (mainDataDto.getLine3AvgGp2_5() == null) mainDataDto.setLine3AvgGp2_5(0.0);
                if (mainDataDto.getLine3AvgTvoc() == null) mainDataDto.setLine3AvgTvoc(0.0);
                if (mainDataDto.getLine3AvgCo2() == null) mainDataDto.setLine3AvgCo2(0.0);
                if (mainDataDto.getLine3AvgTemp() == null) mainDataDto.setLine3AvgTemp(0.0);
                if (mainDataDto.getLine3AvgHumi() == null) mainDataDto.setLine3AvgHumi(0.0);

                if (mainDataDto.getLine4AvgIaq() == null) mainDataDto.setLine4AvgIaq(0.0);
                if (mainDataDto.getLine4AvgGp10() == null) mainDataDto.setLine4AvgGp10(0.0);
                if (mainDataDto.getLine4AvgGp1_0() == null) mainDataDto.setLine4AvgGp1_0(0.0);
                if (mainDataDto.getLine4AvgGp2_5() == null) mainDataDto.setLine4AvgGp2_5(0.0);
                if (mainDataDto.getLine4AvgTvoc() == null) mainDataDto.setLine4AvgTvoc(0.0);
                if (mainDataDto.getLine4AvgCo2() == null) mainDataDto.setLine4AvgCo2(0.0);
                if (mainDataDto.getLine4AvgTemp() == null) mainDataDto.setLine4AvgTemp(0.0);
                if (mainDataDto.getLine4AvgHumi() == null) mainDataDto.setLine4AvgHumi(0.0);

                if (mainDataDto.getLine5AvgIaq() == null) mainDataDto.setLine5AvgIaq(0.0);
                if (mainDataDto.getLine5AvgGp10() == null) mainDataDto.setLine5AvgGp10(0.0);
                if (mainDataDto.getLine5AvgGp1_0() == null) mainDataDto.setLine5AvgGp1_0(0.0);
                if (mainDataDto.getLine5AvgGp2_5() == null) mainDataDto.setLine5AvgGp2_5(0.0);
                if (mainDataDto.getLine5AvgTvoc() == null) mainDataDto.setLine5AvgTvoc(0.0);
                if (mainDataDto.getLine5AvgCo2() == null) mainDataDto.setLine5AvgCo2(0.0);
                if (mainDataDto.getLine5AvgTemp() == null) mainDataDto.setLine5AvgTemp(0.0);
                if (mainDataDto.getLine5AvgHumi() == null) mainDataDto.setLine5AvgHumi(0.0);

                if (mainDataDto.getLine6AvgIaq() == null) mainDataDto.setLine6AvgIaq(0.0);
                if (mainDataDto.getLine6AvgGp10() == null) mainDataDto.setLine6AvgGp10(0.0);
                if (mainDataDto.getLine6AvgGp1_0() == null) mainDataDto.setLine6AvgGp1_0(0.0);
                if (mainDataDto.getLine6AvgGp2_5() == null) mainDataDto.setLine6AvgGp2_5(0.0);
                if (mainDataDto.getLine6AvgTvoc() == null) mainDataDto.setLine6AvgTvoc(0.0);
                if (mainDataDto.getLine6AvgCo2() == null) mainDataDto.setLine6AvgCo2(0.0);
                if (mainDataDto.getLine6AvgTemp() == null) mainDataDto.setLine6AvgTemp(0.0);
                if (mainDataDto.getLine6AvgHumi() == null) mainDataDto.setLine6AvgHumi(0.0);

                if (mainDataDto.getLine7AvgIaq() == null) mainDataDto.setLine7AvgIaq(0.0);
                if (mainDataDto.getLine7AvgGp10() == null) mainDataDto.setLine7AvgGp10(0.0);
                if (mainDataDto.getLine7AvgGp1_0() == null) mainDataDto.setLine7AvgGp1_0(0.0);
                if (mainDataDto.getLine7AvgGp2_5() == null) mainDataDto.setLine7AvgGp2_5(0.0);
                if (mainDataDto.getLine7AvgTvoc() == null) mainDataDto.setLine7AvgTvoc(0.0);
                if (mainDataDto.getLine7AvgCo2() == null) mainDataDto.setLine7AvgCo2(0.0);
                if (mainDataDto.getLine7AvgTemp() == null) mainDataDto.setLine7AvgTemp(0.0);
                if (mainDataDto.getLine7AvgHumi() == null) mainDataDto.setLine7AvgHumi(0.0);

                if (mainDataDto.getLine8AvgIaq() == null) mainDataDto.setLine8AvgIaq(0.0);
                if (mainDataDto.getLine8AvgGp10() == null) mainDataDto.setLine8AvgGp10(0.0);
                if (mainDataDto.getLine8AvgGp1_0() == null) mainDataDto.setLine8AvgGp1_0(0.0);
                if (mainDataDto.getLine8AvgGp2_5() == null) mainDataDto.setLine8AvgGp2_5(0.0);
                if (mainDataDto.getLine8AvgTvoc() == null) mainDataDto.setLine8AvgTvoc(0.0);
                if (mainDataDto.getLine8AvgCo2() == null) mainDataDto.setLine8AvgCo2(0.0);
                if (mainDataDto.getLine8AvgTemp() == null) mainDataDto.setLine8AvgTemp(0.0);
                if (mainDataDto.getLine8AvgHumi() == null) mainDataDto.setLine8AvgHumi(0.0);

            }
        }

        Map<String, Object> result = new HashMap<>();

        result.put("mainDataDto", mainDataDto);

        return result;
    }
}
