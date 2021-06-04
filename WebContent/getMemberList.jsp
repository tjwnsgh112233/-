<%@page import="VO.MVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	DAO dao= new DAO();
    	ArrayList<MVO> list = dao.getM();
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
		<h1>참가자 목록 조회</h1>
			<table border="1">
				<tr>
					<th>참가번호</th>
					<th>참가자명</th>
					<th>생년월일</th>
					<th>성별</th>
					<th>특기</th>
					<th>소속사</th>
					<th>삭제</th>
				</tr>
				<%
					for(MVO m : list){
				%>
				<tr>
					<td><a href="update.jsp?no=<%=m.getNo()%>"><%=m.getNo() %></a></td>
					<td><%=m.getName() %></td>
					<td><%=m.getBirth() %></td>
					<td><%=m.getGender() %></td>
					<td><%=m.getTalent() %></td>
					<td><%=m.getAgency() %></td>
					<td><a href="deleteCtrl.jsp?no=<%=m.getNo()%>">삭제</a></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>
</body>
</html>