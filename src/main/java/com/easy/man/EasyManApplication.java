package com.easy.man;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

/***
 * @author danny
 *
 * @date 2018-12-28
 */
@SpringBootApplication(scanBasePackages = "com.easy.man")
@MapperScan("com.easy.man.mapper")
@EnableScheduling
public class EasyManApplication {



	public static void main(String[] args) {

		SpringApplication.run(EasyManApplication.class, args);

	}

}

