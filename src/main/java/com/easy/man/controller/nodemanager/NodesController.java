package com.easy.man.controller.nodemanager;


import com.easy.man.entity.po.Nodes;
import com.easy.man.service.INodesService;
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
@RequestMapping("/nodes")
public class NodesController {

    @Autowired
    private INodesService iNodesService;

    private String redirect = "redirect:/nodes/list";

    @RequestMapping("/test")
    public ModelAndView test(ModelAndView mav){
        System.out.println(iNodesService.list());
        mav.setViewName("index");
        mav.addObject("lists", iNodesService.list());
        return mav;
    }



    @RequestMapping(value = "/list")
    public ModelAndView nodeLists(ModelAndView mav){
        System.out.println(iNodesService.list());
        mav.setViewName("node-manager/node-list");
        mav.addObject("nodes", iNodesService.list());
        return mav;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public ModelAndView save(Nodes node){
        iNodesService.save(node);
        return new ModelAndView(redirect);
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public ModelAndView update(Nodes node){
        iNodesService.updateById(node);
        return new ModelAndView(redirect);
    }

    @RequestMapping(value = "/delete")
    public ModelAndView delete(Nodes node){
        iNodesService.removeById(node.getNodeId());
        return new ModelAndView(redirect);
    }

    @RequestMapping(value = "/delete2", method = RequestMethod.DELETE)
    public void delete2(Nodes node){
        iNodesService.removeById(node.getNodeId());
    }

}
