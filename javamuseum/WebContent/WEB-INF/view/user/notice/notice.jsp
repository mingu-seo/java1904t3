<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="board.notice.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
NoticeVO param = (NoticeVO)request.getAttribute("vo");
ArrayList<NoticeVO> list = (ArrayList)request.getAttribute("list");
int totCount = (Integer)request.getAttribute("totCount");
int totPage = (Integer)request.getAttribute("totPage");
%>	
	
	
	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<%@ include file="/WEB-INF/view/user/include/commonHtml.jsp" %>
<title>공지사항</title>
<link rel="stylesheet" href="/css/news1.css">
<style>
</style>
<script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="/js/slick.js"></script>
<script type="text/javascript" src="/js/aos.js"></script>
<script type="text/javascript" src="/js/gnb.js"></script>
<script type="text/javascript">
	$(function() {

	})
</script>
</head>
<body>
	<%@ include file="/WEB-INF/view/user/include/topmenu.jsp" %>

	<div class="con">
		<!-- 상단 배너 구역 -->
		<div class="con1">
			<div class="con1-box">
				<h3>News</h3>
				<P>공지사항</P>
			</div>
		</div>
		<!-- 상단 배너 구역 -->
		<div class="con2 clear">
			<!-- News란 구역 -->
			<%@ include file="/WEB-INF/view/user/include/newsside.jsp" %>
			<!-- News란 구역 -->
			<!-- 공지사항 구역 -->
			<div class="con2-right">
				<h5>공지사항</h5>
				<p>미술관 전체 소식을 알려드립니다.</p>
				<div class="tbl-box">
				<p><span><strong>총 <%=totCount%>개</strong>  |  <%=param.getReqPageNo()%>/<%=totPage%>페이지</span></p>
					<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리목록입니다.">
								<colgroup>
									<col class="w1" />
									<col class="w1" />
									<col class="w4" />
									<col class="w6" />
									<col class="w5" />
									<col class="w5" />
									
									<col class="w2" />
								</colgroup>
								<thead>
									<tr>
										
										<th scope="col">번호</th>
										<th scope="col">작성자</th>
										
										<th scope="col">제목</th> 
										
										<th scope="col">작성일</th> 
										
										
									</tr>
								</thead>
								<tbody>
								<% if (totCount == 0) { %>
									<tr>
										<td class="first" colspan="7">등록된 글이 없습니다.</td>
									</tr>
								<%
									 } else {
										String targetUrl = "";
										String topClass = "";
										NoticeVO data;
										for (int i=0; i<list.size(); i++) {
											data = list.get(i);
											targetUrl = "style='cursor:pointer;' onclick=\"location.href='"+param.getTargetURLParam("read", param, data.getNo())+"'\"";
								%>
									<tr <%=topClass%>>
										
										<td <%=targetUrl%>><%=totCount - ((param.getReqPageNo()-1)*param.getPageRows()) - i%></td>
										<td <%=targetUrl%> class="writer"><%=data.getWriter()%></td>
										<td <%=targetUrl%> class="title"><%=data.getTitle()%></td>
										<td <%=targetUrl%>><%=DateUtil.getDateFormat(data.getRegistdate())%></td>
										
										
									</tr>
								<%
										}
									 }
								%>
								</tbody>
							</table>
				</div>
				<div>
				<!-- 페이징 처리 -->
					<%=UserPage.indexList(param.getReqPageNo(), totPage, request)%>
				<!-- //페이징 처리 -->
				</div>
				<div class="form-box">
					<form method="GET" action="insert.php">
						<select>
							<option>전체</option>
							<option>제목</option>
							<option>내용</option>
						</select> <input type="text" name="name" id="name"
							placeholder="검색어를 입력하세요."> <input type="submit"
							value="검색">
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 풋터 구역 -->
	<%@ include file="/WEB-INF/view/user/include/footer.jsp" %>
	<!-- 풋터 구역 -->
</body>
</html>