package com.yueqi.service;

import java.util.List;

public interface BaseService {
	
	Object queryByName(String sqlmapper,Object obj);
	Object queryById(String sqlmapper,Object obj);
	int insert(String sqlmapper,Object obj);
	List<?> queryAll(String sqlmapper,Object obj);
	int getTotalCount(String sqlmapper,Object obj);
	int update(String sqlmapper,Object obj);
	int delete(String sqlmapper,Object obj);
}
