package com.mycomp.spring1.notice.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mycomp.spring1.notice.model.exception.NoticeException;
import com.mycomp.spring1.notice.model.service.NoticeService;
import com.mycomp.spring1.notice.model.vo.Notice;

@Controller
public class NoticeController {

	@Autowired
	NoticeService nService;
	

	@RequestMapping("nlist.do")
	public ModelAndView noticeList(ModelAndView mv) {
		
		ArrayList<Notice> list = nService.selectList();
		
		System.out.println("Db 조회후 +" +list);
		
		if(!list.isEmpty()) {
			mv.addObject("list",list);
			mv.setViewName("notice/noticeListView");
		}else {
			throw new NoticeException("공지사항 보기 실패");
		}
		return mv;
		
	}
	
	@RequestMapping("ndetail.do")
	public String noticeDetail(Model model, int nId, Notice n) {
		n = nService.selectOne(nId);
		System.out.println("게시글 내용 :" +n);
		if(n != null) {
			model.addAttribute("notice",n);
		}else {
			throw new NoticeException("공지사항 상세보기 실패");
		}
		return "notice/noticeDetailView";
	}
	
	@RequestMapping("nWriterView.do")
	public String nWriterView() {
		return "notice/noticeWriterForm";
	}
	
	@RequestMapping(value="ninsert.do", method=RequestMethod.POST)
	public String noticeInsert(Notice n, HttpServletRequest request,
							@RequestParam(name="nuploadFile",required=false)
							MultipartFile file) {
		if(!file.getOriginalFilename().contentEquals("")) {
			String savePath =saveFile(file,request);
			System.out.println("파일 저장 경로"+savePath);
			
			if(savePath !=null) {
				n.setFilePath(file.getOriginalFilename());
			}
		}
									
	int result =nService.insertNotice(n);
	
	if(result >0) {
		return "redirect:nlist.do";
	}else {
		throw new NoticeException("공지사항 등록 실패");
	}
		
	
	}
@RequestMapping(value="nupView.do")
public String noticeUpdateView(int nId,Model model) {
	model.addAttribute("notice",nService.selectOne(nId));
	
	return "notice/noticeUpdateView";
}

@RequestMapping(value="nupdate.do",method=RequestMethod.POST)
public String noitceUpdate(HttpServletRequest request, Notice n,
							@RequestParam(value="reuploadFile", required=false)
							MultipartFile reuploadFile) {
	if(!reuploadFile.getOriginalFilename().contentEquals("")) {
		if(n.getFilePath() != null) {
			deleteFile(n.getFilePath(), request);
		}
	}
	String savePath = saveFile(reuploadFile, request);
	
	if(savePath != null) {
		n.setFilePath(reuploadFile.getOriginalFilename());
	}
	
	int result =nService.updateNotice(n);
	
	if(result>0) {
		return "redirect:nlist.do";
	}else {
		throw new NoticeException("공지사항 수정 실패!");
	}
}

@RequestMapping("ndelete.do")
public String noticeDelete(int nId, HttpServletRequest request) {
	Notice n=nService.selectOne(nId);
	
	if(n.getFilePath() != null) {
		deleteFile(n.getFilePath(), request);
	}
	
	int result = nService.deleteNotice(nId);
	if(result>0) {
		return "redirect:nlist.do";
		
	}else {
		throw new NoticeException("공지사항 삭제 실패");
	}
}
	
private void deleteFile(String fileName, HttpServletRequest request) {
	String root = 
		request.getSession().getServletContext().getRealPath("resources");
	String savePath = root + "\\nuploadFiles";
	
	File f = new File(savePath + "\\" + fileName);
	if(f.exists()) {
		f.delete();
	}
}
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\nuploadFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {	// webapp아래에 있는 resources 폴더 아래에
								// nuploadFiles가 없어서 File객체를 찾을 수 없다면
			folder.mkdirs();
			
		}
		
		String filePath = folder + "\\" + file.getOriginalFilename();
		// 실제 저장 될 파일의 경로 + 파일명
		
		try {
			file.transferTo(new File(filePath));
			// 이 상태로는 파일 업로드가 되지 않는다.
			// 왜냐면 파일 제한크기에 대한 설정을 주지 않았기 때문이다.
			// root-context.xml에 업로드 제한 파일 크기를 지정해 주자.
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return filePath;
	}
	
}
