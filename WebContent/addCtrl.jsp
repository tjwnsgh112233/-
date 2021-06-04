<%@page import="DAO.DAO"%>
<%@page import="VO.MVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	request.setCharacterEncoding("utf-8");
    	String custno = request.getParameter("custno");
    	String name = request.getParameter("custname");
    	String y = request.getParameter("y");
    	String m = request.getParameter("m");
    	String d = request.getParameter("d");
    	String fullDate = y + m + d;
    	
    	String gender = request.getParameter("gender");
    	String talent = request.getParameter("talent");
    	String agency = request.getParameter("agency");
    	
    	DAO dao = new DAO();
    	
    	MVO vo = new MVO();
    	
    	vo.setAgency(agency);;
    	vo.setBirth(fullDate);
    	vo.setGender(gender);
    	vo.setName(name);
    	vo.setNo(custno);
    	vo.setTalent(talent);
    	
    	int cnt = dao.add(vo);
    	if(cnt > 0){
    		response.sendRedirect("getMemberList.jsp");
    	}else{
    		response.sendRedirect("add.jsp");
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>