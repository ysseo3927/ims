package com.kt.ionizer.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http.httpBasic().and().authorizeRequests()
                .antMatchers("/login").permitAll()
                .antMatchers("/main").permitAll()
                .antMatchers("/request").permitAll()
                //.anyRequest().authenticated()
                .and().logout().permitAll()
                .and().formLogin()
                .defaultSuccessUrl("/main")
                .and().csrf().disable();

    }
}
