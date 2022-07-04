package com.kt.ims;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude={DataSourceAutoConfiguration.class})	//우선 db없이 실행
public class ImsApplication {

	public static void main(String[] args) {
		//
		SpringApplication.run(ImsApplication.class, args);
	}

}
