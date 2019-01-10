package com.easy.man.controller.nodemanager;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author danny
 * @since 2019-01-10
 */
@RestController
@RequestMapping("/nodes")
public class TerminalController {
    @RequestMapping("/terminal")
    public ModelAndView terminal(){
        ModelAndView mav = new ModelAndView();
        mav.setViewName("node-manager/terminal");
        return mav;
    }
}
