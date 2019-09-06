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
		/* $(".con2-center li").click(function(){
			var btnmember = $(this).index();
			$(".members-wrap > div").hide();
			$(".members-wrap > div").eq(btnmember).show();
		}); */
		
		memberInfo(<%=member.getNo()%>);
		$(".members-wrap > div").eq(0).show();
		
	});
	
	//대관 & QnA 클릭시
	function qnaShow(reqPageNo) {
		$(".members-wrap > div").hide();
		$.ajax({
			type: "POST",
			url: "/user/mypage/qna",
			data: {"memberid" : "<%=member.getId()%>", "reqPageNo":reqPageNo },
			async: false,
			success: function(data) {
				$(".con7").html(data);
				$(".con7").show();
				$(".con77-center").hide();
			}
		});
	}
	
	function program(member_pk) {
		$(".members-wrap > div").hide();
		$.ajax({
			type: "GET",
			url: "/user/mypage/program",
			data: { "member_pk" : member_pk},
			async: false,
			success: function(data){
				$(".con5").html(data);
				$(".con5").show();
			}
		});
	}
	
	//예매 내역 클릭시
	function ticketShow(member_pk) {
		$(".members-wrap > div").hide();
		$.ajax({
			type: "GET",
			url: "/user/mypage/ticket",
			data: { "member_pk" : member_pk},
			async: false,
			success: function(data){
				$(".con6").html(data);
				$(".con6").show();
			}
		});
	}
	
	//예매 내역에서 예매 취소 클릭시
	function cancelBtn(no, i){
		var idx = i;
		if(confirm("예매를 취소하시겠습니까?") == true) {
			$.ajax({
				type: "POST",
				url: "/user/mypage/cancel?no="+no,
				data: {
					canceldate : "<%=DateUtil.getToday()%>"
				},
				async: false,
				success: function(data){
					alert("예매를 취소하였습니다.");
					ticketShow(<%=member.getNo()%>);
					$(".members-wrap > div").hide();
					$(".members-wrap > div").eq(2).show();
				}
			}); 
		}
	}
	
	// qna 답변형 쓰기 
	function replyBtn(no) {
		$(".members-wrap > div").hide();
		$.ajax({
			type: "GET",
			url: "/user/mypage/qnaReply?no="+no,
			data: { "memberid" : "<%=member.getId()%>"},
			async: false,
			success: function(data){
				$(".con9").html(data);
				$(".con9").show();
			}
		});
	}
	
	// qna 상세페이지
	function qnaRead(no) {
		$(".members-wrap > div").hide();
		$.ajax({
			type: "POST",
			url: "/user/mypage/qnaRead?no="+no,
			async: false,
			success: function(data) {
				$(".con10").html(data);
				$(".con10").show();
			}
		});
	}
	
	// qna 답변 달기
	function qnaReply() {
		var sHTML = oEditors.getById["contents"].getIR();
		if (sHTML == "" || sHTML == "<p><br></p>") {
			alert('내용을 입력하세요.');
			$("#contents").focus();
			return false;
		} else {
			oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
		}
		$.ajax({
			type: "POST",
			url: "/user/mypage/process",
			data: $("[name=frm]").serialize(),
			async:false,
			success: function() {
				alert("답변 등록에 성공하셨습니다.");
				$(".members-wrap > div").hide();
				qnaShow(1);
				$(".members-wrap > div").hide();
				$(".members-wrap > div").eq(3).show();
			}
		});
	}
	//qna 목록 클릭시 index 페이지로
	function goIndex() {
		$(".members-wrap > div").hide();
		$(".con7").show();
		$(".con77-center").hide();
	}
	
	function pageIndex(curpage) {
		$.ajax({
			
		})
	}
	
	function getAjaxPage(reqPage) {
		qnaShow(reqPage);
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
				<li class="con2-gr" onclick="program(<%=member.getNo()%>)">
					<img src="/img/mypage-con1-2.png">
					<h3>나의 프로그램</h3>
					<p>신청한 프로그램들을 한번에<br>모아 보고 싶다면?</p>
				</li>
				<li class="con2-gr" onclick="ticketShow(<%=member.getNo()%>)">
					<img src="/img/mypage-con1-3.png">
					<h3>예매내역</h3>
					<p>최근 예매한 작품이<br>궁금하다면?</p>
				</li>
				<li class="con2-gr" onclick="qnaShow(1)">
					<img src="/img/mypage-con1-4.png">
					<h3>대관문의 & QnA</h3>
					<p>고객님의 문의한 내역이<br>궁금하다면?</p>
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

            </div>
            <!-- 예매 내역 -->
            <div class="con6">
        
            </div>
            <!-- 대관내역 & QnA-->
            <div class="con7">
            
			</div>
			<!-- QnA 답변-->
            <div class="con9">
            
			</div>
			<!-- QnA 상세 -->
			<div class="con10">
			
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/view/user/include/footer.jsp" %>
</body>


</html>