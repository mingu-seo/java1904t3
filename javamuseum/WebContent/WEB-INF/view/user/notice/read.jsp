<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="board.notice.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
NoticeVO param = (NoticeVO)request.getAttribute("vo");
NoticeVO data = (NoticeVO) request.getAttribute("data");
ArrayList<NoticeVO> list = (ArrayList)request.getAttribute("list");

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
								
								<tbody>
								<tr>
											<th scope="row"><label for="">작성자</label></th>
											<td><%=data.getWriter()%></td>
										</tr>
										<tr>
											<th scope="row"><label for="">첨부파일</label></th>
												<%if(data.getFilename() != null){ %>
												<td><a href="<%= Function.downloadUrl(SiteProperty.NOTICE_UPLOAD_PATH, java.net.URLEncoder.encode(data.getFilename_org(), "UTF-8"), 
														data.getFilename()) %>" target="_blank"><%= Function.checkNull(data.getFilename_org()) %> </a></td>
												<%}else{ %>
												<td>파일없음</td>
												<%} %>
										</tr>
										<tr>
											<th scope="row"><label for="">제목</label></th>
											<td><%=data.getTitle()%></td>
										</tr>
										<tr>
											<th scope="row"><label for="">내용</label></th>
											<td><%=data.getContents()%></td>
										</tr>
										
										<tr>
											<th scope="row"><label for="">등록일</label></th>
											<td><%=data.getRegistdate()%></td>
										</tr>
								</tbody>
							</table>
				</div>
				<div class="btn">
									<div class="btnLeft">
										<a class="btns"
											href="<%=param.getTargetURLParam("notice", param, 0)%>"><strong>목록</strong></a>
									</div>
									
								</div>
				
			</div>
		</div>
	</div>
	<!-- 풋터 구역 -->
	<%@ include file="/WEB-INF/view/user/include/footer.jsp" %>
	<!-- 풋터 구역 -->
</body>
</html>