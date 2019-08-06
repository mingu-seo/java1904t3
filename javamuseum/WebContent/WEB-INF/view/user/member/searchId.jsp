<%@ page import="util.*" %>
<%@ page import="manage.member.*" %>
<%@ page import="java.util.*" %>
<%
MemberVO data = (MemberVO)request.getAttribute("data");
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="ko">
<style>
#table {width: 320px; text-align: center;}
</style>
<head>
<script lang="JavaScript" type="text/JavaScript">
$(function() {
	if(<%=data.getId()%> == null) {
	window.close()
	}
});
function linkToOpener(URL){
if (window.opener && !window.opener.closed)
window.opener.location = URL;
window.close();
}
</script>
<title>ID</title>
</head>
<body>
	<table class="table" id="table" align="center" cellpadding="0" cellspacing="0" border="0">
		<tbody>
			<tr>
				<td colspan="2" height="88px">회원님의 ID는 "<%=data.getId()%>"입니다.</td>
			</tr>
			<tr>
				<td><input type="button" value="로그인하기" onclick="javascript:linkToOpener('http://localhost:8080/user');"></td>
				<td><input type="button" value="비밀번호찾기" onclick="javascript:linkToOpener('http://localhost:8080/user');"></td>
			</tr>
		</tbody>
	</table>
</body>
</html>