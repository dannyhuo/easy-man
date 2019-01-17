package com.easy.man.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.easy.man.entity.po.Services;
import com.baomidou.mybatisplus.extension.service.IService;
import com.easy.man.entity.vo.ServiceVO;
import com.easy.man.mapper.ServicesMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author danny
 * @since 2019-01-07
 */
public interface IServicesService extends IService<Services> {

    /**
     * 分页关联查询
     * @param pageNo
     * @param pageSize
     * @return
     */
    List<ServiceVO> listServiceByPage(int pageNo, int pageSize);

}
