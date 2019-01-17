package com.easy.man.entity.po;

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
public class Nodes implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * key
     */
    @TableId(value = "node_id", type = IdType.AUTO)
    private Integer nodeId;

    /**
     * 节点名称
     */
    private String nodeName;

    /**
     * host name
     */
    private String hostName;

    /**
     * hosts, 多个以逗号隔开
     */
    private String hosts;

    /**
     * 服务器IP
     */
    private String ip;

    /**
     * 服务器外网IP
     */
    private String ipPublic;

    /**
     * 用户名
     */
    private String userName;

    /**
     * 密码
     */
    private String password;

    /**
     * 状态
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
