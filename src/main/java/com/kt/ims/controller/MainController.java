package com.kt.ims.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class MainController {
    @GetMapping("/login")
    public String login() {
        return "login";
    }


    @PostMapping("/")
    public String getMain(Model model, HttpServletRequest servletRequest, HttpSession httpSession) {
        return "index";

    }

}
