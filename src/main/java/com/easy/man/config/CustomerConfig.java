package com.easy.man.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration
public class CustomerConfig {

    @Value("${easy.man.bin}")
    private String easyManBin;


}
