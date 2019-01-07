package com.easy.man.test;

import com.easy.man.service.INodesService;
import com.easy.man.service.IServiceGcDetailService;
import com.easy.man.service.IServiceHealthService;
import com.easy.man.service.IServicesService;
import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
    private INodesService iNodesService;

    @Autowired
    private IServicesService iServicesService;

    @Autowired
    private IServiceGcDetailService iServiceGcDetailService;

    @Autowired
    private IServiceHealthService iServiceHealthService;

    @RequestMapping("/test")
    public void test(){
        System.out.println(dubboName);
        System.out.println(define);

        iNodesService.list();
        iServicesService.list();
        iServiceGcDetailService.list();
        iServiceHealthService.list();
    }


}
