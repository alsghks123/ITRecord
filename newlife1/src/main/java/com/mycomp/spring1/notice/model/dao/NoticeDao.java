package com.mycomp.spring1.notice.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycomp.spring1.notice.model.vo.Notice;

@Repository("nDao")
public class NoticeDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<Notice> selectList() {
		ArrayList list =new ArrayList();
		
		list = (ArrayList)sqlSessionTemplate.selectList("noticeMapper.selectList");
		
		
		return list;
	}

	public int insertNotice(Notice n) {
		
		return sqlSessionTemplate.insert("noticeMapper.insertNotice", n);
	}

	public Notice selectOne(int nId) {
	
		return sqlSessionTemplate.selectOne("noticeMapper.selectOne",nId);
	}
	
	
}
