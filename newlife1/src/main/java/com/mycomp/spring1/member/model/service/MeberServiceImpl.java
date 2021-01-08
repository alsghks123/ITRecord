package com.mycomp.spring1.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycomp.spring1.member.model.dao.MemberDao;
import com.mycomp.spring1.member.model.vo.Member;

@Service("mSerivce")
public class MeberServiceImpl implements MemberService {

	@Autowired
	private MemberDao mDao;

	@Override
	public Member loginMember(Member m) {
	//스프링 적용 후엔 SERVICE단에서 Sql세션 생성 x
		return mDao.selectMember(m);
	}

	@Override
	public int insertMember(Member m) {
		
		return mDao.insertMember(m);
	}

	@Override
	public int checkIdDup(String id) {
		
		return mDao.checkIdDup(id);
	}

	@Override
	public int updateMember(Member m) {
		
		return mDao.memUpdate(m);
	}
}
