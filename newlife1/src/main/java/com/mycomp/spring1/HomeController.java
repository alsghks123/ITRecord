package com.mycomp.spring1;
import java.util.ArrayList;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mycomp.spring1.notice.model.service.NoticeService;
import com.mycomp.spring1.notice.model.vo.Notice;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	NoticeService nService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "home.do", method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mv,Locale locale, Model model) {

		/*
		 * //신규등록된 프로젝트를 가져오자 //1.웹 프로젝트를 가져오자 ArrayList<ProjectList> web=new
		 * ArrayList(); web=pService.selectFourWeb(); System.out.println("웹프로젝트4개"+web);
		 * 
		 * //2.앱 프로젝트를 가져오자 ArrayList<ProjectList> app=new ArrayList();
		 * app=pService.selectFourApp(); System.out.println("앱프로젝트4개"+app);
		 * 
		 * //3.퍼블리싱 프로젝트를 가져오자 ArrayList<ProjectList> pub=new ArrayList();
		 * pub=pService.selectFourPub(); System.out.println("퍼블리싱 프로젝트4개"+pub);
		 * 
		 * mv.addObject("app", app); mv.addObject("web", web); mv.addObject("pub", pub);
		 */
 ArrayList<Notice> nList =new ArrayList();
 nList = nService.selectFourNotice();
 System.out.println("공지사항 4개 " +nList);
 		mv.addObject("notice",nList);
		mv.setViewName("common/mainPage");
		
		
		
		return mv;
//		return "member/login";
//		return "common/pSideMenubar";
//		return "findMember/findClient/main";

//		return "findMember/findPartnersDetail";



	}
	
//	@RequestMapping("clientList.do")
//	public String getClientList() {
//		return "findMember/findClient";
//	}
	
}
