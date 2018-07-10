package com.yueqi.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yueqi.mapper.BaseDao;
import com.yueqi.service.BaseService;

@Service("baseService")
public class BaseServiceImpl implements BaseService {
	
	@Resource
	BaseDao basedao;

	@Override
	public Object queryByName(String sqlmapper, Object obj) {
		// TODO Auto-generated method stub
		return basedao.queryByName(sqlmapper, obj);
	}
	
	@Override
	public Object queryById(String sqlmapper, Object obj) {
		// TODO Auto-generated method stub
		return basedao.queryById(sqlmapper, obj);
	}

	@Override
	public int insert(String sqlmapper, Object obj) {
		return basedao.insert(sqlmapper, obj);
	}

	@Override
	public List<?> queryAll(String sqlmapper, Object obj) {
		// TODO Auto-generated method stub
		return basedao.querryAll(sqlmapper, obj);
	}

	@Override
	public int getTotalCount(String sqlmapper, Object obj) {
		// TODO Auto-generated method stub
		return basedao.getTotalCount(sqlmapper, obj);
	}

	@Override
	public int update(String sqlmapper, Object obj) {
		// TODO Auto-generated method stub
		return basedao.update(sqlmapper, obj);
	}

	@Override
	public int delete(String sqlmapper, Object obj) {
		// TODO Auto-generated method stub
		return basedao.delete(sqlmapper, obj);
	}

}
