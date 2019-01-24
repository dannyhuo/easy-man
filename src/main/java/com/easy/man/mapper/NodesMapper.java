package com.easy.man.mapper;

import com.easy.man.entity.po.Nodes;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.easy.man.entity.vo.NodesVO;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author danny
 * @since 2019-01-07
 */
public interface NodesMapper extends BaseMapper<Nodes> {

    /**
     * 查询节点及其节点的内存信息
     * @param param
     * @return
     */
    List<NodesVO> listNodeAndMemoryByPage(Map<String, Object> param);

}
