package com.easy.man.controller.servicemanager;


import com.easy.man.entity.po.Services;
import com.easy.man.service.INodesService;
import com.easy.man.service.IServicesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author danny
 * @since 2019-01-07
 */
@RestController
@RequestMapping("/service")
public class ServiceController {

    @Autowired
    private IServicesService iServicesService;

    @Autowired
    private INodesService iNodesService;

    private String redirect = "redirect:/service/list";


    @RequestMapping(value = "/list")
    public ModelAndView nodeLists(ModelAndView mav){
        mav.setViewName("service-manager/service-list");
        mav.addObject("nodeServices", iServicesService.list());
        mav.addObject("nodes", iNodesService.list());
        return mav;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ModelAndView save(Services service){
        System.out.println("save service ..............");
        iServicesService.save(service);
        return new ModelAndView(redirect);
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public ModelAndView update(Services service){
        System.out.println("update service .............." + service.getServiceId());
        iServicesService.updateById(service);
        return new ModelAndView(redirect);
    }

    @RequestMapping(value = "/delete", method = RequestMethod.DELETE)
    public void delete2(Services service){
        System.out.println("delete service .............." + service.getServiceId());
        iServicesService.removeById(service.getServiceId());
    }

}
