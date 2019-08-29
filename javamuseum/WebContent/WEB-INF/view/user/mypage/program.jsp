<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="util.*" %>
<%@ page import="manage.reservation.*" %>
<%@ page import="manage.member.*" %>
<%
ArrayList<ReservationVO> list = (ArrayList)request.getAttribute("list");
%>
<link rel="stylesheet" href="/css/jquery-ui.css">
<script>

</script>
<div class="con5-center">
    <div class="con5-text">
        <h2>내가 신청한 프로그램</h2>
        <h4>신청한 프로그램을 한곳에 모아서 볼 수 있는 나만의 페이지입니다.</h4>
    </div>
    <div class="con5-exhibition">
          <% if (list.size() == 0) { %>
      <div style="text-align:center; font-size:30px; padding:20px;">
         신청하신 내역이 없습니다.
      </div>
      <% } else {
            for(int i = 0; i < list.size(); i++){ %>
        <div class="con5-gr clear">
            <div class="con5-left">
                <img src="/upload/program/<%=list.get(i).getImagename()%>">
            </div>
            <div class="con5-right">
                  <h2><%=list.get(i).getTitle()%></h2>
            <div class="con5-left-text">
               <p>예매번호 : <%=list.get(i).getNo()%></p>
               <p>신청한 날짜 : <%=list.get(i).getRegistdate()%></p>
               <p>프로그램일자 : <%=list.get(i).getDate()%> <%=CodeUtil.getP_timeName(list.get(i).getTime())%></p>
            </div>
            </div>
        </div>
          <% }
            } %>
    </div>
</div>