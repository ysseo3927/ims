package com.kt.ims.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class MonitoringController {

    @PostMapping("/monitoring")
    public String getMonitoring(Model model, HttpServletRequest servletRequest, HttpSession httpSession) {
        return "monitoring";
    }
}
