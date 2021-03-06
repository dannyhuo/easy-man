package com.easy.man.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.easy.man.entity.po.Services;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.easy.man.entity.vo.ServiceVO;

import java.util.Date;
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
public interface ServicesMapper extends BaseMapper<Services> {

    /**
     * 分页关联查询
     * @param pageMap
     *  startRow :
     *  pageSize :
     * @return
     */
    List<ServiceVO> listServiceByPage(Map<String, Integer> pageMap);


    /**
     * 分页关联查询
     * 关联机器表，服务表，gc详情表
     * @param pageMap
     *  startTime:
     *  endTime :
     *  startRow :
     *  pageSize :
     * @return
     */
    List<ServiceVO> listServiceAndGcByPage(Map<String, Object> pageMap);


}
