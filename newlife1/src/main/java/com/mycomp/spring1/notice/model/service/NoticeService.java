package com.mycomp.spring1.notice.model.service;

import java.util.ArrayList;

import com.mycomp.spring1.notice.model.vo.Notice;

public interface NoticeService {

	ArrayList<Notice> selectList();

	int insertNotice(Notice n);

	Notice selectOne(int nId);

	int updateNotice(Notice n);

	int deleteNotice(int nId);

}
