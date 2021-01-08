package com.mycomp.spring1.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycomp.spring1.member.model.vo.Member;

@Repository("mDao")
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public Member selectMember(Member m) {
	
		return sqlSessionTemplate.selectOne("memberMapper.selectOne",m);
		
	}

	public int insertMember(Member m) {
		
		return sqlSessionTemplate.insert("memberMapper.insertMember",m);
	}

	public int checkIdDup(String id) {
		
		return sqlSessionTemplate.selectOne("memberMapper.idCheck", id);
	}

	public int memUpdate(Member m) {
		
		return sqlSessionTemplate.update("memberMapper.updateMember",m);
	}

}
