<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="manage.review.*" %>
<%@ page import="manage.member.*" %>
<%@ page import="manage.exhibition.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
ReviewVO param = (ReviewVO)request.getAttribute("vo");
ReviewVO data = (ReviewVO) request.getAttribute("data");
ArrayList<ExhibitionVO> list = (ArrayList)request.getAttribute("list");
%>	
	
	
	
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>공지사항</title>
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
<script>
	
	function goSave() {
		if ($("#title").val() == "") {
			alert('제목을 입력하세요.');
			$("#title").focus();
			return false;
		}
		if ($("#contents").val() == "") {
			alert('제목을 입력하세요.');
			$("#contents").focus();
			return false;
		}
	}
	
	
</script>
</head>
<body>
	<!-- 헤더 구역 -->
	<div id="header">
		<div class="h-top clear">
			<ul class="login">
				<li><a href="login.html">LOGIN</a></li>
				<li><a href="membership.html">JOIN</a></li>
				<li><a href="mypage.html">MY PAGE</a></li>
			</ul>
		</div>
		<div class="h-bot">
			<div class="h-bot-line"></div>
			<div class="h-bot-in clear">
				<div class="logo">
					<a href="index.html">자바미술관</a>
				</div>
				<ul class="h-menu">
					<li><a href="#">VISIT</a>
						<div class="sub">
							<ul class="sub-menu">
								<li><a href="sub-visit1.html">관람안내</a></li>
								<li><a href="sub-visit2.html">미술관 소개</a></li>
								<li><a href="sub-visit3.html">오시는길</a></li>
							</ul>
						</div></li>
					<li><a href="#">EXHIBITION</a>
						<div class="sub">
							<ul class="sub-menu">
								<li><a href="sub-exhibition1.html">현재 전시</a></li>
								<li><a href="sub-exhibition2.html">지난 전시</a></li>
							</ul>
						</div></li>
					<li><a href="#">RENTAL</a>
						<div class="sub">
							<ul class="sub-menu">
								<li><a href="hall.html">대관안내</a></li>
								<li><a href="hall2.html">대관신청</a></li>
							</ul>
						</div></li>
					<li><a href="#">NEWS</a>
						<div class="sub">
							<ul class="sub-menu">
								<li><a href="news1.html">공지사항</a></li>
								<li><a href="news2.html">이벤트</a></li>
								<li><a href="news3.html">FAQ</a></li>
							</ul>
						</div></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 헤더 구역 -->

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
				<form method="post" name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do" enctype="multipart/form-data" onsubmit="return goSave();">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="w3" />
									<col width="w3" />
									<col width="w3" />
									<col width="w3" />
									<col width="w3" />
									<col width="w3" />
								</colgroup>
								
								<tbody>
								<tr>
										
										<th scope="row"><label for="">등록일</label></th>
										<td>
											<input type="text" id="registdate" name="registdate" class="inputTitle" value="<%=DateUtil.getFullToday()%>" title="등록일을 입력해주세요" />&nbsp;
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">첨부파일</label></th>
										<td colspan="3">
											<input type="file" id="imagename_tmp" name="imagename_tmp" class="w50" title="첨부파일을 업로드 해주세요." />	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*전시이름</label></th>
										<td colspan="3">
											<select name="display_pk">
												<%for(int i = 0; i < list.size(); i++){ %>
												<option value='<%=list.get(i).getNo()%>'>[<%=i+1%>관] <%=list.get(i).getTitle()%></option>
											<%} %>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*평점</label></th>
										<td colspan="3">
											<select name="reviewscore">
												<%=CodeUtil.getReviewScore(0) %>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*제목</label></th>
										<td colspan="3">
											<input type="text" id="title" name="title" class="w50" title="제목을 입력해주세요" />	
										</td>
									</tr>
									<tr>
										<td colspan="4">
											<textarea id="contents" name="contents" title="내용을 입력해주세요" style="width:100%;"></textarea>	
										</td>
									</tr>
										
								</tbody>
							</table>
							<input type="hidden" name="cmd" value="write"/>
							</form>
				
				
				
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="<%=param.getTargetURLParam("index", param, 0)%>"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" href="javascript:$('#frm').submit();"><strong>저장</strong></a>
								</div>
							</div>
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