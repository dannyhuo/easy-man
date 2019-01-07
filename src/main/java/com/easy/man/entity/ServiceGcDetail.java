package com.easy.man.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.TableField;
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
 * @since 2019-01-07
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class ServiceGcDetail implements Serializable {

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
    private Integer pid;

    /**
     * 年轻代中第一个survivor（幸存区）的容量 (字节)
     */
    @TableField("S0C")
    private Integer s0c;

    /**
     * 年轻代中第二个survivor（幸存区）的容量 (字节)
     */
    @TableField("S1C")
    private Integer s1c;

    /**
     * 年轻代中第一个survivor（幸存区）目前已使用空间 (字节)
     */
    @TableField("S0U")
    private Integer s0u;

    /**
     * 年轻代中第二个survivor（幸存区）目前已使用空间 (字节)
     */
    @TableField("S1U")
    private Integer s1u;

    /**
     * 年轻代中Eden（伊甸园）的容量 (字节)
     */
    @TableField("EC")
    private Integer ec;

    /**
     * 年轻代中Eden（伊甸园）目前已使用空间 (字节)
     */
    @TableField("EU")
    private Integer eu;

    /**
     * Old代的容量 (字节)
     */
    @TableField("OC")
    private Integer oc;

    /**
     * Old代目前已使用空间 (字节)
     */
    @TableField("OU")
    private Integer ou;

    /**
     * 方法区容量(字节)
     */
    @TableField("MC")
    private Integer mc;

    /**
     * 方法区已使用大小(字节)
     */
    @TableField("MU")
    private Integer mu;

    /**
     * 压缩类空间大小
     */
    @TableField("CCSC")
    private Integer ccsc;

    /**
     * 压缩类空间使用大小
     */
    @TableField("CCSU")
    private Integer ccsu;

    /**
     * 从应用程序启动到采样时年轻代中gc次数
     */
    @TableField("YGC")
    private Integer ygc;

    /**
     * 从应用程序启动到采样时年轻代中gc所用时间(s)
     */
    @TableField("YGCT")
    private Integer ygct;

    /**
     * 从应用程序启动到采样时old代(全gc)gc次数
     */
    @TableField("FGC")
    private Integer fgc;

    /**
     * 从应用程序启动到采样时old代(全gc)gc所用时间(s)
     */
    @TableField("FGCT")
    private Integer fgct;

    /**
     * 从应用程序启动到采样时gc用的总时间(s)
     */
    @TableField("GCT")
    private Integer gct;

    /**
     * 采样时间
     */
    private LocalDateTime createTime;


}
