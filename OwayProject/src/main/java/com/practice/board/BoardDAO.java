package com.practice.board;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
	@Resource(name="boardMapper")
	private BoardMapper mapper;
	private static final Logger LOG=Logger.getLogger(BoardDAO.class);
	public List<BoardVO> boardAllData(Map map){
		return mapper.boardAllData(map);
	}
	public int boardListCount(){
		int count=mapper.boardRowCount();
		int total=(int)(Math.ceil(count/10.0));
		return total;
	}
	public BoardVO boardContentData(int num){
		return mapper.boardContentData(num);
	}
	public List<BoardReplyVO> boardReplyData(int pnum){
		return mapper.boardReplyData(pnum);
	}
}
