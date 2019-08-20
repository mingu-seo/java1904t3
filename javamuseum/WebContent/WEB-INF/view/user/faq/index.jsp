<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="board.faq.*"%>
<%@ page import="property.SiteProperty"%>
<%@ page import="util.*"%>
<%@ page import="java.util.*"%>
<%
	FaqVO param = (FaqVO) request.getAttribute("vo");
	ArrayList<FaqVO> list = (ArrayList) request.getAttribute("list");
	int totCount = (Integer) request.getAttribute("totCount");
	int totPage = (Integer) request.getAttribute("totPage");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<%@ include file="/WEB-INF/view/user/include/commonHtml.jsp" %>
<title>FAQ</title>
<link rel="stylesheet" href="/css/news3.css">
<style>
</style>
<script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="/js/slick.js"></script>
<script type="text/javascript" src="/js/aos.js"></script>
<script type="text/javascript" src="/js/gnb.js"></script>
<script type="text/javascript" src="/js/isotope.pkgd.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(document).ready(function(event) {
			var filter = $(".filtering").isotope({
				itemSelector : '.all',
				layoutMode : 'fitRows'
			});
			$(".btn-group li").click(function(event) {
				event.preventDefault();
				var value = $(this).attr("data-name");

				filter.isotope({
					filter : value,
					transitionDuration : 500
				});
			});
		});
		//FAQ 접었다가 펼치는 기능 
		$(".con7-left").click(function() {

			var onCheck = $(this).children(".con7-leftbg").hasClass("on"); // true or false 의 값을 oncheck에 담아줌 

			if (onCheck) { //oncheck = true 일 때
				// 내 자신한테 아코디언 효과를 줄 때
				$(this).children(".con7-leftbg").removeClass("on"); // 화살표 이미지에 on을 붙여 노출시킴
				$(this).siblings(".con7-cont").hide(); // 텍스트 내용에 on을 붙여 노출시킴
			} else { //oncheck = false 일 때
				$(".con7-leftbg").removeClass("on"); // 기존의 화살표를 모두 지우는 작업
				$(".con7-cont").hide(); // 기존의 내용들을 모두 지우는 작업

				$(this).children(".con7-leftbg").addClass("on"); // 화살표 이미지에 on을 붙여 노출시킴
				$(this).siblings(".con7-cont").show(); //텍스트 내용에 on을 붙여 노출시킴
			}

		});

		//첫화면 높이값 안잡히는 부분 스크립트로 처리

		var hei = $(".con3-center").height();
		$(".members-wrap").height(hei);

		// 텝메뉴(버튼)
		$(".con2-center li").click(function() {
			var btnnember = $(this).index();
			$(".members-wrap > div").hide();
			$(".members-wrap > div").eq(btnnember).show();
		});
	});
</script>
</head>
<body>
	<%@ include file="/WEB-INF/view/user/include/topmenu.jsp" %>
	<div class="con">
		<!-- 메인배너 시작 -->
		<div class="con1">
			<div class="con1-box">
				<h3>News</h3>
				<P>FAQ</P>
			</div>
		</div>
		<!-- 메인배너 -->
		<!-- 왼쪽 서브페이지 시작-->
		<div class="con2 clear">
			<%@ include file="/WEB-INF/view/user/include/newsside.jsp" %>
			<!-- 왼쪽 서브페이지 끝 -->
			<!-- faq 시작 -->
			<div class="con2-right">
				<div class="con7-center">
					<div class="con7-text">
						<h2>FAQ</h2>
						<h4>방문하시는 고객님들이 자주하시는 질문</h4>
					</div>
					<div class="con7-qabox">
								<%
									if (totCount == 0) {
								%>
									<p class="first">등록된 글이 없습니다.</p>
								<%
									} else {
										FaqVO data;
										for (int i = 0; i < list.size(); i++) {
											data = list.get(i);
								%>
					
						<div class="con7-qa">

								<div>
									<ul class="con7-left clear">
										<li><img src="/img/mypage-Q.png"></li>
										<li><p class="title">
												<%=data.getQuestion()%>
											</p>
											</li>
										<li class="con7-leftbg"></li>
									</ul>
									<div class="con7-cont">
										<ul class="con7-sub">
											<li><img src="/img/mypage-A.png"></li>
											<li><p class="title">
													<%=data.getAnswer()%>
												</p>
												</li>
										</ul>
									</div>
								</div>
						</div>
									<%
											}
										}
									%>
					</div>
				</div>
			</div>
		</div>
	</div>
	

	<!-- faq 끝 -->
	<!-- 풋터 구역 -->
	<%@ include file="/WEB-INF/view/user/include/footer.jsp" %>
	<!-- 풋터 구역 -->
	

	
</body>

</html>