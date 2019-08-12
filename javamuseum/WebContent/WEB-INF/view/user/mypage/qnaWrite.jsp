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
<script type="text/javascript">
	var oEditors; // 에디터 객체 담을 곳
	$(function(){
		oEditors = setEditor("contents"); // 에디터 셋팅
		window.onbeforeunload = function(e) {
		    var dialogText = 'Dialog text here';
		    e.returnValue = dialogText;
		    return dialogText;
		};
		$(".members-wrap > div").show();
		// 회원정보(1)
		$(".con3-gr-btn").click(function(event){
			event.preventDefault();
			$(".con4-center").show();
		});
		$(".con4-closebtn").click(function(event){
			event.preventDefault();
			$(".con4-center").hide();
		});

		// 텝메뉴(버튼)
		$(".con2-center li").click(function(){
			var btnnember = $(this).index();
			location.href="/user/mypage/mypage";
			/* $(".members-wrap > div").hide();
			$(".members-wrap > div").eq(btnnember).show(); */
		});
	});
	
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
				<li class="con2-gr">
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
				<li class="con2-gr" onclick="qnaShow()">
					<img src="/img/mypage-con1-4.png">
					<h3>대관문의 & QnA</h3>
					<p>고객님의 문의한 대관내역이<br>궁금하다면?</p>
				</li>
			</ul>
		</div>
		<!-- 카테고리 버튼 끝 -->

        <div class="members-wrap">
            <!-- 회원정보 -->
            <div class="con8 clear">
                <div class="con8-center clear">
                    <div class="con8-text">
                        <h2>1:1 문의하기 - [쓰기]</h2>
                    </div>
                    <div class="con8-gr-center">
                        <div class="con8-gr">
                        	<form method="post" name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process" enctype="multipart/form-data" onsubmit="return goSave();">
                        		<table class="con8-table" border="1">
									<tr>
										<th scope="row"><label for="">첨부파일</label></th>
										<td style="padding-left:5px;">
											<input type="file" id="filename_tmp" name="filename_tmp" />	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*제목</label></th>
										<td style="padding-left:5px;">
											<input type="text" id="title" name="title" />	
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<textarea id="contents" name="contents" style="width:100%;"></textarea>	
										</td>
									</tr>
                        		</table>
                        		<input type="hidden" name="cmd" value="qnaWrite" />
                        		<input type="hidden" name="memberid" value="<%=member.getId()%>"/>
                        	</form>
                        	<!-- 버튼 -->
                        	<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="#" onclick="location.href='/user/mypage/mypage'"><strong>목록</strong> </a>
								</div>
								<div class="btnRight">
									<a class="btns" href="javascript:$('#frm').submit();"><strong>문의하기</strong> </a>
								</div>
							</div>
                        </div>
                    </div>
                </div>
            </div>    
		</div>
	</div>
<%@ include file="/WEB-INF/view/user/include/footer.jsp" %>
</body>
</html>