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
	$(function(){
		// 회원정보(1)
		$(".con3-gr-btn").click(function(event){
			event.preventDefault();
			$(".con4-center").show();
		});
		$(".con4-closebtn").click(function(event){
			event.preventDefault();
			$(".con4-center").hide();
		});

	});
	
	//대관 & QnA 클릭시
	function qnaShow() {
		$(".members-wrap > div").hide();
		$.ajax({
			type: "POST",
			url: "/user/mypage/qna",
			data: {"memberid" : "<%=member.getId()%>" },
			async: false,
			success: function(data) {
				$(".con7").html(data);
				$(".con7").show();
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
				qnaShow();
				$(".members-wrap > div").hide();
				$(".members-wrap > div").eq(3).show();
			}
		});
	}
	//qna 목록 클릭시 index 페이지로
	function goIndex() {
		$(".members-wrap > div").hide();
		$(".con7").show();
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
            <div class="con3 clear">
                <div class="con3-center clear">
                    <div class="con3-text">
                        <h2>회원정보</h2>
                        <h4>회원님의 소중한 정보를 안전하게 관리하세요.</h4>
                    </div>
                    <div class="con3-gr-center">
                        <div class="con3-gr">
                            <h3>연락처 변경</h3>
                            <p class="con3-gr-fs"><span>연락처 이메일</span>:AB******@na***.com</p>
                            <p><span>본인확인 이메일</span>:AB******@na***.com</p>
                            <p><span>휴대전화</span>:-82 10-68**-****</p>
                            <div class="con3-gr-btn"><a href="#">정보 변경</a></div>
                        </div>
                        <div class="con3-gr">
                            <h3>회원탈퇴</h3>
                            <h5>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</h5>
                            <p>사용하고 계신 아이디(AB*****)는 탈퇴할 경우 재사용 및 복구가</p>
                            <p>불가능합니다. 탈퇴한 아이드는 본인과 타인 모두 재사용</p>
                            <p>및 복구가 불가하오니 신중하게 선택하시기 바랍니다.</p>
                            <div class="con3-gr-btn"><a href="#">회원탈퇴</a></div>
                        </div>
                    </div>
                </div>
                <div class="con4-center clear">
                        <div class="con4-text">
                            <h2>회원정보</h2>
                            <h4>회원님의 소중한 정보를 안전하게 관리하세요.</h4>
                        </div>
                        <div class="con4-pwbox">
                            <div class="con4-pwbox-text">
                                <h3>회원정보를 수정하시려면 비밀번호를 입력하셔야 합니다.</h3>
                                <p>회원님의 개인정보 보호를 위한 본인 확인 절차이오니,</p>
                                <p>자바미술관 회원 로그인 시 사용하시는 비밀번호를 입력해주세요.</p>
                            </div>
                            <form method="GET" action="insert.php">
                                <div class="con4-btnbox">
                                        <div class="con4-pw"><input type="password" id="con4-pw" name="con4-pw" placeholder="비밀번호를 입력해주세요." ></div>
                                        <div class="con4-btn clear">

                                            <div class="con4-okbtn">
                                                <a href="#">확인</a>
                                            </div>
                                            <div class="con4-closebtn">
                                                <a href="#">닫기</a>
                                            </div>
                                        </div>
                                </div>
                            </form>
                        </div>
                </div>
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