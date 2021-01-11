package com.mycomp.spring1.board.controller;

import static com.mycomp.spring1.common.Pagination.getPageInfo;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.mycomp.spring1.board.model.exception.BoardException;
import com.mycomp.spring1.board.model.service.BoardService;
import com.mycomp.spring1.board.model.vo.Board;
import com.mycomp.spring1.board.model.vo.PageInfo;
import com.mycomp.spring1.board.model.vo.Reply;
import com.mycomp.spring1.member.model.vo.Member;
@Controller
public class BoardController {

	@Autowired
	BoardService bService;
	
	@RequestMapping("blist.do")
	public ModelAndView boardList(ModelAndView mv,
								@RequestParam(value="page", required=false) Integer page) {
			int currentPage =1;
			
			if(page != null) {
					currentPage =page;
			}
			
			int listCount =bService.getListCount();
			
			PageInfo pi =getPageInfo(currentPage, listCount);
			
			ArrayList<Board> list = bService.selectList(pi);
			
			if(list != null) {
				mv.addObject("list",list);
				mv.addObject("pi",pi);
				mv.setViewName("board/boardListView");
			}else {
				throw new BoardException("게시글 전체 조회 실패!");
			}
		return mv;
	}
	
	@RequestMapping("binsertView.do")
	public String boardInserView() {
		
		return "board/boardInsertForm";
	}
	@RequestMapping("binsert.do")
	public String boardInsert(HttpServletRequest request,Board b,
			@RequestParam(value="buploadFile",required=false) MultipartFile file) {
		if(!file.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(file,request);
			
			b.setOriginalFileName(file.getOriginalFilename());
			b.setRenameFileName(renameFileName);
		}
		System.out.println(b);
		int result =bService.insertBoard(b);
		
		if(result > 0) {
			return "redirect:blist.do";
		}else {
			throw new BoardException("게시글 등록 실패!");
		}
		
	}
	
	private String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\buploadFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {	// webapp아래에 있는 resources 폴더 아래에
								// nuploadFiles가 없어서 File객체를 찾을 수 없다면
			folder.mkdirs();
			
		}
		
		// 공지글은 파일명 중복 제거는 신경쓰지 않고 했지만
		// 게시판에서는 파일명을 날짜(업로드 시간)로 rename 해보자
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName
			= sdf.format(new java.sql.Date(System.currentTimeMillis()))
			 + "." + originFileName.substring(originFileName.lastIndexOf(".")+1);
		
		
		String filePath = folder + "\\" + renameFileName;
		// 실제 저장 될 파일의 경로 + rename 파일명
		
		try {
			file.transferTo(new File(filePath));
			// 이 상태로는 파일 업로드가 되지 않는다.
			// 왜냐면 파일 제한크기에 대한 설정을 주지 않았기 때문이다.
			// root-context.xml에 업로드 제한 파일 크기를 지정해 주자.
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return renameFileName;
	}
	@RequestMapping("bdetail.do")
	public ModelAndView  boardDetailView(ModelAndView mv, Integer bId,
										@RequestParam("page") Integer page) {
		int currentPage= page;
		
		int result = bService.addReadCount(bId);
		
		if(result >0){
			Board board = bService.selectBoard(bId);
			if(board !=null) {
				mv.addObject("board",board).addObject("currentPage",currentPage)
				.setViewName("board/boardDetailView");
			}else {
				throw new BoardException("조회 실패");
			}
			
		}else {
			throw new BoardException("게시글 조회수 증가 실패");
		}
		
		return mv;
		
	}
	
	@RequestMapping("bupView.do")
	public ModelAndView boardUpdateView(ModelAndView mv, Integer bId,
										@RequestParam("page") Integer page) {
		mv.addObject("board",bService.selectBoard(bId))
		.addObject("currentPage",page)
		.setViewName("board/boardUpdateForm");
	return mv;
}
	
	@RequestMapping("bupdate.do")
	public ModelAndView boardUpdate(ModelAndView mv, Board b,
									HttpServletRequest request,
									@RequestParam("page") Integer page,
									@RequestParam(value="uploadFile", required=false)
									MultipartFile file) {
		String renameFileName="";
		// 기존의 파일이 input hidden으로 와서 매개변수의 Board 객체에 담김
		// 그럼 그걸 가지고 기존의 파일을 삭제하자
		if(!file.getOriginalFilename().equals("")) {	// 새로 올린 파일이 있느냐
			if(b.getRenameFileName () != null) {		// 기존의 파일이 있느냐(hidden)
				deleteFile(b.getRenameFileName(), request);
				// deleteFile메소드는 NoticeController에 만들었으니 아래에 복붙해서
				// 폴더명만 수정하자
			}
			renameFileName = saveFile(file, request);
		}
		
		// 위에 만든 saveFile메소드를 활용해서 새로 사용자가 수정하려고 올린 파일의
		// 파일명을 바꾸고 buploadFiles폴더에 저장하자.
		
		// Board객체에 새로 올린 파일명을 담고(원본 및 변경한 것 둘다) DB를 다녀오자(update)

			b.setOriginalFileName(file.getOriginalFilename());
			b.setRenameFileName(renameFileName);

		
		int result = bService.updateBoard(b);
		
		if(result > 0) {
			mv.addObject("page",page)
			  .setViewName("redirect:blist.do");
			//★★★★★
			// ModelAndView와 redirect 조합을 눈여겨 봐두자!!!
			// 새로운 화면단에서 쿼리스트링 방식으로 blist.do를 실행한 것과 같은 효과!!
		
		}else {
			throw new BoardException("게시글 수정 실패!!");
		}
		
		return mv;
	}
	
	private void deleteFile(String fileName, HttpServletRequest request) {
		String root = 
			request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\buploadFiles";
		
		File f = new File(savePath + "\\" + fileName);
		if(f.exists()) {
			f.delete();
		}
	}
	
	@RequestMapping("bdelete.do")
	public String boardDelete(Integer bId, HttpServletRequest request) {
		
		// 게시글을 삭제하기 전에 기존의 파일을 지운다.
		Board b = bService.selectBoard(bId);
		
		if(b.getOriginalFileName() != null) {
			deleteFile(b.getRenameFileName(), request);
		}
		
		// 게시글 삭제하기
		int result = bService.deleteBoard(bId);
		
		if(result > 0) {
			return "redirect:blist.do";
		}else {
			throw new BoardException("게시물 삭제 실패!");
		}
	}
@RequestMapping("rList.do")
public void getReplyList(HttpServletResponse response , int bId)throws JsonIOException, IOException {
	ArrayList<Reply> rList = bService.selectReplyList(bId);
	
	response.setContentType("application/json;charset =utf-8");
	
	Gson gson =new GsonBuilder().setDateFormat("yyyy-mm-dd").create();
	gson.toJson(rList, response.getWriter());
	
}

@RequestMapping("addReply.do")
@ResponseBody
public String addReply(Reply r, HttpSession session) {
	
	Member  loginUser = (Member)session.getAttribute("loginUser");
	String rWriter =loginUser.getId();
	r.setrWriter(rWriter);
	
	int result =bService.insertReply(r);
	
	if(result >0) {
		return "success";
	}else {
		throw new BoardException("댓글 등록 실패");
	}
}
}