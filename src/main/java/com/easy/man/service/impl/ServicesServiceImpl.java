package com.easy.man.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.easy.man.entity.po.Services;
import com.easy.man.entity.vo.ServiceVO;
import com.easy.man.mapper.ServicesMapper;
import com.easy.man.service.IServicesService;
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
public class ServicesServiceImpl extends ServiceImpl<ServicesMapper, Services> implements IServicesService {

    @Autowired
    private ServicesMapper servicesMapper;

    @Override
    public List<ServiceVO> listServiceByPage(int pageNo, int pageSize) {
        pageNo = pageNo < 1 ? 1 : pageNo;
        Map<String, Integer> pageMap = new HashMap<>(2);
        pageMap.put("pageSize", pageSize);
        pageMap.put("startRow", (pageNo - 1) * pageSize);
        return servicesMapper.listServiceByPage(pageMap);
    }
}
