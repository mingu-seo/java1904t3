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
<title>전체 리뷰</title>
<link rel="stylesheet" href="/css/sub-exhibition3.css">
<style>
	.tbl-box td{
		"text-align:center";
	}
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
			<!-- 공지사항 구역 -->
			<div class="con2-right">
				<h5>전체 리뷰</h5>
				<p>모든 리뷰를 한곳에!</p>
				<div class="tbl-box">
				<p><span><strong>총 <%=totCount%>개</strong>  |  <%=param.getReqPageNo()%>/<%=totPage%>페이지</span></p>
					<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="리뷰입니다.">
								
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">작성자</th>
										<th scope="col">전시이름</th>
										<th scope="col">이미지</th>
										<th scope="col">제목</th> 
										<th scope="col">평점</th>
										<th scope="col">조회수</th>
										<th scope="col">작성일</th> 
									</tr>
								</thead>
								<tbody >
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
										<td <%=targetUrl%>><%=data.getName()%></td>
										<td <%=targetUrl%>><%=data.getTitle()%></td>
										<td <%=targetUrl%>>
										<% if (data.getImagename() == null){ %>
										<img src="/upload/review/noimage.png" width="100px" height="100px" />
										<%} else{ %>
										<img src="/upload/review/<%=data.getImagename()%>" width="100px" height="100px" /></td>
										<%} %>
										<td <%=targetUrl%>><%=data.getReviewtitle()%></td>
										<td <%=targetUrl%>><%=data.getReview_score()%></td>
										<td <%=targetUrl%>><%=data.getReadno()%></td>
										<td <%=targetUrl%>><%=DateUtil.getDateFormat(data.getRegistdate())%></td>
										
										
									</tr>
								<%
										}
									 }
								%>
								</tbody>
							</table>
				</div>
				<div class="btn" >
						<div class="btnRight">
							<a class="wbtn" href="write" ><button>리뷰쓰기</button> </a>
						</div>
				</div>
				<!-- 페이징 처리 -->
				<%=UserPage.indexList(param.getReqPageNo(), totPage, request)%>
				<!-- //페이징 처리 -->
				<div class="form-box">
					<form name="searchForm" id="searchForm" action="index" method="post">
								<div class="search">
									
									<select name="stype" title="검색을 선택해주세요">
										<option value="all" <%=Function.getSelected(param.getStype(), "all") %>>전체</option>
										<option value="member.name" <%=Function.getSelected(param.getStype(), "member.name") %>>작성자</option>
										<option value="display.title" <%=Function.getSelected(param.getStype(), "display.title") %>>전시이름</option>
										<option value="review.reviewtitle" <%=Function.getSelected(param.getStype(), "review.reviewtitle") %>>제목</option>
										<option value="review.contents" <%=Function.getSelected(param.getStype(), "review.contentss") %>>내용</option>
										
									</select>
									<input type="text" name="sval" value="<%=param.getSval()%>" title="검색할 내용을 입력해주세요" />
									<input type="image" src="/manage/img/btn_search.gif" class="submit" alt="검색" />
								</div>
							</form>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/view/user/include/footer.jsp" %>
</body>
</html>