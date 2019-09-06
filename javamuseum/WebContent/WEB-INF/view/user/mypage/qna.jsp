<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="util.*" %>
<%@ page import="board.qna.*" %>
<%@ page import="manage.rental.*"%>
<%@ page import="manage.member.*" %>
<%
MemberVO member = (MemberVO)session.getAttribute("memberInfo");
QnaVO param = (QnaVO)request.getAttribute("param");
ArrayList<QnaVO> qnaList = (ArrayList)request.getAttribute("qnaList");
ArrayList<RentalVO> rentalList = (ArrayList)request.getAttribute("rentalList");
int qnatotCount = (Integer)request.getAttribute("qnatotCount");
int qnatotPage = (Integer)request.getAttribute("qnatotPage");
%>
<script>
function check(allChk, chkbox){
	if ( chkbox ) {
	    if ( chkbox.length ) {
	        for(var i = 0; i<chkbox.length; i++) {
	            chkbox[i].checked = allChk.checked;
	        }
	    } else {
	        chkbox.checked = allChk.checked;
	    }
    } else {
    	alert("선택할 항목이 없습니다.");
    }
}

function rentChange() {
	$(".con7-center").hide();
	$(".con77-center").show();
}

function qnaChange() {
	$(".con77-center").hide();
	$(".con7-center").show();
}

</script>
<div class="con7-center">
	<div class="con7-text">
		<h2>QnA</h2>
		<h4><%=member.getId()%> 님의 문의내역입니다.</h4>
	</div>
	<div class="con7-change">
		<a href="javascript:rentChange();">대관문의</a> | <span style="color:#5a5a5a">QnA</span>
	</div>
	<table class="con7-table">
		<tr>
			<th><input type="checkbox" name="allChk" id="allChk" onclick="check(this, document.frm.no)"/></th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
			<th>비고</th>
		</tr>
		<% if (qnaList.size() == 0) { %>
		<tr>
			<td class="first" colspan="5">문의하신 내역이 없습니다.</td>
		</tr>
		<%
		} else {
			for (int i=0; i < qnaList.size(); i++) {
		%>
		<tr>
			<td style="width:8%;"><input type="checkbox" name="no" id="no" value="<%=qnaList.get(i).getNo()%>"/></td>
			<td id="qnaTitle">
				<%
				if(qnaList.get(i).getNest() != 0){
					for(int j = 0; j < qnaList.get(i).getNest(); j++) { 
				%>
					<span>&nbsp;&nbsp;</span>
				<% 
					}
				%>
					<img src="/manage/img/answer_icon.gif"/>
				<%
				} 
				%>
				<a href='javascript:qnaRead(<%=qnaList.get(i).getNo()%>);' style="color:black;">
					<%=qnaList.get(i).getTitle()%>
				</a>
			</td>
			<td style="width:15%"><%=member.getId()%></td>
			<td style="width:15%"><%=DateUtil.getDateTimeFormat(qnaList.get(i).getRegistdate())%></td>
			<td style="width:10%"><input type="button" value="답변" onclick="replyBtn(<%=qnaList.get(i).getNo()%>);"/></td>
		</tr>
		<% 
			} 
		}
		%>
	</table>
	<div class="btn">
		<div class="btnLeft">
			<a class="btns" href="#" onclick="groupDelete();"><strong>삭제</strong></a>
		</div>
		<div class="btnRight">
			<a class="btns" href="qnaWrite"><strong>글쓰기</strong></a>
		</div>
	</div>
	<!-- 페이징 처리 -->
	<%=Page.indexListAjax(param.getReqPageNo(), qnatotPage, request)%>
	<!-- //페이징 처리 -->
</div>
<div class="con77-center">
	<div class="con77-text">
		<h2>대관문의</h2>
		<h4><%=member.getId()%> 님의 문의내역입니다.</h4>
	</div>
	<div class="con77-change">
		<span style="color:#5a5a5a">대관문의</span> | <a href="javascript:qnaChange();">QnA</a>
	</div>
	<table class="con77-table">
		<tr>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
		</tr>
		<% if (rentalList.size() == 0) { %>
		<tr>
			<td class="first" colspan="5">문의하신 내역이 없습니다.</td>
		</tr>
		<%
		} else {
			for (int i=0; i < rentalList.size(); i++) {
		%>
		<tr>
			<td id="qnaTitle">
				<a href='javascript:rentalRead(<%=rentalList.get(i).getNo()%>);' style="color:black;">
				<%=rentalList.get(i).getStartdate()%> ~ <%=rentalList.get(i).getEnddate()%> 대관 문의입니다.
			</a>
		</td>
			<td style="width:15%"><%=member.getId()%></td>
			<td style="width:15%"><%=DateUtil.getDateTimeFormat(rentalList.get(i).getRegistdate())%></td>
		</tr>
		<% 
			} 
		}
		%>
	</table>
</div>
