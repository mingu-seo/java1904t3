<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="user.exhibition.*" %>
<%@ page import="manage.member.*" %>
<%@ page import="util.*" %>
<%@ page import="manage.review.*" %>
<%
UExhibitionVO detail = (UExhibitionVO)request.getAttribute("detail");
ArrayList<ReviewVO> rList = (ArrayList)request.getAttribute("rList");
MemberVO member = (MemberVO)session.getAttribute("memberInfo");
%>
<link rel="stylesheet" href="/css/jquery-ui.css">
<script src="/js/jquery-ui.js"></script>
<script>

$(function(){
	$(".con5-reviews").hide();
	$("#moreReview").hide();
	$(".detail").addClass("on");
	$(".review").removeClass("on");
	
	$("#submit-btn2").click(function(event){
		event.preventDefault();
		$(".con4-bg").hide();
	});
	
	$(".detail").click(function(event){
		event.preventDefault();
		$(this).addClass("on");
		$(".review").removeClass("on");
		$(".con6-reviewView").hide();
		$("#moreReview").hide();
		$(".con5-reviews").hide();
		$(".con5-contents").show();
	});
	
	$(".review").click(function(event){
		event.preventDefault();
		$(this).addClass("on");
		$(".detail").removeClass("on");
		$(".con6-reviewView").hide();
		$(".con5-contents").hide();
		$("#moreReview").show();
		$(".con5-reviews").show();
	});
})
 
</script>
<div class="con4-bg">
	<div class="con4-gr">
		<div class="con4-header">
			<h3>작품 상세</h3>
		</div>
		<div class="con4-center">
			<ul class="con4-top clear">
				<li class="con4-top-img"><img src="/upload/exhibition/<%=detail.getImagename()%>"></li>
				<li class="con4-top-text">
					<h4>로봇 일러스트레이션을 통해</h4>
					<h4>기계적 판타지를 구현하는</h4>
					<h3><%=detail.getArtist()%></h3>
					<p><%=detail.getPreview()%></p>
					<ul class="sub01-btn clear">
						<li class="like" id="like"><a href="javascript:;"><%=detail.getScore()%></a></li>
						<li class="li1" onclick="getTicket(<%=detail.getNo()%>)"><a href="javascript:;">예매하기</a></li>
					</ul>
				</li>
			</ul>
			<div class="con5-top">
				<ul class="con5-btn clear">
					<li class="detail" onclick="getDetailDes(<%=detail.getNo()%>)">상세 설명</li>
					<li class="review">리뷰</li>
				</ul>
				<div class="con5-contents">
					<%=detail.getContents()%>
				</div>
				<div class="con5-reviews">
					<table class="review-table">
						<tr class="reviewTh">
							<th></th>
							<th>리뷰 제목</th>
							<th>평점</th>
						</tr>
					<% 
					if(rList.size() != 0){
						for(int i = 0; i < rList.size(); i++) { if(i == 3) { break; }
					%>
						<tr class="reviewTr">
							<td><img src="/upload/review/<%=rList.get(i).getImagename()%>"></td>
							<td class="reviewtitle"><a href="javascript:reviewView(<%=rList.get(i).getNo()%>);"><%=rList.get(i).getReviewtitle()%></a></td>
							<td class="reviewscore"><%=rList.get(i).getReview_score()%></td>
						</tr>
					<% 	
						}
					} else {
					%>
						<tr class="reviewTr">
							<td colspan="3">등록된 리뷰가 없습니다.</td>
						</tr>
					<%	
					}
					%>
					</table>
				</div>
				<div class="con6-reviewView">
					
				</div>
			</div>
			<div class="con4-btn clear">
				<ul class="btn-group clear">
					<li><input type="button" id="moreReview" name="submit-btn1" value="후기 더보기" onclick="location.href='/user/review/index'"></li>
					<li><button id="submit-btn2">닫기</button></li>
				</ul>
			</div>
		</div>
	</div>
</div>
