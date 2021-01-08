package com.mycomp.spring1.member.model.service;

import com.mycomp.spring1.member.model.vo.Member;

public interface MemberService {

	Member loginMember(Member m);

	int insertMember(Member m);

	int checkIdDup(String id);

	int updateMember(Member m);

}
