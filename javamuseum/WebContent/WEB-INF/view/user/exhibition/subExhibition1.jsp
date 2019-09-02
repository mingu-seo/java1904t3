<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="user.exhibition.*" %>
<%
MemberVO member = (MemberVO)session.getAttribute("memberInfo");
ArrayList<UExhibitionVO> list = (ArrayList)request.getAttribute("ingList");
UExhibitionVO param = (UExhibitionVO)request.getAttribute("param");
int totCount = (Integer)request.getAttribute("totCount");
int totPage = (Integer)request.getAttribute("totPage");
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/user/include/commonHtml.jsp" %>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" href="/css/jquery-ui.css">
<script src="/js/jquery-ui.js"></script>
<link rel="stylesheet" href="/css/sub-exhibition1.css">
<title>미술관소개</title>

<link rel="stylesheet" href="/css/jquery-ui.css">
<script src="/js/jquery-ui.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script src="https://kit.fontawesome.com/3db09483e7.js"></script>
<script type="text/javascript" src="/js/slick.js"></script>
<script type="text/javascript" src="/js/aos.js"></script>
<script>
	function getTicket(i) {
		<%if(member != null) {%>
		$.ajax({
			type : "GET",
			url : "/user/exhibition/ticket?no="+i,
			async : false,
			success : function (data) {
				$(".con3").html(data);
				$(".con3-bg").show();
				eventCal();
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
			url : "/user/exhibition/detail?no="+i,
			async : false,
			success : function(data) {
					$(".con3").html(data);
					$(".con4-bg").show();
			}
		
		});
	};
	
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
	
	$(function(){
		$(".con2-bggroup > li > a").click(function(event){ // a링크 정지
			event.preventDefault(); // a링크 정지
			$(this).siblings(".con2-sub01").stop().fadeIn(); 
		});
		$(".sub01-close").click(function(event){ // a링크 정지
			event.preventDefault(); // a링크 정지
			$(this).parent(".con2-sub01").stop().fadeOut();
		});
		$(".con4 #submit-btn2").click(function(){
			$(".con4-bg").hide();
		});
		$(".con4-epilogue").click(function(event){
			event.preventDefault();
			var list=$(this).hasClass("on") //클릭한 자기자신에게 on이 붙어있는지 없는지 확인
	
			if(list) { //on이 붙어있을때 - true
				$(this).removeClass("on");
				$(this).siblings(".con4-ep-cont").stop().slideUp();
			} else { //on이 없을때 - false
				$(".con4-epilogue").removeClass("on")
				$(this).addClass("on");
				$(".con4-epilogue").siblings(".con4-ep-cont").stop().slideUp();
				$(this).siblings(".con4-ep-cont").stop().slideDown();
			}	
		})
	});
	
	function eventCal() {
		//$("#con3-day-start").off(); 
		//$("#submit-btn2").off("click");
		
		$("#con3-day-start").datepicker({
			dayNamesMin:['일','월','화','수','목','금','토'], // 요일 변경 구문
			monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], // 월 변경 구문
			// 달력안에 오늘날짜로 돌리는 내용과 닫는 창을 노출시키는 필수 구문
			showButtonPanel: true, // 밑에 내용들 떄문에 써야하는 필수 구문
			currentText: '오늘 날짜', // 오늘 날짜로 돌아오는 구문 
			closeText: '닫기', // 달력창 닫기

			dateFormat: "yy-mm-dd", // 날짜 클릭시 text box에 담겨지는 순서
			yearRange: "2019:2019", // 2019년에서만 선택할 수 있게하는 구문
			minDate: "0D" //오늘 기준에서 이전거는 선택할 수 없게하는 구문
		});

		$("#submit-btn2").click(function(event){
			event.preventDefault();
			$(".con3-bg").hide();
		});
	}
</script>
</head>
<body>
<%@ include file="/WEB-INF/view/user/include/topmenu.jsp" %>
    <div class="con">
    	<!-- con1 상단 리뉴얼 -->
        <div class="con1">
            <div class="con1-box">
                <h3>EXHIBITION</h3>
                <P>현재 전시</P>
            </div>
        </div>
        <!-- //con1 -->
        <!-- con2 현재 전시 첫줄 -->
        <div class="con2">
            <div class="con2-center">
                <div class="con2-text">
                    <h3>CURRENT EXHIBITION</h3>
                </div>
                <%
                for(int i = 0; i < list.size(); i++){ 
                	if(list.get(i).getTitle() != null){
                %>
                <% if (i%3 == 0) { %>
                <ul class="con2-bggroup clear">
                <% } %>
                    <li>
                    	<input type="hidden" id="no<%=i%>" value="<%=list.get(i).getNo()%>"/>
                        <a href="#"><img src="/upload/exhibition/<%=list.get(i).getImagename()%>"/></a>
                        <div class="con2-sub01 clear">
                            <img src="/upload/exhibition/<%=list.get(i).getImagename()%>"/>
                            <div class="sub01-text">
                                <h4><%=list.get(i).getTitle() %></h4>
                                <h3><%=list.get(i).getArtist()%></h3>
                                <p><%=list.get(i).getPreview().replaceAll("\n","<br>")%></p>
								<ul class="sub01-btn clear">
                                    <li class="li1" onclick="getTicket(<%=list.get(i).getNo()%>)"><a href="javascript:;">예매하기</a></li>
                                    <li class="li2" onclick="getDetail(<%=list.get(i).getNo()%>)"><a href="javascript:;">작품 상세 보기</a></li>
                                </ul>
                            </div>
                            <div class="sub01-close">
                                 <a href="#"><img src="/img/sub-exhibition-close.png"></a>
                            </div>
                        </div>
                    </li>
                <% if (i%3==2 || i==list.size()-1) { %>
                </ul>
                <%
                 }
                	} else {
                %>
                <% if (i%3 == 0) { %>
                <ul class="con2-bggroup clear">
                <% } %>
                    <li>
                        <a href="#"><img src="/img/nopage.gif"/></a>
                    </li>
                <% if (i%3==2 || i==list.size()-1) { %>
                </ul>	
                <%
                }
                	}
                 } 
                 %>
            </div>
        </div>
        <!-- //con2 종료 -->
		<div class="con3">
		
		</div>
        <!-- con3 예매 페이지 -->
		<div class="con4">
			
        </div>
        <!-- //con4 후기 종료 -->
    </div>
    <!-- //con -->
<%@ include file="/WEB-INF/view/user/include/footer.jsp" %>
</body>
</html>
