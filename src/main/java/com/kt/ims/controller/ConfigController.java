package com.kt.ims.controller;

import com.kt.ims.domain.ImsMember;
import com.kt.ims.dto.LogDataDto;
import com.kt.ims.service.ConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.ObjectInputFilter;
import java.sql.Timestamp;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ConfigController {

    @Autowired
    ConfigService configService;

    @PostMapping("/config")
    public String getMain(Model model, HttpServletRequest servletRequest, HttpSession httpSession) {
        ImsMember member = (ImsMember)httpSession.getAttribute("member");

        if(member == null){
            return "login";
        }

        return "config";
    }


    @ResponseBody
    @PostMapping("/config/member/search")
    public Map<String, Object> dataSearch(@RequestBody Map<String, String> map, HttpServletRequest servletRequest) {

        String memberId = (String) map.get("memberId");          //IMEI
        String nickname = (String) map.get("nickname");            //LTE#
        String email = (String) map.get("email");          //노선

        System.out.println(memberId);
        System.out.println(nickname);
        System.out.println(email);

        Map<String, Object> result = new HashMap<>();

        List<ImsMember> memberDatas = configService.getMemberDatas(memberId, nickname, email);

        result.put("data",memberDatas);

        return result;
    }

    @ResponseBody
    @PostMapping("/config/member/change/password")
    public Map<String, Object> changePassword(@RequestBody Map<String, String> map, HttpServletRequest servletRequest, HttpSession httpSession) {

        String rowId = (String) map.get("rowId");          //rowId
        String password = (String) map.get("password");            //password
        System.out.println(rowId);
        System.out.println(password);
        ImsMember imsMember = configService.updateMemberPassword(rowId,password);
        Map<String, Object> result = new HashMap<>();
        result.put("data","success");
        return result;
    }

    @ResponseBody
    @PostMapping("/config/member/signout")
    public Map<String, Object> signout(@RequestBody Map<String, String> map, HttpServletRequest servletRequest, HttpSession httpSession) {

        String rowId = (String) map.get("rowId");          //rowId

        ImsMember imsMember = configService.signout(rowId);
        Map<String, Object> result = new HashMap<>();
        result.put("data","success");
        return result;
    }

    @ResponseBody
    @PostMapping("/config/member/check/overlap/id")
    public Map<String, Object> checkId(@RequestBody Map<String, String> map, HttpServletRequest servletRequest, HttpSession httpSession) {

        String joinId = (String) map.get("joinId");          //rowId

        boolean isOverlap = configService.checkId(joinId);
        Map<String, Object> result = new HashMap<>();
        String resultOverlap = isOverlap ? "fail" : "success";
        result.put("data",resultOverlap);
        return result;
    }

    @ResponseBody
    @PostMapping("/config/member/join")
    public Map<String, Object> join(@RequestBody Map<String, String> map, HttpServletRequest servletRequest, HttpSession httpSession) {

        String joinId = (String) map.get("joinId");
        String joinPassword = (String) map.get("joinPassword1");
        String joinNickname = (String) map.get("joinNickname");
        String joinEmail = (String) map.get("joinEmail");

        System.out.println(joinId);
        System.out.println(joinPassword);
        System.out.println(joinNickname);
        System.out.println(joinEmail);


        boolean isJoin = configService.join(joinId,joinPassword, joinNickname, joinEmail);

        Map<String, Object> result = new HashMap<>();
        result.put("data",isJoin ? "success" : "fail");
        return result;
    }



}
