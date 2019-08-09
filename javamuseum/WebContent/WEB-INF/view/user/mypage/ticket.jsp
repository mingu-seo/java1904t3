<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="util.*" %>
<%@ page import="user.ticket.*" %>
<%@ page import="manage.ticket.*" %>
<%@ page import="manage.member.*" %>
<%
ArrayList<UTicketVO> myResList = (ArrayList)request.getAttribute("myResList");
TicketVO tparam = (TicketVO)request.getAttribute("tparam");
int restotCount = (Integer)request.getAttribute("restotCount");
int restotPage = (Integer)request.getAttribute("restotPage");
%>
<link rel="stylesheet" href="/css/jquery-ui.css">
<script>

</script>
<div class="con6-center">
	<div class="con6-text">
		<h2>예매내역</h2>
		<h4>예매한 작품내역을 날짜별로 확인할 수 있습니다.</h4>
	</div>
	<!-- 예매 내역 내용 -->
	<div class="con6-exhibition">
		<%for(int i = 0; i < myResList.size(); i++){ %>
		<div class="con6-gr clear">
			<div class="con6-left">
				<img src="/upload/exhibition/<%=myResList.get(i).getImagename()%>">
			</div>
			<div class="con6-right clear">
				<h5>
					<%=myResList.get(i).getTitle() %>
					<% if(myResList.get(i).getReservestate() != 1){ %>
						<span id="resCan" style="color:red; font-size: 20px;">(예매 취소)</span>
					<% } %>
				</h5>
				<div class="con6-left-text">
					<p>예매번호 : <%=myResList.get(i).getNo()%></p>
					<p>예매날짜 : <%=myResList.get(i).getReservedate()%></p>
					<p>매수 : <%=myResList.get(i).getNumber()%></p>
				</div>
				<div class="con6-right-text">
					<p class="disdate">관람일시 : <%=myResList.get(i).getDisplaydate()%></p>
					<p>결제금액 : <%=myResList.get(i).getPay_price()%></p>
					<p>결제상태 : <%=CodeUtil.getPayStateSave(myResList.get(i).getPaystate())%></p>
				</div>
				<%if(myResList.get(i).getReservestate() == 1){ %>
				<div class="con6-right-btn" onclick="cancelBtn(<%=myResList.get(i).getNo()%>, <%=i%>)">
					<span class="cancelbtn">예매 취소하기</span>
				</div>
				<%} %>
			</div>
		</div>
		<%} %>
	</div>
</div> 