<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="util.*" %>
<%@ page import="user.exhibition.*" %>
<%@ page import="manage.review.*" %>
<%
UExhibitionVO detail = (UExhibitionVO)request.getAttribute("detail");
ArrayList<ReviewVO> rList = (ArrayList)request.getAttribute("rList");
UExhibitionVO param = (UExhibitionVO)request.getAttribute("param");
%>
<script>
	$(function(){
		$(".con4 #submit-btn2").click(function() {
			$(".con4-bg").hide();
		});
		
		$(".con5-reviews").hide();
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
			$(".con5-reviews").hide();
			$(".con5-contents").show();
		});
		
		$(".review").click(function(event){
			event.preventDefault();
			$(this).addClass("on");
			$(".detail").removeClass("on");
			$(".con6-reviewView").hide();
			$(".con5-contents").hide();
			$(".con5-reviews").show();
		});
	})
	$.fn.generateStars = function() {
	console.log('gs');
	    return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*25));});
	};
	//숫자 평점을 별로 변환하도록 호출하는 함수
	$('.star-prototype').generateStars();
</script>
<div class="con4-bg">
	<div class="con4-gr">
		<div class="con4-header">
			<h3>전시후기</h3>
		</div>
		<div class="con4-center">
			<ul class="con4-top clear">
				<li class="con4-top-img"><img src="/upload/exhibition/<%=detail.getImagename()%>"></li>
				<li class="con4-top-text">
					<h4><%=detail.getTitle() %></h4>
					<h3><%=detail.getArtist()%></h3>
					<p style="min-height:80px;"><%=detail.getPreview()%></p>
					<ul class="sub01-btn clear">
						<li class="score" id="disScore"><span class="star-prototype"><%=detail.getScore()%></span><span style="font-size:30px;">&nbsp;<%=detail.getScore()%> / 5</span></li>
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
