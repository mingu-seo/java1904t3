<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="manage.reservation.*" %>
<%@ page import="manage.program.*" %>
<%@ page import="com.sun.org.apache.bcel.internal.classfile.Code"%>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%
MemberVO member = (MemberVO)session.getAttribute("memberInfo");
ProgramVO param = (ProgramVO)request.getAttribute("param");
ArrayList<ReservationVO> plist = (ArrayList)request.getAttribute("plist");
ArrayList<ProgramVO> list = (ArrayList)request.getAttribute("list");

int totCount = (Integer)request.getAttribute("totCount");
int totPage = (Integer)request.getAttribute("totPage");
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/user/include/commonHtml.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>미술관소개</title>
<link rel="stylesheet" href="/css/program.css">
<style>

</style>
<script type="text/javascript" src="/js/slick.js"></script>
<script type="text/javascript" src="/js/aos.js"></script>
<script>
function getReserve(i) {
	<%if(member != null) {%>
	$.ajax({
		type : "GET",
		url : "/user/program/reserve?no="+i,
		async : false,
		success : function(data) {
			$(".con4").hide();
			$(".con3").html(data);
			$(".con3-bg").show();
		}
	});
	<%} else {%>
		if(confirm("로그인이 필요합니다.\n로그인 하시겠습니까?") == true){
			location.href="/user";
		}
	<%} %>
};

function getDetail(i) {
	$.ajax({
		type : "GET",
		url : "/user/program/detail?no="+i,
		async : false,
		success : function(data) {
			$(".con3").empty();
			$(".con4").html(data);
			$(".con4").show();
			$(".con4-bg").show();
		}
	});
};

</script>
</head>
<body>
<%@ include file="/WEB-INF/view/user/include/topmenu.jsp" %>
	<div class="con">
		<!-- 상단 배너구역 -->
		<div class="con1">
			<div class="con1-box">
				<h3>PROGRAM</h3>
				<P>프로그램</P>
			</div>
		</div>
		<!-- 전시 목록 구역 -->
		<div class="con2">
		<%@ include file="/WEB-INF/view/user/include/newsside.jsp" %>
			<div class="con2-center">
				<div class="con2-text clear">
					<div class="con2-text-h3" id="topArea">
						<h3>프로그램</h3>
					</div>
				</div>
				<div class="con2-box-wrap">
					<div class="con2-box">
						<%for(int i = 0; i < list.size(); i++){ %>
						<div class="con2-box-list clear">
							<div class="con2-box-left">
								<img src="/upload/program/<%=list.get(i).getImagename()%>">
							</div>
							<div class="con2-box-right">
								<h4><%=list.get(i).getTitle() %></h4>
								<p>대상 : <%=list.get(i).getTarget() %></p>
								<p>시간 : <%=list.get(i).getP_time() %></p>
								<p>교육비 : 
								<% if(list.get(i).getPrice().equals("0")) {%>
									<span>무료</span>
								<% } else { %>
								<%=list.get(i).getPrice() %>
								<% } %>
								</p>
							    <ul class="sub01-btn">
	                                <li class="li1"><a href="javascript:getReserve(<%=list.get(i).getNo()%>);">신청하기</a></li>
	                                <li class="li2"><a href="javascript:getDetail(<%=list.get(i).getNo()%>);">상세보기</a></li>
                           		</ul>
							</div>
						</div>
						<%
							}
						%>
						
					</div>
				</div>
				<div class="page"><a><%=Page.indexList(param.getReqPageNo(), totPage, request)%></a></div>
			</div>
		</div>
		<div class="con3">
	
		</div>
		<div class="con4">
	
		</div>
	</div>
<%@ include file="/WEB-INF/view/user/include/footer.jsp" %>
	
</body>
</html>