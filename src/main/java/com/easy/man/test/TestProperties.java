package com.easy.man.test;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@PropertySource(value = {"classpath:/config/dubbo.properties","classpath:/config/define.properties"})
public class TestProperties {

    @Value("${dubbo.name}")
    private String dubboName;

    @Value("${easy.man.define1}")
    private String define;

    @Value("${easy.define.test}")
    private String defineApp;

    @RequestMapping("/test")
    public void test(){
        System.out.println(dubboName);
        System.out.println(define);
        System.out.println(defineApp);
    }


}
