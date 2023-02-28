package com.starters.ityogurt;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.bind.annotation.CrossOrigin;

@SpringBootApplication
@EnableScheduling
@CrossOrigin(origins = "http://ityogurt.net, http://3.7.76.29/")
public class ItYogurtApplication {

	public static void main(String[] args) {
		SpringApplication.run(ItYogurtApplication.class, args);
	}

}
