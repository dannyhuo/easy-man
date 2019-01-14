package com.easy.man.entity.bo;

import com.easy.man.constant.ENUM;
import com.easy.man.entity.po.ServiceGcDetail;

import java.util.Map;

public class ServiceGcDetailBO extends ServiceGcDetail {


    /***
     * 初始化GC数据
     * @param gcDetailMap
     */
    public void initGc (Map<String, String> gcDetailMap) {
        this.setS0c(Integer.parseInt(gcDetailMap.get(ENUM.GC.S0C)));
        this.setS0u(Integer.parseInt(gcDetailMap.get(ENUM.GC.S0U)));
        this.setS1c(Integer.parseInt(gcDetailMap.get(ENUM.GC.S1C)));
        this.setS1u(Integer.parseInt(gcDetailMap.get(ENUM.GC.S1U)));
        this.setEc(Integer.parseInt(gcDetailMap.get(ENUM.GC.EC)));
        this.setEu(Integer.parseInt(gcDetailMap.get(ENUM.GC.EU)));
        this.setOc(Integer.parseInt(gcDetailMap.get(ENUM.GC.OC)));
        this.setOu(Integer.parseInt(gcDetailMap.get(ENUM.GC.OU)));
        this.setMc(Integer.parseInt(gcDetailMap.get(ENUM.GC.MC)));
        this.setMu(Integer.parseInt(gcDetailMap.get(ENUM.GC.MU)));
        this.setCcsc(Integer.parseInt(gcDetailMap.get(ENUM.GC.CCSC)));
        this.setCcsu(Integer.parseInt(gcDetailMap.get(ENUM.GC.CCSU)));
        this.setYgc(Integer.parseInt(gcDetailMap.get(ENUM.GC.YGC)));
        this.setYgct(Integer.parseInt(gcDetailMap.get(ENUM.GC.YGCT)));
        this.setFgc(Integer.parseInt(gcDetailMap.get(ENUM.GC.FGC)));
        this.setFgct(Integer.parseInt(gcDetailMap.get(ENUM.GC.FGCT)));
        this.setGct(Integer.parseInt(gcDetailMap.get(ENUM.GC.GCT)));
    }



}
