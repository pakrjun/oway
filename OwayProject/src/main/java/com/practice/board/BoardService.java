package com.practice.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class BoardService {
	@Resource(name="boardDAO")
	private BoardDAO dao;
	
	public void boardList(Model model, int curPage){

		int block=10;
		int start=(curPage*block)-(block-1);
		int end=curPage*block;
		
		Map map=new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		List<BoardVO> list=dao.boardAllData(map);
		
		
		model.addAttribute("list", list);
		model.addAttribute("curPage",curPage);
	}
	
}
