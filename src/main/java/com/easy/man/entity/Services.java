package com.easy.man.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
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
 * @since 2019-01-07
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class Services implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * key
     */
    @TableId(value = "service_id", type = IdType.AUTO)
    private Integer serviceId;

    /**
     * 服务名称
     */
    private String serviceName;

    /**
     * 启动命令
     */
    private String startCmd;

    /**
     * 停止命名
     */
    private String stopCmd;

    /**
     * 所属节点ID
     */
    private Integer nodeId;

    /**
     * 当前状态
     */
    private Integer status;

    /**
     * 备注
     */
    private String comment;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 修改时间
     */
    private LocalDateTime updateTime;

    /**
     * 是否删除， 0=未删除，1=已删除
     */
    private Integer isDeleted;


}
