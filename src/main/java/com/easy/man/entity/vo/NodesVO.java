package com.easy.man.entity.vo;

import com.easy.man.entity.po.NodeMemory;
import com.easy.man.entity.po.Nodes;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.util.List;

/**
 * node 和 memory 表关联查询实体
 * 1对*
 *
 * @author danny
 *
 * @since 20189-01-24
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class NodesVO extends Nodes {

    private List<NodeMemory> nodeMemories;

}
