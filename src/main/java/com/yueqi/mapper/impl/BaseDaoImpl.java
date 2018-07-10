package com.yueqi.mapper.impl;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yueqi.mapper.BaseDao;

@Repository("baseDao")
public class BaseDaoImpl extends SqlSessionDaoSupport implements BaseDao {
	
	@Autowired
	 public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate)
	    {
	     super.setSqlSessionTemplate(sqlSessionTemplate);
	    }

	@Override
	public Object queryByName(String sqlmapper, Object obj) {
		// TODO Auto-generated method stub
		SqlSession sqlSession = this.getSqlSession();
		//Object object = sqlSession.selectOne(sqlmapper, obj);
		return sqlSession.selectOne(sqlmapper, obj);
	}
	
	@Override
	public Object queryById(String sqlmapper, Object obj) {
		// TODO Auto-generated method stub
		SqlSession sqlSession = this.getSqlSession();
		//Object object = sqlSession.selectOne(sqlmapper, obj);
		return sqlSession.selectOne(sqlmapper, obj);
	}

	@Override
	public int insert(String sqlmapper, Object obj) {
		// TODO Auto-generated method stub
		return this.getSqlSession().insert(sqlmapper, obj);
		
	}

	@Override
	public List<?> querryAll(String sqlmapper, Object obj) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectList(sqlmapper, obj);
	}

	@Override
	public int getTotalCount(String sqlmapper, Object obj) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectOne(sqlmapper, obj);
	}

	@Override
	public int update(String sqlmapper, Object obj) {
		// TODO Auto-generated method stub
		return this.getSqlSession().update(sqlmapper, obj);
	}

	@Override
	public int delete(String sqlmapper, Object obj) {
		// TODO Auto-generated method stub
		return this.getSqlSession().delete(sqlmapper, obj);
	}
	
	

}
