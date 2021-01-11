package com.mycomp.spring1.board.model.service;

import java.util.ArrayList;

import com.mycomp.spring1.board.model.vo.Board;
import com.mycomp.spring1.board.model.vo.PageInfo;
import com.mycomp.spring1.board.model.vo.Reply;

public interface BoardService {

	int getListCount();

	ArrayList<Board> selectList(PageInfo pi);

	int insertBoard(Board b);

	int addReadCount(Integer bId);

	Board selectBoard(Integer bId);

	int updateBoard(Board b);

	int deleteBoard(Integer bId);

	ArrayList<Reply> selectReplyList(int bId);

	int insertReply(Reply r);

}
