package com.easy.man.schedule;

import com.easy.man.entity.bo.NodeMemoryBO;
import com.easy.man.entity.bo.ServiceGcDetailBO;
import com.easy.man.entity.po.ServiceGcDetail;
import com.easy.man.entity.po.Services;
import com.easy.man.entity.vo.ServiceVO;
import com.easy.man.service.INodeMemoryService;
import com.easy.man.service.IServiceGcDetailService;
import com.easy.man.service.IServicesService;
import com.easy.man.sh.ShellUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/***
 * 内存采集调度任务
 * @author danny
 *
 * @since 2018-01-11
 */
@Component(value = "serviceGcSchedule")
public class ServiceGcSchedule {

    private static int memSize = 3;

    private static String JSTAT = "sh /Users/danny/works/idea/easy-man/bin/jvm/jstat-gc.sh";
    private static String BLANK = " ";

    @Autowired
    private IServiceGcDetailService iServiceGcDetailService;

    @Autowired
    private IServicesService iServicesService;


    @Scheduled(cron = "0 */1 * * * *")
    public void serviceGcSampling () {

        List<ServiceVO> services = iServicesService.listServiceByPage(1, 1000);
        int size = 0;
        if (null == services || (size = services.size()) == 0) {
            return;
        }

        for (int i = 0; i < size; i++) {
            ServiceVO service = services.get(i);
            StringBuffer cmdBuffer = new StringBuffer();
            cmdBuffer.append(JSTAT);
            cmdBuffer.append(BLANK);
            cmdBuffer.append(service.getNode().getHosts());
            cmdBuffer.append(BLANK);
            cmdBuffer.append(service.getNode().getUserName());
            cmdBuffer.append(BLANK);
            cmdBuffer.append(service.getServiceName());
            cmdBuffer.append(BLANK);
            List<String> rs = ShellUtil.exec(cmdBuffer.toString());
            if (null != rs && rs.size() == 2) {
                String[] t1 = ShellUtil.pickArray(rs.get(0));
                String[] t2 = ShellUtil.pickArray(rs.get(1));

                Map<String, String> gcMap = new HashMap<>(20);
                for (int j = 0; j < t1.length; j++) {
                    gcMap.put(t1[j], t2[j]);
                }

                ServiceGcDetailBO gcDetailBO = new ServiceGcDetailBO();
                gcDetailBO.setServiceId(service.getServiceId());
                gcDetailBO.setServiceName(service.getServiceName());
                gcDetailBO.initGc(gcMap);

                iServiceGcDetailService.save(gcDetailBO);
            }

        }

    }



    public static void main(String[] args){

        StringBuffer cmdBuffer = new StringBuffer();
        cmdBuffer.append(JSTAT);
        cmdBuffer.append(BLANK);
        cmdBuffer.append("cdp");
        cmdBuffer.append(BLANK);
        cmdBuffer.append("az-user");
        cmdBuffer.append(BLANK);
        cmdBuffer.append("nodemanager");
        cmdBuffer.append(BLANK);
        List<String> rs = ShellUtil.exec(cmdBuffer.toString());
        if (null != rs && rs.size() == 2) {
            String[] t1 = ShellUtil.pickArray(rs.get(0));
            String[] t2 = ShellUtil.pickArray(rs.get(1));

            Map<String, String> gcMap = new HashMap<>(20);
            for (int j = 0; j < t1.length; j++) {
                gcMap.put(t1[j], t2[j]);
            }

            ServiceGcDetailBO gcDetailBO = new ServiceGcDetailBO();
            gcDetailBO.initGc(gcMap);


            System.out.println();
        }
    }

    private void samplingGc (Services service) {

    }

}
