package com.practice.board;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

public interface BoardMapper {
	@Select("SELECT num,title,name,hit,regdate,rowno "
			+ "FROM (SELECT num,title,name,hit,regdate,@rownum:=@rownum+1 as rowno "
			+ "FROM owayboard WHERE (@rownum:=0)=0 ORDER BY num DESC ) a "
			+ "WHERE rowno BETWEEN #{start} AND #{end}")
	public List<BoardVO> boardAllData(Map map);
	@Select("SELECT COUNT(*) FROM owayboard")
	public int boardRowCount();
	@Select("SELECT num,name,title,content,regdate,hit,filecount,filenames "
			+ "FROM owayboard "
			+ "WHERE num=#{num}")
	public BoardVO boardContentData(int num);
	@Update("UPDATE owayboard SET "
			+ "hit=hit+1 "
			+ "WHERE num=#{num}")
	public void boardHitIncrement(int num);
	@Select("SELECT num,id,msg,regdate "
			+ "FROM owayreplyboard "
			+ "WHERE ref=#{pnum}")
	public List<BoardReplyVO> boardReplyData(int pnum);


}
