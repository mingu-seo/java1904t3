<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="util.*" %>
<%@ page import="manage.member.*" %>
<%@ page import="board.qna.*" %>
<%
MemberVO member = (MemberVO)session.getAttribute("memberInfo");
QnaVO data = (QnaVO)request.getAttribute("data");
%>
<script>
	var oEditors; // 에디터 객체 담을 곳
	$(function(){
		oEditors = setEditor("contents"); // 에디터 셋팅
	});
	
</script>
<div class="con9-center">
	<div class="con9-text">
		<h2>1:1 문의하기 - [답변 쓰기]</h2>
	</div>
	<div class="con9-gr-center">
		<div class="con9-gr">
			<form name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process" method="post">
				<table class="con9-table" border="1">
					<tr>
						<th scope="row"><label for="">첨부파일</label></th>
						<td style="padding-left: 5px;"><input type="file" id="filename_tmp" name="filename_tmp" /></td>
					</tr>
					<tr>
						<th scope="row"><label for="">*제목</label></th>
						<td style="padding-left: 5px;"><input type="text" id="title" name="title" value="<%=data.getTitle()%>" /></td>
					</tr>
					<tr>
						<td colspan="2">
							<textarea id="contents" name="contents" style="width: 100%;">
								<br><br>
								==================================================
								<br>
								<%=Function.checkNull(data.getContents())%>
							</textarea>
						</td>
					</tr>
				</table>
				<input type="hidden" name="cmd" value="reply" />
				<input type="hidden" name="memberid" value="<%=member.getId()%>" />
				<input type="hidden" name="gno" value="<%=data.getGno() %>"/>
				<input type="hidden" name="ono" value="<%=data.getOno() %>"/>
				<input type="hidden" name="nest" value="<%=data.getNest() %>"/>
			</form>
			<!-- 버튼 -->
			<div class="btn">
				<div class="btnLeft">
					<a class="btns" href="javascript:;" onclick="goIndex();"><strong>목록</strong>
					</a>
				</div>
				<div class="btnRight">
					<a class="btns" href="javascript:qnaReply();"><strong>문의하기</strong>
					</a>
				</div>
			</div>
		</div>
	</div>
</div>
