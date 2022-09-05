package com.kt.ims.controller;

import com.kt.ims.domain.ImsAssign;
import com.kt.ims.domain.ImsMember;
import com.kt.ims.service.DeviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class DeviceController {

    @Autowired
    DeviceService deviceService;

    @PostMapping("/device")
    public String getMain(Model model, HttpServletRequest servletRequest, HttpSession httpSession) {
        ImsMember member = (ImsMember)httpSession.getAttribute("member");

        if(member == null){
            return "login";
        }

        return "device";
    }

    @ResponseBody
    @PostMapping("/device/search")
    public Map<String, Object> dataSearch(@RequestBody Map<String, String> map, HttpServletRequest servletRequest) {

        String imei = (String) map.get("imei");
        String line = (String) map.get("line");
        String car = (String) map.get("car");
        String psCar = (String) map.get("psCar");
        String lteS = (String) map.get("lteS");

        System.out.println(imei);
        System.out.println(line);
        System.out.println(car);
        System.out.println(psCar);
        System.out.println(lteS);

        Map<String, Object> result = new HashMap<>();

        List<ImsAssign> deviceDatas = deviceService.getDeviceDatas(imei, line, car, psCar, lteS);

        result.put("data",deviceDatas);

        return result;
    }

    @ResponseBody
    @PostMapping("/device/remove")
    public Map<String, Object> remove(@RequestBody Map<String, String> map, HttpServletRequest servletRequest, HttpSession httpSession) {

        String rowId = (String) map.get("rowId");          //rowId

        String removeResult = deviceService.remove(rowId);
        Map<String, Object> result = new HashMap<>();
        result.put("data",removeResult);
        return result;
    }

    @ResponseBody
    @PostMapping("/device/modify/save")
    public Map<String, Object> modify(@RequestBody Map<String, String> map, HttpServletRequest servletRequest, HttpSession httpSession) {

        String no = (String) map.get("no");
        String imei = (String) map.get("imei");
        String line = (String) map.get("line");
        String car = (String) map.get("car");
        String pscar = (String) map.get("pscar");
        String lte = (String) map.get("lte");
        String ionm = (String) map.get("ionm");
        String ions = (String) map.get("ions");
        String ionStatus = (String) map.get("ion-status");
        String etc = (String) map.get("etc");


        String removeResult = deviceService.modify(no,imei,line,car,pscar,lte,ionm,ions,ionStatus,etc);
        Map<String, Object> result = new HashMap<>();
        result.put("data",removeResult);
        return result;
    }

    @ResponseBody
    @PostMapping("/device/check/imei")
    public Map<String, Object> checkImei(@RequestBody Map<String, String> map, HttpServletRequest servletRequest, HttpSession httpSession) {

        String imei = (String) map.get("imei");

        String checkResult = "success";

        ImsAssign imsAssign = deviceService.checkImei(imei);
        Map<String, Object> result = new HashMap<>();
        if(imsAssign != null){
            checkResult = "fail";
        }
        result.put("data",checkResult);
        return result;
    }

    @ResponseBody
    @PostMapping("/device/regist/save")
    public Map<String, Object> regist(@RequestBody Map<String, String> map, HttpServletRequest servletRequest, HttpSession httpSession) {

        String imei = (String) map.get("imei");
        String line = (String) map.get("line");
        String car = (String) map.get("car");
        String pscar = (String) map.get("pscar");
        String lte = (String) map.get("lte");
        String ionm = (String) map.get("ionm");
        String ions = (String) map.get("ions");
        String ionStatus = (String) map.get("ion-status");
        String etc = (String) map.get("etc");

        String registResult = deviceService.regist(imei,line,car,pscar,lte,ionm,ions,ionStatus,etc);
        Map<String, Object> result = new HashMap<>();

        result.put("data",registResult);
        return result;
    }

}
