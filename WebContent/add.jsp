<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css.css">
<script type="text/javascript">
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
	
	<div id="insertForm">
		<h1>참가자 등록</h1>
		<form action="addCtrl.jsp" method="post" onsubmit="return ask()">
		<table border="1">
			<tr>
				<th>참가번호</th>
				<td><input type="text" id="custno" name="custno" value=""></td>
			</tr>
			<tr>
				<th>참가자명</th>
				<td><input type="text" id="custname" name="custname" value=""></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>
					<input type="text" id="y" name="y" value="">년
					<input type="text" id="m" name="m" value="">월
					<input type="text" id="d" name="d" value="">일
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
				<td><input type="text" name="agency" id="agency"></td>
			</tr>
			<tr>
				<th colspan="2" align="center">
					<button type="submit">등록</button>
					<button type="reset">취소</button>
				</th>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>