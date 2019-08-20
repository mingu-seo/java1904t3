<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="util.*" %>
<%@ page import="user.ticket.*" %>
<%@ page import="manage.member.*" %>
<%
MemberVO member = (MemberVO)session.getAttribute("memberInfo");
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/user/include/commonHtml.jsp" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>마이페이지</title>
<link rel="stylesheet" href="/css/mypage.css">
<style>
   
</style>
<script type="text/javascript" src="/js/slick.js"></script>
<script type="text/javascript" src="/js/aos.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/js/function_jquery.js"></script>
<script type="text/javascript" src="/js/function.js"></script>
<script type="text/javascript" src="/js/function_mypage.js"></script>
<script type="text/javascript">
	$(function(){
		// 회원정보(1)
		// 텝메뉴(버튼)
		$(".con2-center li").click(function(){
			var btnmember = $(this).index();
			$(".members-wrap > div").hide();
			$(".members-wrap > div").eq(btnmember).show();
		});
		
		memberInfo(<%=member.getNo()%>);
		$(".members-wrap > div").eq(0).show();
		
	});
	
	function ticketShow(member_pk){
		$(".members-wrap > div").hide();
		$.ajax({
			type: "GET",
			url: "/user/mypage/ticket",
			data: { "member_pk" : member_pk},
			async: false,
			success: function(data){
				$(".con6").html(data);
				$(".con6-center").show();
			}
		});
	}
	
	
	
</script>
</head>
<body>
    <%@ include file="/WEB-INF/view/user/include/topmenu.jsp" %>
	<div class="con clear">
		<!-- 메인배너 시작 -->
		<div class="con1">
			<div class="con1-box">
				<h3>MY GALLERY</h3>
			</div>
		</div>
		<!-- 메인배너 끝 -->
		<!-- 카테고리 버튼 시작 -->
		<div class="con2 clear">
			<ul class="con2-center clear">
				<li class="con2-gr" onClick="memberInfo(<%=member.getNo()%>)">
					<img src="/img/mypage-con1-1.png">
					<h3>회원정보</h3>
					<p>개인정보 변경 및 회원<br>탈퇴를 하고싶다면?</p>
				</li>
				<li class="con2-gr">
					<img src="/img/mypage-con1-2.png">
					<h3>내가 본 작품</h3>
					<p>관람한 작품들을 한번에<br>모아 보고 싶다면?</p>
				</li>
				<li class="con2-gr" onclick="ticketShow(<%=member.getNo()%>)">
					<img src="/img/mypage-con1-3.png">
					<h3>예매내역</h3>
					<p>최근 예매한 작품이<br>궁금하다면?</p>
				</li>
				<li class="con2-gr">
					<img src="/img/mypage-con1-4.png">
					<h3>대관안내</h3>
					<p>고객님의 문의한 대관내역이<br>궁금하다면?</p>
				</li>
			</ul>
		</div>
		<!-- 카테고리 버튼 끝 -->

        <div class="members-wrap">
            <!-- 회원정보 -->
            <div class="con3">
            
            </div>   
            <!-- 내가 본 작품 -->
            <div class="con5">
                <div class="con5-center">
                    <div class="con5-text">
                        <h2>내가 본 작품</h2>
                        <h4>감상한 작품을 한곳에 모아서 볼 수 있는 나만의 갤러리입니다.</h4>
                    </div>
                    <div class="con5-exhibition">
                        <div class="con5-gr clear">
                            <div class="con5-left">
                                <img src="/img/mypage-con3-1.jpg">
                            </div>
                            <div class="con5-right">
                                <h3>WEATHER</h3>
                                <h5>WEATHER: 오늘, 당신의 날씨는 어떤가요?</h5>
                                <p>2018.05.03 - 2018.11.25</p>
                            </div>
                        </div>
                        <div class="con5-gr clear">
                            <div class="con5-left">
                                <img src="/img/mypage-con3-2.png">
                            </div>
                            <div class="con5-right">
                                <h3>WANDERLAND</h3>
                                <h5>WANDERLAND: 파리지앵의 산책</h5>
                                <p>2016.11.19 - 2016.12.11</p>
                            </div>
                        </div>
                        <div class="con5-gr clear">
                            <div class="con5-left">
                                <img src="/img/mypage-con3-3.jpg">
                            </div>
                            <div class="con5-right">
                                <h3>YOUTH</h3>
                                <h5>YOUTH: 청춘의 열병, 그 못다 한 이야기</h5>
                                <p>2015.02.09 - 2016.05.28</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 예매 내역 -->
            <div class="con6">
        
            </div>
            <!-- 대관내역 -->
            <div class="con7">
				<div class="con7-center">
					<div class="con7-text">
						<h2>대관내역</h2>
						<h4>고객님이 예약하신 대관장소입니다.</h4>
					</div>
					<table class="con7-table">
						<tr>
							<th>대관장소</th>
							<th>대관일시</th>
							<th>대관료</th>
							<th>비고</th>
						</tr>
						<tr>
							<td>제1 전시실</td>
							<td>2019.07.04</td>
							<td>1,010,000원</td>
							<td>대관중</td>
						</tr>
						<tr>
							<td>제2 전시실</td>
							<td>2019.02.01</td>
							<td>680,000원</td>
							<td>대관종료</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
                    </table>
            		</div>
				</div>    
			</div>
	</div>
<%@ include file="/WEB-INF/view/user/include/footer.jsp" %>
</body>


</html>