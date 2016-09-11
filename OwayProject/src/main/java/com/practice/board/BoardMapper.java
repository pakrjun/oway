package com.practice.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

public interface BoardMapper {
	@Select("SELECT num,title,name,hit,regdate,depth,rowno "
			+ "FROM(SELECT num,title,name,hit,regdate,depth,@rownum:=@rownum+1 as rowno "
			+ "FROM(SELECT num,title,name,hit,regdate,depth "
			+ "FROM owayboard WHERE (@rownum:=0)=0 ORDER BY ref ASC,step ASC) a) b "
			+ "WHERE rowno BETWEEN #{start} AND #{end}")
	public List<BoardVO> boardAllData(Map map);
	@Select("SELECT COUNT(*) FROM owayboard")
	public int boardRowCount();
	
}
