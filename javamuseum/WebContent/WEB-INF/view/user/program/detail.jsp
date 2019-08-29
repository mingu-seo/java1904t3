<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="manage.program.*" %>
<%@ page import="manage.member.*" %>
<%@ page import="util.*" %>
<%
ProgramVO detail = (ProgramVO)request.getAttribute("detail");
MemberVO member = (MemberVO)session.getAttribute("memberInfo");
%>
<link rel="stylesheet" href="/css/jquery-ui.css">
<link rel="stylesheet" href="/css/program.css">

<script src="/js/jquery-ui.js"></script>
<script>

$(function(){
	$(".detail").addClass("on");
	$(".review").removeClass("on");
	
	$(".submit-btn2").click(function(event){
		event.preventDefault();
		$(".con4").empty();
	});
	
	
})
</script>
<div class="con4-bg">
	<div class="con4-gr">
		<div class="con4-header">
			<h3><%=CodeUtil.getCategory(detail.getCategory()) %> 프로그램 상세보기 </h3>
		</div>
		<div class="con4-center">
			<ul class="con4-top clear">
				<li class="con4-top-img"><img src="/upload/program/<%=detail.getImagename()%>"></li>
				<li class="con4-top-text">
					<h3><%=detail.getTitle()%></h3>
					<p>대상 : <%=detail.getTarget()%></p>
					<p>기간 : <%=detail.getP_time()%></p>
					<p>프로그램비용 : <%=detail.getPrice()%></p>
					<p>강사명 : <%=detail.getInstructor()%></p>
					<p>프로그램 장소 : <%=detail.getLocation()%></p>
					<p>신청 최대인원 : <%=detail.getMax_mem()%></p>
				</li>
			</ul>
			<div class="con5-top">
				<ul class="con5-btn clear">
					<li class="detail">상세 설명</li>
				</ul>
				<div class="con5-contents">
					<%=detail.getContents()%>
				</div>
			</div>
			<div class="con4-btn clear">
				<ul class="btn-group clear">
					<li><button id="submit-btn1" onclick="getReserve(<%=detail.getNo()%>)">신청하기</button></li>
					<li><button id="submit-btn2" class="submit-btn2">닫기</button></li>
				</ul>
			</div>
		</div>
	</div>
</div>
