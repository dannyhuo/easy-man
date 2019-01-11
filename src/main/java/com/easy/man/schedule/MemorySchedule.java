package com.easy.man.schedule;

import com.easy.man.sh.ShellUtil;
import org.springframework.scheduling.annotation.Scheduled;
import sun.misc.Contended;

import java.util.List;

/***
 * 内存采集调度任务
 * @author danny
 *
 * @since 2018-01-11
 */
@Contended(value = "memorySchedule")
public class MemorySchedule {

    private static int memSize = 3;
    @Scheduled(cron = "0 */10 * * * *")
    public void memorySampling () {
        List<String> rs = ShellUtil.exec("free", "cdp", "az-user");
    }

    public static void main(String[] args) {
        List<String> rs = ShellUtil.exec("free", "cdp", "az-user");
        if (rs.size() == memSize) {



            System.out.println(ShellUtil.pickArray(rs.get(0))[0]);
            System.out.println(ShellUtil.pickArray(rs.get(1))[0]);
            System.out.println(ShellUtil.pickArray(rs.get(2))[0]);
        }

    }

}
