package com.easy.man.controller.nodemonitor;


import com.easy.man.entity.vo.NodesVO;
import com.easy.man.service.INodeMemoryService;
import com.easy.man.service.INodesService;
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
 * @since 2019-01-14
 */
@RestController
@RequestMapping("/node-memory")
public class NodeMemoryController {

    @Autowired
    private INodeMemoryService iNodeMemoryService;

    @Autowired
    private INodesService iNodesService;

    @RequestMapping(value = "/monitor")
    public ModelAndView monitorGc(ModelAndView mav){
        mav.setViewName("node-monitor/memory-monitor");
        return mav;
    }

    @RequestMapping(value = "/monitor/loadData")
    public List<NodesVO> loadData(){
        return iNodesService.listNodeAndMemoryByPage(1, 1000);
    }


}
