<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	.board_wrap{
		width:1096px;
		margin:0 auto;
	}

	.board_wrap table{
		border-spacing: 0;
		font-size:12px;
		font-family:����,dotum,sans-serif; 	
		width:60%;
	}
	a{
		text-decoration: none;
		color: #4E4E4E;
	}
	.table-header th{
		border-top: 1px solid #adadad;
		border-bottom: 1px solid #adadad;
		padding: 5px;
	}
	td{
		text-align:center;
		padding: 3px 0 3px 5px;
		border-bottom: 1px solid #ededed;
	}
	.subject{
		text-align: left;
	}

</style>
</head>
<body>
	<div class="board_wrap">
		<table align="center">
			<thead>
				<tr class="table-header">
					<th align="10%">��ȣ</th>
					<th align="40%">����</th>
					<th align="20%">�̸�</th>
					<th align="20%">�ۼ���</th>
					<th align="10%">��ȸ��</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="vo" items="${list }">
					<tr>
						<td>${vo.num }</td>
						<td class="subject">
							<c:if test="${vo.depth!=0 }">
								<c:forEach var="i" begin="1" end="${vo.depth }">
									&nbsp;&nbsp;&nbsp;
								</c:forEach>
								<img src="../image/icon_reply.gif">
							</c:if>
							<a href="board_content.do?page=${curPage }&num=${vo.num}">${vo.title }</a>
						</td>
						<td>${vo.name }</td>
						<td><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/></td>
						<td>${vo.hit }</td>
					</tr>
				</c:forEach>				
			</tbody>
		</table>
	</div>
	<div class="paging" align="center">
		<c:if test="${curPage>block }">
			<a href="board_list.do?page=1"><img src="../image/icon_prevend.gif"/></a>
			<a href="board_list.do?page=${fromPage-1 }"><img src="../image/icon_prev.gif"/></a>
		</c:if>
		<c:if test="${curPage<=block }">
			<c:if test="${curPage==1 }">
				<img src="../image/icon_prevend_none.gif"/>
				<img src="../image/icon_prev_none.gif"/>
			</c:if>
			<c:if test="${curPage!=1 }">
				<a href="board_list.do?page=1"><img src="../image/icon_prevend.gif"></a>
				<img src="../image/icon_prev_none.gif"/>
			</c:if>
		</c:if>	
		<c:forEach var="i" begin="${fromPage }" end="${toPage }">
			<c:if test="${i!=curPage }">
				<a href="board_list.do?page=${i}">${i }</a>
			</c:if>
			<c:if test="${i==curPage }">
				<b>${i }</b>
			</c:if>
		</c:forEach>
		<c:if test="${toPage<totalPage }">
			<a href="board_list.do?page=${toPage+1 }"><img src="../image/icon_next.gif"/></a>
			<a href="board_list.do?page=${totalPage }"><img src="../image/icon_nextend.gif"/></a>
		</c:if>
		<c:if test="${toPage>=totalPage }">
			<img src="../image/icon_next_none.gif"/>
			<img src="../image/icon_nextend_none.gif"/>
		</c:if>
	</div>	
</body>
</html>
