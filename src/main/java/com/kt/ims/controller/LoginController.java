package com.kt.ims.controller;

import com.kt.ims.domain.ImsMember;
import com.kt.ims.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class LoginController {

    @Autowired
    LoginService loginService;

    @GetMapping("/")
    public String login() {
        return "login";
    }


    @ResponseBody
    @PostMapping("/login/check")
    public Map<String,String> checkLogin(@RequestBody Map<String,String> map, HttpServletRequest httpServletRequest) {

        String id = map.get("id");
        String password = map.get("password");

        ImsMember member = loginService.getMember(id,password);

        Map<String,String> result = new HashMap<>();

        if(member != null){
            result.put("result","success");
            result.put("id",id);
            result.put("password",password);

            HttpSession session = httpServletRequest.getSession();

            session.setMaxInactiveInterval(600);
            session.setAttribute("member", member);

        }else{
            result.put("result","fail");
        }

        return result;
    }
}
