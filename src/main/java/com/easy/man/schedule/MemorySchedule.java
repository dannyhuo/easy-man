package com.easy.man.schedule;

import com.easy.man.entity.bo.NodeMemoryBO;
import com.easy.man.service.INodeMemoryService;
import com.easy.man.sh.ShellUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.List;

/***
 * 内存采集调度任务
 * @author danny
 *
 * @since 2018-01-11
 */
@Component(value = "memorySchedule")
public class MemorySchedule {

    private static int memSize = 3;

    @Autowired
    private INodeMemoryService iNodeMemoryService;


    @Scheduled(cron = "0 */1 * * * *")
    public void memorySampling () {

        List<String> rs = ShellUtil.exec("free", "cdp", "az-user");

        NodeMemoryBO nodeMemory = new NodeMemoryBO();

        nodeMemory.setNodeId(10000);

        nodeMemory.addMem(ShellUtil.pickArray(rs.get(1)));

        nodeMemory.addSwapMem(ShellUtil.pickArray(rs.get(2)));

        iNodeMemoryService.save(nodeMemory);

    }

}
