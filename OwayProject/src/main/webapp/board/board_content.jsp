<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
	.wrap{
		width:60%;
		margin:0 auto;
		font-family: dotum,'돋움',sans-serif;
		font-size: 12px;
	}
	a{
		text-decoration: none;
	}
	table{
		width:100%;
		border-spacing: 0;
		border:1px solid #ededed;
	}
	td{
		border:1px solid #ededed;
	}
	.fr{
		text-align: right;
	}
	.reply_wrap ul{
		margin:0;
		padding:0;
		list-style: none;
	}
	.reply_wrap ul li{
		border-bottom: 1px solid #ededed;
		padding:12px;
	}
</style>
</head>
<body>
	<div class="wrap">
		<table align="center">
			<tr>
				<td width=20% align=center>제목</td>
				<td width=30% align=center>${bvo.title }</td>
				<td width=20% align=center>작성일자</td>
				<td width=30% align=center><fmt:formatDate value="${bvo.regdate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
			</tr>
			<tr>
				<td width=20% align=center>작성자</td>
				<td width=30% align=center>${bvo.name }</td>
				<td width=20% align=center>조회수</td>
				<td width=30% align=center>${bvo.hit }</td>
			</tr>
			<tr>
				<td colspan="4" align="left" valign="top">
					<pre>${bvo.content }</pre>
				</td> 
			</tr>
		</table>
		<div class="fr">
			<a href="board_list.do?page=${page }">목록</a>
		</div>
		<div class="reply_wrap">
			<ul>
				<c:forEach var="rvo" items="${rList}">
					<li>
						<div>
							<b>${rvo.id}</b>
							<span><fmt:formatDate value="${rvo.regdate}" pattern="yyyy-MM-dd hh:mm:ss"/></span>
						</div>
						<div>
							<pre>${rvo.msg }</pre>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>