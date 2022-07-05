package com.kt.ims.controller;

import com.kt.ims.domain.ImsMember;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class StatController {

    @PostMapping("/stat")
    public String getMain(Model model, HttpServletRequest servletRequest, HttpSession httpSession) {
        ImsMember member = (ImsMember)httpSession.getAttribute("member");

        if(member == null){
            return "login";
        }

        return "stat";
    }

}
