package com.mycomp.spring1.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mycomp.spring1.board.model.vo.Board;
import com.mycomp.spring1.board.model.vo.PageInfo;
import com.mycomp.spring1.board.model.vo.Reply;

@Repository("bDao")
public class BoardDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public int getListCount() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("boardMapper.getListCount");
		
	}

	public ArrayList<Board> selectBlist(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		
		return (ArrayList)sqlSessionTemplate.selectList("boardMapper.getBoardList", null, rowBounds);
	}

	public int insertBoard(Board b) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("boardMapper.insertBoard",b);
	}

	public int addReadCount(Integer bId) {
		
		return sqlSessionTemplate.update("boardMapper.updateCount", bId);
	}

	public Board selectBoard(Integer bId) {
		
		return sqlSessionTemplate.selectOne("boardMapper.selectOne",bId);
	}

	public int updateBoard(Board b) {
		
		return sqlSessionTemplate.update("boardMapper.updateBoard",b);
	}

	public int deleteBoard(Integer bId) {
	
		return sqlSessionTemplate.delete("boardMapper.deleteBoard",bId);
	}

	public ArrayList<Reply> selectReplyList(int bId) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSessionTemplate.selectList("boardMapper.selectReplyList", bId);
	}

	public int insertReply(Reply r) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("boardMapper.insertReply",r);
	}

}
