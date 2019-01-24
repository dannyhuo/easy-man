package com.easy.man.controller.gcmonitor;


import com.easy.man.entity.vo.ServiceVO;
import com.easy.man.service.IServicesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author danny
 * @since 2019-01-07
 */
@RestController
@RequestMapping("/gc")
public class ServiceGcDetailController {

    @Autowired
    private IServicesService iServicesService;

    @RequestMapping(value = "/monitor")
    public ModelAndView monitorGc(ModelAndView mav){
        mav.setViewName("gc-monitor/gc-monitor");
        return mav;
    }

    @RequestMapping(value = "/monitor/loadData")
    public List<ServiceVO> loadData(ModelAndView mav){
        //默认展示最近三天
        return iServicesService.listServiceAndGcByPage(3);
    }

}
