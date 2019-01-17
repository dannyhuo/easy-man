package com.easy.man.entity.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author danny
 * @since 2019-01-14
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class NodeMemory implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * key
     */
    @TableId(value = "node_memory_id", type = IdType.AUTO)
    private Integer nodeMemoryId;

    /**
     * 所属节点ID
     */
    private Integer nodeId;

    /**
     * 总内存，kb
     */
    private Integer total;

    /**
     * 已使用内存，kb
     */
    private Integer used;

    /**
     * 空闲内存，kb
     */
    private Integer free;

    /**
     * shared内存，kb
     */
    private Integer shared;

    /**
     * cache， buff使用的内存，kb
     */
    private Integer buffCache;

    /**
     * available ，kb
     */
    private Integer available;

    /**
     * swap总内存，kb
     */
    private Integer swapTotal;

    /**
     * swap已使用内存，kb
     */
    private Integer swapUsed;

    /**
     * swap空闲内存，kb
     */
    private Integer swapFree;

    /**
     * 采样时间
     */
    private LocalDateTime createTime;


    /**
     * <p>
     *
     * </p>
     *
     * @author danny
     * @since 2019-01-17
     */
    @Data
    @EqualsAndHashCode(callSuper = false)
    @Accessors(chain = true)
    public static class ServiceGcDetail implements Serializable {

        private static final long serialVersionUID = 1L;

        /**
         * key
         */
        @TableId(value = "gcinfo_id", type = IdType.AUTO)
        private Long gcinfoId;

        /**
         * 服务id
         */
        private Integer serviceId;

        /**
         * 服务名称
         */
        private String serviceName;

        /**
         * 进程号
         */
        private BigDecimal pid;

        /**
         * 年轻代中第一个survivor（幸存区）的容量 (字节)
         */
        @TableField("S0C")
        private BigDecimal s0c;

        /**
         * 年轻代中第二个survivor（幸存区）的容量 (字节)
         */
        @TableField("S1C")
        private BigDecimal s1c;

        /**
         * 年轻代中第一个survivor（幸存区）目前已使用空间 (字节)
         */
        @TableField("S0U")
        private BigDecimal s0u;

        /**
         * 年轻代中第二个survivor（幸存区）目前已使用空间 (字节)
         */
        @TableField("S1U")
        private BigDecimal s1u;

        /**
         * 年轻代中Eden（伊甸园）的容量 (字节)
         */
        @TableField("EC")
        private BigDecimal ec;

        /**
         * 年轻代中Eden（伊甸园）目前已使用空间 (字节)
         */
        @TableField("EU")
        private BigDecimal eu;

        /**
         * Old代的容量 (字节)
         */
        @TableField("OC")
        private BigDecimal oc;

        /**
         * Old代目前已使用空间 (字节)
         */
        @TableField("OU")
        private BigDecimal ou;

        /**
         * 方法区容量(字节)
         */
        @TableField("MC")
        private BigDecimal mc;

        /**
         * 方法区已使用大小(字节)
         */
        @TableField("MU")
        private BigDecimal mu;

        /**
         * 压缩类空间大小
         */
        @TableField("CCSC")
        private BigDecimal ccsc;

        /**
         * 压缩类空间使用大小
         */
        @TableField("CCSU")
        private BigDecimal ccsu;

        /**
         * 从应用程序启动到采样时年轻代中gc次数
         */
        @TableField("YGC")
        private Integer ygc;

        /**
         * 从应用程序启动到采样时年轻代中gc所用时间(s)
         */
        @TableField("YGCT")
        private BigDecimal ygct;

        /**
         * 从应用程序启动到采样时old代(全gc)gc次数
         */
        @TableField("FGC")
        private Integer fgc;

        /**
         * 从应用程序启动到采样时old代(全gc)gc所用时间(s)
         */
        @TableField("FGCT")
        private BigDecimal fgct;

        /**
         * 从应用程序启动到采样时gc用的总时间(s)
         */
        @TableField("GCT")
        private BigDecimal gct;

        /**
         * 采样时间
         */
        private LocalDateTime createTime;


    }
}
