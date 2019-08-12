<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="manage.review.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
ReviewVO param = (ReviewVO) request.getAttribute("vo");
ReviewVO data = (ReviewVO) request.getAttribute("data");
ArrayList<ReviewVO> list = (ArrayList)request.getAttribute("list");

%>    
	
	
	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>모든 리뷰</title>
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/sub-exhibition3.css">
<link rel="stylesheet" href="/css/footer.css">
<style>
</style>
<script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="/js/slick.js"></script>
<script type="text/javascript" src="/js/aos.js"></script>
<script type="text/javascript" src="/js/gnb.js"></script>
<script type="text/javascript">
function goDelete() {
	var del = confirm ('삭제하시겠습니까?');
	if (del){
		document.location.href = "process?no=<%=data.getNo()%>&cmd=delete";
	} else {
		return false;
	}
}
</script>
</head>
<body>
<%@ include file="/WEB-INF/view/user/include/topmenu.jsp" %>
	
	<div class="con">
		<!-- 상단 배너 구역 -->
		<div class="con1">
			<div class="con1-box">
				<h3>EXHIBITION</h3>
				<P>모든 리뷰</P>
			</div>
		</div>
		<!-- 상단 배너 구역 -->
		<div class="con2 clear">
			<!-- News란 구역 -->
			<div class="con2-left">
				<div class="con2-left-text">
				</div>
			</div>
			<!-- News란 구역 -->
			<!-- 공지사항 구역 -->
			<div class="con2-right">
				<h5>전체 리뷰</h5>
				<p>모든 리뷰를 한곳에!</p>
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
											<td><%=data.getName()%></td>
										</tr>
										<tr>
											<th scope="row"><label for="">제목</label></th>
											<td><%=data.getReviewtitle()%></td>
											<th scope="row"><label for="">조회수</label></th>
											<td><%=data.getReadno()%></td>
										</tr>
											
										<tr>
											<th scope="row"><label for="">전시이름</label></th>
											<td><%=data.getTitle()%></td>
											<th scope="row"><label for="">평점</label></th>
											<td><%=data.getReview_score()%></td>
											
										</tr>
										<tr>
											<th scope="row"><label for="">포토 후기</label></th>
											<td><% if (data.getImagename() == null){ %>
										<img src="/upload/review/noimage.png" width="20%" height="auto" />
										<%} else{ %>
										<img src="/upload/review/<%=data.getImagename()%>" width="20%" height="auto" /></td>
										<%} %>
										</tr>
										<tr>
											<th scope="row"><label for="">내용</label></th>
											<td><%=data.getContents()%></td>
										</tr>
										<tr>
										
										
										<tr>
											<th scope="row"><label for="">등록일</label></th>
											<td><%=data.getRegistdate()%></td>
										</tr>
									</tbody>
								</table>
				</div>
				
							<div class="btn">
									<div class="btnLeft">
										<a class="btns"	href="<%=param.getTargetURLParam("index", param, 0)%>"><strong>목록</strong></a>
									</div>
									<div class="btnRight">
										<a class="btns" href="<%=param.getTargetURLParam("edit", param, data.getNo())%>"><strong>수정</strong></a>
										<a class="btns" href="#" onclick="goDelete();"><strong>삭제</strong></a>
									</div>
							</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/view/user/include/footer.jsp" %>
</body>
</html>