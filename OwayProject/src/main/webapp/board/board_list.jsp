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
		font-family:돋움,dotum,sans-serif; 	
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
					<th align="10%">번호</th>
					<th align="40%">제목</th>
					<th align="20%">이름</th>
					<th align="20%">작성일</th>
					<th align="10%">조회수</th>
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
							<a href="#">${vo.title }</a>
						</td>
						<td>${vo.name }</td>
						<td><fmt:formatDate value="${vo.regdate}" pattern="yyyy-MM-dd"/></td>
						<td>${vo.hit }</td>
					</tr>
				</c:forEach>				
			</tbody>
		</table>

	</div>
</body>
</html>
