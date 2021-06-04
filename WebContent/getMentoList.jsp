<%@page import="java.util.ArrayList"%>
<%@page import="VO.SVO"%>
<%@page import="DAO.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	DAO dao= new DAO();
   		ArrayList<SVO> list = dao.getS();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css.css">
</head>
<body>
	<header id="header">
		<%@ include file="header.jsp" %>
	</header>
	
	<div id="menu">
		<%@ include file="menu.jsp" %>
	</div>
	
	<div id="main">
		<h1>멘토 점수 조회</h1>
		<table border="1">
		<tr>
			<th>참가번호</th>
			<th>참가자명</th>
			<th>생년월일</th>
			<th>포인트</th>
			<th>멘토이름</th>
			<th>등급</th>
		</tr>
		<%
			for(SVO m : list){
		%>
		<tr>
			<td><%=m.getId() %></td>
			<td><%=m.getName() %></td>
			<td><%=m.getBrith() %></td>
			<td><%=m.getPoint() %></td>
			<td><%=m.getMname() %></td>
			<td><%=m.getRenk() %></td>
		</tr>
		<%
			}
		%>
	</table>
</div>
	
</body>
</html>