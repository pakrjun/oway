package com.practice.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class BoardService {
	@Resource(name="boardDAO")
	private BoardDAO dao;
	private static final Logger LOG=Logger.getLogger(BoardService.class);
	public void getBoardList(Model model, int curPage){

		int block=10;
		int start=(curPage*block)-(block-1);
		int end=curPage*block;
		
		Map map=new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);
		
		List<BoardVO> list=dao.boardAllData(map);
		int totalPage=dao.boardListCount();
		int fromPage=((curPage-1)/block*block)+1;
		int toPage=((curPage-1)/block*block)+block;
		if(toPage>totalPage){
			toPage=totalPage;
		}
		
		model.addAttribute("list", list);
		model.addAttribute("curPage",curPage);
		model.addAttribute("block",block);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("toPage",toPage);
		model.addAttribute("fromPage",fromPage);
	}
	public void getBoardContent(Model model,int num){
		BoardVO bvo=dao.boardContentData(num);
		List<BoardReplyVO> rList=dao.boardReplyData(num);
		
		model.addAttribute("bvo",bvo);
		model.addAttribute("rList",rList);
	}
	
}
