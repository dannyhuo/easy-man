package com.easy.man.entity.bo;

import com.easy.man.entity.po.NodeMemory;

/**
 * 接收shell 执行 free查看内存返回的结果，转化为NodeMemory模型
 *
 * @author danny
 *
 * @since 2019-01-14
 */
public class NodeMemoryBO extends NodeMemory {

    private static int memLineSize = 7;
    private static int swapMemLineSize = 4;
    public boolean addMem (String[] memLine) {
        if (null != memLine && memLine.length == memLineSize) {
            this.setTotal(Integer.parseInt(memLine[1]));
            this.setUsed(Integer.parseInt(memLine[2]));
            this.setFree(Integer.parseInt(memLine[3]));
            this.setShared(Integer.parseInt(memLine[4]));
            this.setBuffCache(Integer.parseInt(memLine[5]));
            this.setAvailable(Integer.parseInt(memLine[6]));

            return true;
        }

        return false;
    }

    public boolean addSwapMem (String[] swapMemLine) {
        if (null != swapMemLine && swapMemLine.length == swapMemLineSize) {
            this.setSwapTotal(Integer.parseInt(swapMemLine[1]));
            this.setSwapUsed(Integer.parseInt(swapMemLine[2]));
            this.setSwapFree(Integer.parseInt(swapMemLine[3]));

            return true;
        }
        return false;
    }
}
