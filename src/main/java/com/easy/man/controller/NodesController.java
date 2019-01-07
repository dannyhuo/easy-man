package com.easy.man.controller;


import com.easy.man.service.INodesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

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
@RequestMapping("/nodes")
public class NodesController {

    @Autowired
    private INodesService iNodesService;

    @RequestMapping("/test")
    public ModelAndView test(ModelAndView mav){
        System.out.println(iNodesService.list());
        mav.setViewName("index");
        mav.addObject("lists", iNodesService.list());
        return mav;
    }

    @RequestMapping("/list")
    public ModelAndView nodeLists(ModelAndView mav){
        System.out.println(iNodesService.list());
        mav.setViewName("node-manager/node-list");
        mav.addObject("lists", iNodesService.list());
        return mav;
    }

}
