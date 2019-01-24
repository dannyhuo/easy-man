package com.easy.man.service.impl;

import com.easy.man.entity.po.Nodes;
import com.easy.man.entity.vo.NodesVO;
import com.easy.man.mapper.NodesMapper;
import com.easy.man.service.INodesService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author danny
 * @since 2019-01-07
 */
@Service
public class NodesServiceImpl extends ServiceImpl<NodesMapper, Nodes> implements INodesService {

    @Autowired
    private NodesMapper nodesMapper;

    @Override
    public List<NodesVO> listNodeAndMemoryByPage(Map<String, Object> param) {
        return nodesMapper.listNodeAndMemoryByPage(param);
    }

    @Override
    public List<NodesVO> listNodeAndMemoryByPage(int pageNo, int pageSize) {
        pageNo = pageNo < 1 ? 1 : pageNo;
        Map<String, Object> pageMap = new HashMap<>(2);
        pageMap.put("pageSize", pageSize);
        pageMap.put("startRow", (pageNo - 1) * pageSize);
        return nodesMapper.listNodeAndMemoryByPage(pageMap);
    }
}
