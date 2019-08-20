<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="manage.review.*" %>
<%@ page import="util.*" %>
<%
ReviewVO data = (ReviewVO)request.getAttribute("data");
%>
<div class="con6-reviewView-box">
	<div>
		<div class="viewTitle clear">
			<div class="reviewTitle">
				<table>
					<tr>
						<td><%=data.getReviewtitle()%></td>
					</tr>
				</table>
			</div>
			<div class="writedate">
				<table>
					<tr>
						<td style=""><%=DateUtil.getDateTimeFormat(data.getRegistdate())%></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="view-top">
			<div class="viewWriter">
				<table class="view-table">
					<tr class="viewWriter">
						<td>작성자: <%=data.getName()%></td>
					</tr>
				</table>
			</div>
			<div class="viewReadno">
				조회수 <%=data.getReadno()%>
			</div>
		</div>
		<div class="viewContents">
				<div>
				<% if(data.getImagename() != null) { %>
				<img src="/upload/review/<%=data.getImagename()%>"/>
			<% } %>
				<%=data.getContents()%>
			</div>
		</div>
		<div class="btn">
			<div class="btnLeft">
				<a class="btns" href="javascript:goIndex();"><strong>목록</strong></a>
			</div>
		</div>
	</div>
</div>