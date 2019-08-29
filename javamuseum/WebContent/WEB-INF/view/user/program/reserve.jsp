<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="manage.program.*" %>
<%@ page import="manage.member.*" %>
<%@ page import="util.*" %>
<%
ProgramVO reserve = (ProgramVO)request.getAttribute("reserve");
MemberVO member = (MemberVO)session.getAttribute("memberInfo");
ArrayList<HashMap> olist = (ArrayList<HashMap>) request.getAttribute("olist");
ArrayList<HashMap> list = (ArrayList<HashMap>) request.getAttribute("list");
%>
<link rel="stylesheet" href="/css/program.css">
<script src="/js/jquery-ui.js"></script>
<script>
$(function() {
	$(".submit-btn2").click(function(event){
		event.preventDefault();
		$(".con3").empty();
	});
})
 
function getProgramTime(){
	$.ajax({
		type : "GET",
		url : "/user/program/programTime?no=<%=reserve.getNo()%>&date="+$("#program_date").val(),
		async : false,
		success : function(data){
		$(".program_time").html(data);
		$("#program_time").show();
		$("#time_hidden").val(data);
		}
	});
}

function getProgram_membCount(){
	$.ajax({
		type : "GET",
		url : "/user/program/program_membCount?program_pk=<%=reserve.getNo()%>&date="+$("#program_date").val()+"&time="+$("#program_time").val(),
		async : false,
		success : function(data){
		$(".program_memNo").html(data);
		$(".memb_count").show();
		}
	});
}

</script>
<div class="con3-bg">
	<div class="con3-gr">
		<div class="con3-header">
			<h3><%=reserve.getTitle() %>프로그램 신청</h3>
		</div>
		<div class="con3-center">
			<ul class="con3-top clear">
				<li class="con3-top-img"><img src="/upload/program/<%=reserve.getImagename() %>" /></li>
				<li class="con3-top-text">
					<h3><%=reserve.getTitle()%></h3>
					<p>대상 : <%=reserve.getTarget()%></p>
					<p>기간 : <%=reserve.getP_time()%></p>
					<p>프로그램비용 : <%=reserve.getPrice()%></p>
					<p>강사명 : <%=reserve.getInstructor()%></p>
					<p>프로그램 장소 : <%=reserve.getLocation()%></p>
					<p>신청 최대인원 : <%=reserve.getMax_mem()%></p>
				</li>
			</ul>
			<div class="con3-bot">
				<form method="POST" action="process" name="frm" id="frm" onsubmit="return goSave();">
					<table class="con3-tb">
						<tr>
							<th>프로그램 일자</th>
							<td colspan="" class="program_date">
								<select name="date" id="program_date" onchange="getProgramTime()">
									<option value="">선택</option>
									<% for(int i=0;i<olist.size(); i++){ %>
									<option value="<%=olist.get(i).get("date")%>"><%=olist.get(i).get("date")%></option>
									<% } %>
								</select>	
							</td>
							<th>프로그램 시간</th>
							<td colspan="" class="program_time">
							
							</td>
						</tr>
						<tr>
							<th>현재 신청인원</th>
							<td colspan="4" class="program_memNo">
							
							</td>
						</tr>
					</table>
					<input type="hidden" name="program_pk" value="<%=reserve.getNo()%>"/>
					<input type="hidden" name="member_pk" value="<%=member.getNo()%>"/>
					<input type="hidden" name="time" id="time_hidden" value=""/>
					<div class="con3-btn clear">
						<ul class="btn-group">
							<li><input type="submit" id="submit-btn1" name="submit-btn1" value="신청하기" onclick="javascript:$('#frm').submit();"></li>
							<li><button id="submit-btn2" class="submit-btn2">닫기</button></li>
						</ul>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
