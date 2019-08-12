<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="util.*" %>
<%@ page import="board.qna.*" %>
<%@ page import="manage.member.*" %>
<%
MemberVO member = (MemberVO)session.getAttribute("memberInfo");
QnaVO data = (QnaVO)request.getAttribute("data");
%>
<script>

</script>
<div class="con10-center">
	<div class="con10-text">
		<h2>QnA</h2>
		<h4><%=member.getId()%> 님의 1:1 문의내역입니다.</h4>
	</div>
	<table class="con10-table" border="1">
		<tr>
			<th>첨부파일</th>
			<td style="padding-left:5px;">
				<%=data.getFilename()%>	
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td style="padding-left:5px;">
				<%=data.getMemberid()%>	
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td style="padding-left:5px;">
				<%=data.getTitle()%>	
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<p><%=data.getContents()%></p>	
			</td>
		</tr>
	</table>
	<div class="btn">
		<div class="btnLeft">
			<a class="btns" href="javascript:goIndex();"><strong>목록</strong> </a>
		</div>
		<div class="btnRight">
			<a class="btns" href="javascript:replyBtn(<%=data.getNo()%>);"><strong>글쓰기</strong> </a>
		</div>
	</div>
</div>