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

        String refreshYn = (String)map.get("refreshYn");  //Y, N
        String avgCalcTime = (String)map.get("avgCalcTime"); // 01, 24

        DashboardDataDto dashboardDataDto = null;

        if("Y".equals(refreshYn)){
            if("01".equals(avgCalcTime)){
                System.out.println("1시간단위평균");
                double dashboardDataAvgIaqAllLine = mainService.genIaq();

                dashboardDataDto = DashboardDataDto.builder()
                        .dashboardDataAvgIaqAllLine(dashboardDataAvgIaqAllLine)
                        .dashboardDataLineAvgIaqDto(
                                DashboardDataLineAvgIaqDto.builder().line1(mainService.genIaq())
                                                                    .line2(mainService.genIaq())
                                                                    .line3(mainService.genIaq())
                                                                    .line4(mainService.genIaq())
                                                                    .line5(mainService.genIaq())
                                                                    .line6(mainService.genIaq())
                                                                    .line7(mainService.genIaq())
                                                                    .line8(mainService.genIaq())
                                        .build())
                        .dashboardDataTimeAvgIaqDto(
                                DashboardDataTimeAvgIaqDto.builder().hour4(mainService.genIaq())
                                        .hour5(mainService.genIaq())
                                        .hour6(mainService.genIaq())
                                        .hour7(mainService.genIaq())
                                        .hour8(mainService.genIaq())
                                        .hour9(mainService.genIaq())
                                        .hour10(mainService.genIaq())
                                        .hour11(mainService.genIaq())
                                        .hour12(mainService.genIaq())
                                        .hour13(mainService.genIaq())
                                        .hour14(mainService.genIaq())
                                        .hour15(mainService.genIaq())
                                        .hour16(mainService.genIaq())
                                        .hour17(mainService.genIaq())
                                        .hour18(mainService.genIaq())
                                        .hour19(mainService.genIaq())
                                        .hour20(mainService.genIaq())
                                        .hour21(mainService.genIaq())
                                        .hour22(mainService.genIaq())
                                        .hour23(mainService.genIaq())
                                        .hour24(mainService.genIaq())
                                        .build())
                        .dashboardDataAvgIaqDto(
                                DashboardDataAvgIaqDto.builder().line1(mainService.genIaq())
                                        .line2(mainService.genIaq())
                                        .line3(mainService.genIaq())
                                        .line4(mainService.genIaq())
                                        .line5(mainService.genIaq())
                                        .line6(mainService.genIaq())
                                        .line7(mainService.genIaq())
                                        .line8(mainService.genIaq())
                                        .build())
                        .dashboardDataAvgGp10Dto(
                                DashboardDataAvgGp10Dto.builder().line1(mainService.genGp10())
                                        .line2(mainService.genGp10())
                                        .line3(mainService.genGp10())
                                        .line4(mainService.genGp10())
                                        .line5(mainService.genGp10())
                                        .line6(mainService.genGp10())
                                        .line7(mainService.genGp10())
                                        .line8(mainService.genGp10())
                                        .build())
                        .dashboardDataAvgGp1_0Dto(
                                DashboardDataAvgGp1_0Dto.builder().line1(mainService.genGp1_0())
                                        .line2(mainService.genGp1_0())
                                        .line3(mainService.genGp1_0())
                                        .line4(mainService.genGp1_0())
                                        .line5(mainService.genGp1_0())
                                        .line6(mainService.genGp1_0())
                                        .line7(mainService.genGp1_0())
                                        .line8(mainService.genGp1_0())
                                        .build())
                        .dashboardDataAvgGp2_5Dto(
                                DashboardDataAvgGp2_5Dto.builder().line1(mainService.genGp2_5())
                                        .line2(mainService.genGp2_5())
                                        .line3(mainService.genGp2_5())
                                        .line4(mainService.genGp2_5())
                                        .line5(mainService.genGp2_5())
                                        .line6(mainService.genGp2_5())
                                        .line7(mainService.genGp2_5())
                                        .line8(mainService.genGp2_5())
                                        .build())
                        .dashboardDataAvgVocDto(
                                DashboardDataAvgVocDto.builder().line1(mainService.genTvoc())
                                        .line2(mainService.genTvoc())
                                        .line3(mainService.genTvoc())
                                        .line4(mainService.genTvoc())
                                        .line5(mainService.genTvoc())
                                        .line6(mainService.genTvoc())
                                        .line7(mainService.genTvoc())
                                        .line8(mainService.genTvoc())
                                        .build())
                        .dashboardDataAvgCo2Dto(
                                DashboardDataAvgCo2Dto.builder().line1(mainService.genCo2())
                                        .line2(mainService.genCo2())
                                        .line3(mainService.genCo2())
                                        .line4(mainService.genCo2())
                                        .line5(mainService.genCo2())
                                        .line6(mainService.genCo2())
                                        .line7(mainService.genCo2())
                                        .line8(mainService.genCo2())
                                        .build())
                        .dashboardDataAvgTempDto(
                                DashboardDataAvgTempDto.builder().line1(mainService.genTemp())
                                        .line2(mainService.genTemp())
                                        .line3(mainService.genTemp())
                                        .line4(mainService.genTemp())
                                        .line5(mainService.genTemp())
                                        .line6(mainService.genTemp())
                                        .line7(mainService.genTemp())
                                        .line8(mainService.genTemp())
                                        .build())
                        .dashboardDataAvgHumiDto(
                                DashboardDataAvgHumiDto.builder().line1(mainService.genHumi())
                                        .line2(mainService.genHumi())
                                        .line3(mainService.genHumi())
                                        .line4(mainService.genHumi())
                                        .line5(mainService.genHumi())
                                        .line6(mainService.genHumi())
                                        .line7(mainService.genHumi())
                                        .line8(mainService.genHumi())
                                        .build())
                        .build();
            }else{
                System.out.println("24시간단위평균");
            }
        }

        Map<String,Object> result = new HashMap<>();

        result.put("dashboardData",dashboardDataDto);

        return result;
    }

}
