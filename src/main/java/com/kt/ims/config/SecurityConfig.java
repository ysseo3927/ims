package com.kt.ims.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http.httpBasic().and().authorizeRequests()
                .antMatchers("/").permitAll()
                .antMatchers("/login").permitAll()
                .antMatchers("/index").permitAll()
                .antMatchers("/index/data/refresh").permitAll()
                .antMatchers("/monitoring").permitAll()
                .antMatchers("/config").permitAll()
                .antMatchers("/log").permitAll()
                .antMatchers("/device").permitAll()
                .antMatchers("/graph").permitAll()
                //.anyRequest().authenticated()
                .and().logout().permitAll()
                .and().formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/login-process")
                .defaultSuccessUrl("/main")
                .and().csrf().disable();

    }
}
