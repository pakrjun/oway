package com.practice.board;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
	@Resource(name="boardMapper")
	private BoardMapper mapper;
	public List<BoardVO> boardAllData(Map map){
		return mapper.boardAllData(map);
	}
	public int boardListCount(){
		int count=mapper.boardRowCount();
		int total=(int)(Math.ceil(count/10.0));
		return total;
	}
	
}
