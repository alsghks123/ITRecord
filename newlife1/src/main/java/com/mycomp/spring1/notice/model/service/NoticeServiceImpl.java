package com.mycomp.spring1.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycomp.spring1.notice.model.dao.NoticeDao;
import com.mycomp.spring1.notice.model.vo.Notice;

@Service("nService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDao nDao;
	
	@Override
	public ArrayList<Notice> selectList() {
	
		return nDao.selectList();
	}

	@Override
	public int insertNotice(Notice n) {
		
		return nDao.insertNotice(n);
	}

	@Override
	public Notice selectOne(int nId) {
		
		return nDao.selectOne(nId);
	}

}
