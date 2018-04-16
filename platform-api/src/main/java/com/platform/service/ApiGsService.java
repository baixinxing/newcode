package com.platform.service;

import com.platform.dao.ApiGsMapper;
import com.platform.entity.Gs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class ApiGsService {
    @Autowired
    private ApiGsMapper gsDao;

    public Gs queryObject(Long id) {
        return gsDao.queryObject(id);
    }


    public List<Gs> queryList(Map<String, Object> map) {
        return gsDao.queryList(map);
    }


    public int queryTotal(Map<String, Object> map) {
        return gsDao.queryTotal(map);
    }


    public void save(Gs brand) {
        gsDao.save(brand);
    }


    public void update(Gs brand) {
        gsDao.update(brand);
    }


    public void delete(Long id) {
        gsDao.delete(id);
    }


    public void deleteBatch(Long[] ids) {
        gsDao.deleteBatch(ids);
    }

}
