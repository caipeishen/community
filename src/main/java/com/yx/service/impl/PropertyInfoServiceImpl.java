package com.yx.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yx.dao.PropertyInfoMapper;
import com.yx.model.PropertyInfo;
import com.yx.service.IPropertyInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author cuijianhui
 * @since 2020-12-08
 */
@Service
public class PropertyInfoServiceImpl extends ServiceImpl<PropertyInfoMapper, PropertyInfo> implements IPropertyInfoService {

    @Autowired
    private PropertyInfoMapper propertyInfoDao;

    @Override
    public PageInfo<PropertyInfo> findPropertyInfoAll(int page, int pagesise,
                                                      PropertyInfo propertyInfo) {
        PageHelper.startPage(page,pagesise);
        List<PropertyInfo> list=propertyInfoDao.queryListAll(propertyInfo);
        return new PageInfo(list);
    }

    @Override
    public void deleteInfoByHouIdAndTime(Integer houId, Date endTime) {

         SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
         String dateString = formatter.format(endTime);
         dateString=dateString.substring(0,9);
         propertyInfoDao.deleteByHouIdAndTime(houId,dateString);
    }

    @Override
    public IPage<PropertyInfo> findListByPage(Integer page, Integer pageCount){
        IPage<PropertyInfo> wherePage = new Page<>(page, pageCount);
        PropertyInfo where = new PropertyInfo();

        return   baseMapper.selectPage(wherePage, Wrappers.query(where));
    }

    @Override
    public int add(PropertyInfo propertyInfo){
        return baseMapper.insert(propertyInfo);
    }

    @Override
    public int delete(Long id){
        return baseMapper.deleteById(id);
    }

    @Override
    public int updateData(PropertyInfo propertyInfo){
        return baseMapper.updateById(propertyInfo);
    }

    @Override
    public PropertyInfo findById(Long id){
        return  baseMapper.selectById(id);
    }
}
