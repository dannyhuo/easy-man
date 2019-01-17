package com.easy.man.entity.vo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.easy.man.entity.po.Nodes;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * node 和 service 表关联查询实体
 *
 * @author danny
 *
 * @since 20189-01-17
 *
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class ServiceVO implements Serializable {


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
     * 服务所在节点信息
     */
    private Nodes node;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 修改时间
     */
    private LocalDateTime updateTime;

}
