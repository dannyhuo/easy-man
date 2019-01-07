package com.easy.man.service.impl;

import com.easy.man.entity.ServiceHealth;
import com.easy.man.mapper.ServiceHealthMapper;
import com.easy.man.service.IServiceHealthService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author danny
 * @since 2019-01-07
 */
@Service
public class ServiceHealthServiceImpl extends ServiceImpl<ServiceHealthMapper, ServiceHealth> implements IServiceHealthService {

}
