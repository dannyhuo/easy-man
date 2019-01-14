package com.easy.man.schedule;

import com.easy.man.entity.bo.NodeMemoryBO;
import com.easy.man.entity.po.ServiceGcDetail;
import com.easy.man.entity.po.Services;
import com.easy.man.service.INodeMemoryService;
import com.easy.man.service.IServiceGcDetailService;
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
@Component(value = "serviceGcSchedule")
public class ServiceGcSchedule {

    private static int memSize = 3;

    @Autowired
    private IServiceGcDetailService iServiceGcDetailService;


    @Scheduled(cron = "0 */1 * * * *")
    public void serviceGcSampling () {

        List<String> rs = ShellUtil.exec("jstat -gc ", "cdp", "az-user");


    }

    private void samplingGc (Services service) {

    }

}
