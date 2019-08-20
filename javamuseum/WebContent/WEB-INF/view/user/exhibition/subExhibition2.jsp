<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="user.exhibition.*" %>
<%
ArrayList<UExhibitionVO> list = (ArrayList)request.getAttribute("edList");
UExhibitionVO param = (UExhibitionVO)request.getAttribute("param");
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/user/include/commonHtml.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>미술관소개</title>
<link rel="stylesheet" href="/css/sub-exhibition2.css">
<style>
</style>
<script src="https://kit.fontawesome.com/3db09483e7.js"></script>
<script type="text/javascript" src="/js/slick.js"></script>
<script type="text/javascript" src="/js/aos.js"></script>
<script>
	function pastReview(no){
		$.ajax({
			type: "GET",
			url: "/user/exhibition/pastDetail?no="+no,
			async: false,
			success: function(data) {
				$(".con4").html(data);
				$(".con4-bg").show();
			}
		});
	}
	
	function reviewView(no) {
		$.ajax({
			type: "POST",
			url: "/user/exhibition/reviewView?no="+no,
			async: false,
			success: function(data) {
				$(".con5-reviews").hide();
				$(".con6-reviewView").html(data);
				$(".con6-reviewView").show();
			}
		});
	};
	
	function goIndex() {
		$(this).addClass("on");
		$(".detail").removeClass("on");
		$(".con6-reviewView").hide();
		$(".con5-contents").hide();
		$(".con5-reviews").show();
	}
		
	$(function() {
		hei = $(".con2-box-wrap").children(".con2-box").height();
		$(".con2-box-wrap").height(hei);

		$("#exhi-select").change(function() {
			$.ajax({
				type : "GET",
				url : "/user/exhibition/subExhibition2?startdate="+$("#exhi-select").val(),
				async : false,
				success : function (data) {
					$(".con2-box-wrap").html(data);
					/* $(".con2-box-wrap").css('height', 1000); */
					hei = $(".con2-box-wrap").children(".con2-box").height();
					$(".con2-box-wrap").height(hei);
				}
			});
		});
		
		$(".con4-epilogue").click(function(event) {
			event.preventDefault();
			var list = $(this).hasClass("on") //클릭한 자기자신에게 on이 붙어있는지 없는지 확인
	
			if (list) { //on이 붙어있을때 - true
				$(this).removeClass("on");
				$(this).siblings(".con4-ep-cont").stop().slideUp();
			} else { //on이 없을때 - false
				$(".con4-epilogue").removeClass("on")
				$(this).addClass("on");
				$(".con4-epilogue").siblings(".con4-ep-cont").stop().slideUp();
				$(this).siblings(".con4-ep-cont").stop().slideDown();
			}
		});
	});
</script>
</head>
<body>
<%@ include file="/WEB-INF/view/user/include/topmenu.jsp" %>
	<div class="con">
		<!-- 상단 배너구역 -->
		<div class="con1">
			<div class="con1-box">
				<h3>EXHIBITION</h3>
				<P>지난 전시</P>
			</div>
		</div>
		<!-- 전시 목록 구역 -->
		<div class="con2">
			<div class="con2-center">
				<div class="con2-text clear">
					<div class="con2-text-h3" id="topArea">
						<h3>PAST EXHIBITION</h3>
					</div>
					<!-- 날짜 선택구역 -->
					<div class="calender">
						<form method="GET" action="subExhibition2" id="subexhi">
							<select id="exhi-select" name="startdate" >
								<option value="all" <%=("all".equals(param.getStartdate())) ? "selected" : ""%>>전체</option>
								<option value="2019" <%=("2019".equals(param.getStartdate())) ? "selected" : ""%>>2019</option>
								<option value="2018" <%=("2018".equals(param.getStartdate())) ? "selected" : ""%>>2018</option>
								<option value="2017" <%=("2017".equals(param.getStartdate())) ? "selected" : ""%>>2017</option>
							</select>
						</form>
					</div>
					<!-- 날짜 선택구역 -->
				</div>
				<!-- 전시 작품 박스 -->
				<div class="con2-box-wrap">
					<div class="con2-box">
						<%for(int i = 0; i < list.size(); i++){ %>
						<div class="con2-box-list clear">
							<a href="javascript:;" onclick="pastReview(<%=list.get(i).getNo()%>)">
								<div class="con2-box-left">
									<img src="/upload/exhibition/<%=list.get(i).getImagename()%>">
								</div>
								<div class="con2-box-right">
									<h4><%=list.get(i).getTitle()%></h4>
									<p><%=list.get(i).getPreview()%></p>
									<span><%=list.get(i).getStartdate()%> ~ <%=list.get(i).getEnddate()%></span>
									<!-- 작품 호버시 -->
									<div class="con2-box-plus">
										<div class="con2-box-plus-img">
											<img src="/img/sub-exhibition2-plus.png">
										</div>
										<div class="con2-box-plus-text">관람평 / 후기</div>
									</div>
									<!-- 작품 호버시 -->
								</div>
							</a>
						</div>
						<%} %>
					</div>
				</div>
				<!-- 더보기란 -->
				<div class="more">
					<a href="#">Top</a>
				</div>
				<!-- 더보기란 -->
			</div>
		</div>
		<!-- 작품 클릭시 레이어팝업창 -->
		<div class="con4">
		
		</div>
	</div>
	<%@ include file="/WEB-INF/view/user/include/footer.jsp" %>
</body>
</html>