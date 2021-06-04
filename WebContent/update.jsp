<%@page import="VO.MVO"%>
<%@page import="DAO.DAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String no = request.getParameter("no");
    	DAO dao = new DAO();
    	MVO m = dao.getM(no);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css.css">
<script type="text/javascript">

	window.onload = function() {
		var cnt = document.getElementsByName("gender")
		for(var i = 0; i < cnt.length; i++){
			if(cnt[i].value == "<%=m.getGender()%>"){
				cnt[i].checked = true;
			}
		}
		
		var e = document.getElementById("talent").options;
		for(var i = 0; i < e.length; i++){
			if(e[i].value == "<%=m.getTalent()%>"){
				e[i].selected = true;
			}
		}
	}

	function ask() {
		if(document.getElementById("custno").value == ""){
			alert("참가번호가 입력되지 않았습니다.");
			document.getElementById("custno").focus();
			return false;
		}
		if(document.getElementById("custname").value == ""){
			alert("참가자명이 입력되지 않았습니다.");
			document.getElementById("custname").focus();
			return false;
		}
		if(document.getElementById("y").value == "" || document.getElementById("m").value == "" || document.getElementById("d").value == ""){
			alert("생년월일이 입력되지 않았습니다.");
			return false;
		}
		var gender= "";
		var cnt = document.getElementsByName("gender")
		for(var i=0; i < cnt.length; i++){
			if(cnt[i].checked == true){
				gender = cnt[i].value
			}
		}
		
		if(gender === ""){
			alert("성별이 입력되지 않았습니다");
			return false;
		}
		if(document.getElementById("talent").value == ""){
			alert("특기가 입력되지 않았습니다.");
			document.getElementById("talent").focus();
			return false;
		}
		if(document.getElementById("agency").value == ""){
			alert("소속사가 입력되지 않았습니다.");
			document.getElementById("agency").focus();
			return false;
		}
		alert("참가자등록이 완료되었습니다.");
		return true;
	}
</script>
</head>
<body>
	<header id="header">
		<%@ include file="header.jsp" %>
	</header>
	
	<div id="menu">
		<%@ include file="menu.jsp" %>
	</div>
	
	<div id="insertFrom">
		<h1>참가자 수정</h1>
		<form action="updateCtrl.jsp" method="post" onsubmit="return ask()">
					<input type="hidden" id="no" name="no" value="<%=no%>">
		<table border="1">
			<tr>
				<th>참가번호</th>
				<td><input type="text" id="custno" name="custno" value="<%=m.getNo()%>"></td>
			</tr>
			<tr>
				<th>참가자명</th>
				<td><input type="text" id="custname" name="custname" value="<%=m.getName()%>"></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>
					<input type="text" id="y" name="y" value="<%=m.getBirth().substring(0, 4)%>">년
					<input type="text" id="m" name="m" value="<%=m.getBirth().substring(4, 6)%>">월
					<input type="text" id="d" name="d" value="<%=m.getBirth().substring(6)%>">일
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="gender" value="M">남성
					<input type="radio" name="gender" value="F">여성
				</td>
			</tr>
			<tr>
				<th>특기</th>
				<td>
					<select name="talent" id="talent">
						<option value="">특기선택</option>
						<option value="1">보컬</option>
						<option value="2">댄스</option>
						<option value="3">랩</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>소속</th>
				<td><input type="text" name="agency" id="agency" value="<%=m.getAgency()%>"></td>
			</tr>
			<tr>
				<th colspan="2" align="center">
					<button type="submit">수정</button>
					<button type="reset">취소</button>
				</th>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>