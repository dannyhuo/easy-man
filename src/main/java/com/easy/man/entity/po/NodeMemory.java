package com.easy.man.entity.po;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import java.io.Serializable;
import java.util.List;

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


}
