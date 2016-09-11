package com.practice.oway;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.practice.board.BoardService;
import com.practice.board.BoardVO;

@Controller
public class BoardController {
	@Resource(name="boardService")
	private BoardService boardService;
	
	@RequestMapping("board/board_list.do")
	public String board_list(String page,Model model){
		if(page==null){
			page="1";
		}
		int curPage=Integer.parseInt(page);
		boardService.boardList(model, curPage);
		
		return "board/board_list";
	}
	
}
