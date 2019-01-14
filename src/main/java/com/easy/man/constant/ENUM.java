package com.easy.man.constant;

public class ENUM {

    /**
     * 标签状态
     * 死亡
     * 正常
     * 计算
     * 超时
     */
    public enum GC {

        S0C ((short) 0),
        S1C ((short) 1),
        S0U ((short) 2),
        S1U ((short) 3),
        EC ((short) 4),
        EU ((short) 5),
        OC ((short) 6),
        OU ((short) 7),
        MC ((short) 8),
        MU ((short) 9),
        CCSC ((short) 10),
        CCSU ((short) 11),
        YGC ((short) 12),
        YGCT ((short) 13),
        FGC ((short) 14),
        FGCT ((short) 15),
        GCT ((short) 16);

        private short value;

        GC (short value) {
            this.value = value;
        }

        public short getValue() {
            return value;
        }
    }
}
