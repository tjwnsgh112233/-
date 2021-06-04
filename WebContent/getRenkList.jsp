<%@page import="VO.RVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	DAO dao= new DAO();
    	ArrayList<RVO> list = dao.getR();
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
		<h1>참가자 등수 조회</h1>
		<table border="1">
		<tr>
			<th>참가번호</th>
			<th>참가자명</th>
			<th>합계</th>
			<th>평균</th>
			<th>등수</th>
		</tr>
		<%
			int renk = 1;
			for(RVO m : list){
		%>
		<tr>
			<td><%=m.getId() %></td>
			<td><%=m.getName() %></td>
			<td><%=m.getSum() %></td>
			<td><%=m.getAvg() %></td>
			<td><%=renk %></td>
		</tr>
		<%
			renk++;
			}
		%>
	</table>
	</div>
</body>
</html>