<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="manage.review.*" %>
<%@ page import="manage.member.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
ReviewVO param = (ReviewVO)request.getAttribute("vo");
ReviewVO data = (ReviewVO)request.getAttribute("data");
ArrayList<ReviewVO> list = (ArrayList)request.getAttribute("list");
MemberVO member = (MemberVO)request.getAttribute("mvo");
ArrayList<MemberVO> mlist = (ArrayList)request.getAttribute("mlist");
int totCount = (Integer)request.getAttribute("totCount");
int totPage = (Integer)request.getAttribute("totPage");
%>	
	
	
	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>전체 리뷰</title>
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
				<h3>EXHIBITION</h3>
				<P>모든 리뷰</P>
			</div>
		</div>
		<!-- 상단 배너 구역 -->
		<div class="con2 clear">
			
			<div class="con2-left">
				
				<div class="con2-left-text">
					
				</div>
			</div>
			
			
			
			<!-- 공지사항 구역 -->
			<div class="con2-right">
				<h5>전체 리뷰</h5>
				<p>모든 리뷰를 한곳에!</p>
				<div class="tbl-box">
				<p><span><strong>총 <%=totCount%>개</strong>  |  <%=param.getReqPageNo()%>/<%=totPage%>페이지</span></p>
					<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="리뷰입니다.">
								<colgroup>
									<col class="w1" />
									<col class="w1" />
									<col class="w4" />
									<col class="w6" />
									<col class="w5" />
									<col class="w5" />
									<col class="w5" />
									<col class="w5" />
									<col class="w2" />
								</colgroup>
								<thead>
									<tr>
										
										<th scope="col">번호</th>
										<th scope="col">작성자</th>
										<th scope="col">전시이름</th>
										<th scope="col">이미지</th>
										<th scope="col">제목</th> 
										<th scope="col">평점</th>
										<th scope="col">좋아요</th>
										<th scope="col">조회수</th>
										<th scope="col">작성일</th> 
										
										
									</tr>
								</thead>
								<tbody>
								<% if (totCount == 0) { %>
									<tr>
										<td class="first" colspan="9">등록된 글이 없습니다.</td>
									</tr>
								<%
									 } else {
										String targetUrl = "";
										String topClass = "";
									
										for (int i=0; i<list.size(); i++) {
											data = list.get(i);
											targetUrl = "style='cursor:pointer;' onclick=\"location.href='"+param.getTargetURLParam("read", param, data.getNo())+"'\"";
								%>
									<tr <%=topClass%>>
										
										<td <%=targetUrl%>><%=totCount - ((param.getReqPageNo()-1)*param.getPageRows()) - i%></td>
										<td <%=targetUrl%> class="title"><%=data.getName()%></td>
										<td <%=targetUrl%> class="title"><%=data.getTitle()%></td>
										<td <%=targetUrl%>><img src="/upload/upload/<%=list.get(i).getImagename()%>" width="50px" height="50px" /></td>
										<td <%=targetUrl%> class="title"><%=data.getReviewtitle()%></td>
										<td <%=targetUrl%> class="title"><%=data.getReview_score()%></td>
										<td <%=targetUrl%> class="title"><%=data.getLike_cnt()%></td>
										<td <%=targetUrl%> class="title"><%=data.getReadno()%></td>
										<td <%=targetUrl%>><%=DateUtil.getDateFormat(data.getRegistdate())%></td>
										
										
									</tr>
								<%
										}
									 }
								%>
								</tbody>
							</table>
				</div>
				<div class="btn">
						<div class="btnRight">
							<a class="wbtn" href="write"><strong>리뷰쓰기</strong> </a>
						</div>
				</div>
				<!-- 페이지 넘기는 번호구역 -->
				<div class="number-box clear">
					<div class="img-box">
						<a href="#"><img src="/img/news1-prev.png"></a>
					</div>
					<div class="number">
						<a href="#">1</a>
					</div>
					<div class="number">
						<a href="news1-2.html">2</a>
					</div>
					<div class="number">
						<a href="#">3</a>
					</div>
					<div class="number">
						<a href="#">4</a>
					</div>
					<div class="number">
						<a href="#">5</a>
					</div>
					<div class="img-box">
						<a href="#"><img src="/img/news1-next.png"></a>
					</div>
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
	<div id="footer">
		<div class="foot-in">
			<div class="foot-top clear">
				<div class="foot-logo">
					<img src="img/logo.png">
				</div>
				<ul class="foot-menu">
					<li><a href="#">개인정보 처리방침</a></li>
					<li><a href="#">이용약관</a></li>
					<li><a href="#">영상정보처리기기 운영 관리방침</a></li>
					<li><a href="#">SITE MAP</a></li>
					<li><a href="#">CONTACT US</a></li>
				</ul>
			</div>
			<div class="foot-bot clear">
				<ul class="foot-bot-left">
					<li><h5>자바미술관</h5></li>
					<li>서울특별시 종로구 지하문로4길 21(통의동 35-1)</li>
					<li>(재)대림문화재단 서업자등록번호 : 305-82-09028 COPYRIGHT 2015 BY JAVA
						MUSEUM ALL RIGHT RESERVED.</li>
				</ul>
				<ul class="foot-bot-right">
					<li>전화예매 및 문의(무료전화)</li>
					<li><h6>02-720-0665</h6></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 풋터 구역 -->
</body>
</html>