package com.mycomp.spring1.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.mycomp.spring1.member.model.exception.MemberException;
import com.mycomp.spring1.member.model.service.MemberService;
import com.mycomp.spring1.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {
	@Autowired
	private MemberService mService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
//@RequestMapping(value ="login.do", method=RequestMethod.POST)
//public ModelAndView memberLogin(Member m, HttpSession session, ModelAndView mv) {
//	
//	Member loginUser = mService.loginMember(m);
//
//	System.out.println("로그인한 유저"+ loginUser);
//	
//	if(loginUser != null) {
//		session.setAttribute("loginUser", loginUser);
//		mv.setViewName("home");
//	}else {
//		mv.addObject("msg","로그인 실패");
//		mv.setViewName("common/errorPage");
//	}
//	return mv;
//}

	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String memberLogin(Member m, Model model) throws MemberException {
		Member loginUser = mService.loginMember(m);
		
		if(bcryptPasswordEncoder.matches(m.getPwd(), loginUser.getPwd())) {
			model.addAttribute("loginUser",loginUser);
			return "home";
		}else {
			throw new MemberException("로그인 실패");
		}
	}
@RequestMapping(value="logout.do",method=RequestMethod.GET)
public String memberLogout(SessionStatus status) {
	status.setComplete();
	
	return "home";
}

@RequestMapping("enrollView.do")
public String enrollView() {
	return"member/memberJoin";
}

@RequestMapping("minsert.do")
public String memberInsert(Member m,
							@RequestParam("post") String post,
							@RequestParam("address1") String address1,
							@RequestParam("address2") String address2) throws MemberException {
							
	System.out.println("회원가입 정보 : "+m);
	
	String encPwd = bcryptPasswordEncoder.encode(m.getPwd());
	System.out.println("암호화 처리 된 비밀번호 :" + encPwd);
	m.setPwd(encPwd);
	m.setAddress(post +","+address1+","+address2);
	int result =mService.insertMember(m);
	
	if(result > 0) {
		return "home";
	}else {
		throw new MemberException("회원 가입 실패");
	}
}

	


@RequestMapping("dupid.do")
public ModelAndView idDuplicateCheck(ModelAndView mv, String id) throws IOException{
	boolean isUsable = mService.checkIdDup(id)== 0 ? true : false;
	
	Map map =new HashMap();
	map.put("isUsable",isUsable);
	
	mv.addAllObjects(map);
	
	mv.setViewName("jsonView");
	
	return mv;

}

@RequestMapping("myinfo.do")
public String myInfoView() {
	return "member/myPage";
}

@RequestMapping("mupdate.do")
public String memberUpdate(Member m,
							String post,
							String address1,
							String address2,
							Model model) throws MemberException {
	m.setAddress(post+","+address1+address2);

	int result = mService.updateMember(m);
	
	if(result > 0) {
		model.addAttribute("loginUser",m);
		
	}else {
		throw new MemberException("수정 실패!");
	}
	return "home";

}
}
