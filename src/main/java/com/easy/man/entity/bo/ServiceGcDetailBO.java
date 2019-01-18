package com.easy.man.entity.bo;

import com.easy.man.constant.ENUM;
import com.easy.man.entity.po.ServiceGcDetail;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

/**
 *
 * @author danny
 *
 * @since 2019-01-17
 *
 */
public class ServiceGcDetailBO extends ServiceGcDetail {


    /***
     * 初始化GC数据
     * @param gcDetailMap
     */
    public void initGc (Map<String, String> gcDetailMap) {

        this.setS0c(BigDecimal.valueOf(Float.parseFloat(gcDetailMap.get(ENUM.GC.S0C.name()))));
        this.setS0u(BigDecimal.valueOf(Float.parseFloat(gcDetailMap.get(ENUM.GC.S0U.name()))));
        this.setS1c(BigDecimal.valueOf(Float.parseFloat(gcDetailMap.get(ENUM.GC.S1C.name()))));
        this.setS1u(BigDecimal.valueOf(Float.parseFloat(gcDetailMap.get(ENUM.GC.S1U.name()))));
        this.setEc(BigDecimal.valueOf(Float.parseFloat(gcDetailMap.get(ENUM.GC.EC.name()))));
        this.setEu(BigDecimal.valueOf(Float.parseFloat(gcDetailMap.get(ENUM.GC.EU.name()))));
        this.setOc(BigDecimal.valueOf(Float.parseFloat(gcDetailMap.get(ENUM.GC.OC.name()))));
        this.setOu(BigDecimal.valueOf(Float.parseFloat(gcDetailMap.get(ENUM.GC.OU.name()))));
        this.setMc(BigDecimal.valueOf(Float.parseFloat(gcDetailMap.get(ENUM.GC.MC.name()))));
        this.setMu(BigDecimal.valueOf(Float.parseFloat(gcDetailMap.get(ENUM.GC.MU.name()))));
        this.setCcsc(BigDecimal.valueOf(Float.parseFloat(gcDetailMap.get(ENUM.GC.CCSC.name()))));
        this.setCcsu(BigDecimal.valueOf(Float.parseFloat(gcDetailMap.get(ENUM.GC.CCSU.name()))));
        this.setYgc(Integer.parseInt(gcDetailMap.get(ENUM.GC.YGC.name())));
        this.setYgct(BigDecimal.valueOf(Float.parseFloat(gcDetailMap.get(ENUM.GC.YGCT.name()))));
        this.setFgc(Integer.parseInt(gcDetailMap.get(ENUM.GC.FGC.name())));
        this.setFgct(BigDecimal.valueOf(Float.parseFloat(gcDetailMap.get(ENUM.GC.FGCT.name()))));
        this.setGct(BigDecimal.valueOf(Float.parseFloat(gcDetailMap.get(ENUM.GC.GCT.name()))));
    }




}
