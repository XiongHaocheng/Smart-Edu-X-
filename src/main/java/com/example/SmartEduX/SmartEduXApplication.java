package com.example.SmartEduX;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.example.SmartEdux.Mapper")
public class SmartEduXApplication {
	public static void main(String[] args) {
		SpringApplication.run(SmartEduXApplication.class, args);
	}

}
