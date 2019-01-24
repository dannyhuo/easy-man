package com.easy.man.service;

import com.easy.man.entity.po.Nodes;
import com.baomidou.mybatisplus.extension.service.IService;
import com.easy.man.entity.vo.NodesVO;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author danny
 * @since 2019-01-07
 */
public interface INodesService extends IService<Nodes> {

    /**
     * 查询节点及其内存信息
     * @param param
     * @return
     */
    List<NodesVO> listNodeAndMemoryByPage(Map<String, Object> param);

    /**
     * 查询节点及其内存信息
     * @param pageNo
     * @param pageSize
     * @return
     */
    List<NodesVO> listNodeAndMemoryByPage(int pageNo, int pageSize);

}
