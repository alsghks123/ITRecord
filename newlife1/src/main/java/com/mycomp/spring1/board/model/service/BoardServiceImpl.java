package com.mycomp.spring1.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycomp.spring1.board.model.dao.BoardDao;
import com.mycomp.spring1.board.model.vo.Board;
import com.mycomp.spring1.board.model.vo.PageInfo;
import com.mycomp.spring1.board.model.vo.Reply;

@Service("bService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDao bDao;

	@Override
	public int getListCount() {
		
		return bDao.getListCount();
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		
		return bDao.selectBlist(pi);
	}

	@Override
	public int insertBoard(Board b) {
		
		return bDao.insertBoard(b);
	}

	@Override
	public int addReadCount(Integer bId) {
		
		return bDao.addReadCount(bId);
	}

	@Override
	public Board selectBoard(Integer bId) {
		
		return bDao.selectBoard(bId);
	}

	@Override
	public int updateBoard(Board b) {
		
		return bDao.updateBoard(b);
	}

	@Override
	public int deleteBoard(Integer bId) {
		
		return bDao.deleteBoard(bId);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int bId) {
		
		return bDao.selectReplyList(bId);
	}

	@Override
	public int insertReply(Reply r) {
		// TODO Auto-generated method stub
		return bDao.insertReply(r);
	}

}
