package com.easy.man.controller.servicemanager;


import com.easy.man.service.IServiceGcDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author danny
 * @since 2019-01-07
 */
@RestController
@RequestMapping("/service-gc-detail")
public class ServiceGcDetailController {

    @Autowired
    private IServiceGcDetailService iServiceGcDetailService;

}
