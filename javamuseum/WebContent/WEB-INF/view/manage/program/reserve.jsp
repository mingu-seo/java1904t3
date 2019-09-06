      <%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="manage.reservation.*"%>
<%@ page import="manage.program.*"%>
<%@ page import="util.*"%>
<%@ page import="property.*"%>

<%
ReservationVO param = (ReservationVO) request.getAttribute("param");
ReservationVO data = (ReservationVO) request.getAttribute("data");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp"%>

<script>
function goSave() {
	$("#frm").submit();
	return true;
}

function searchMemb(){
	window.open("/manage/ticket/searchMemb", "회원 아이디 찾기", "width=600, height=700, left=100, top=50");
}
</script>
</head>
<body>
<%@ include file="/WEB-INF/view/manage/include/common.jsp"%>
	<div id="wrap">
		<!-- canvas -->
		<div id="canvas">
			<!-- S T A R T :: headerArea-->
			<%@ include file="/WEB-INF/view/manage/include/top.jsp"%>
			<!-- E N D :: headerArea-->
			<!-- S T A R T :: containerArea-->
			<div id="container">
				<div id="content">
					<div class="con_tit">
						<h2>프로그램신청내역- [등록]</h2>
					</div>
					<!-- //con_tit -->
					<div class="con">
						<!-- 내용 : s -->
						<div id="bbs">
							<div id="bread">
								<form method="post" name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/reservation/process.do">
									<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="프로그램 관리 기본내용입니다.">
										<colgroup>
											<col width="10%" />
											<col width="40%" />
											<col width="10%" />
											<col width="15%" />             
										</colgroup>
										<tbody>
											<tr>
												<th scope="row"><label for="">회원명</label></th>
												<td colspan="3"><input type="text" id="id" name="id" value=""/>&nbsp;&nbsp;<input type="button" value="아이디 찾기" onclick="searchMemb()"/></td>
											</tr>
											<tr>		
												<th scope="row"><label for="">프로그램명</label></th>
												<td colspan="3" id="title" name="title"><%=request.getParameter("title") %></td>
											</tr>				
											<tr>
												<th scope="row"><label for="">프로그램일자</label></th>
												<td ><%=request.getParameter("date") %></td>
												<th scope="row"><label for="">프로그램시간</label></th>
												<td><%=CodeUtil.getP_timeName(Integer.parseInt(request.getParameter("time"))) %></td>
											</tr>		   
										</tbody>
									</table>
									<input type="hidden" name="program_pk" id="program_pk" value="<%=param.getNo()%>"/>
									<input type="hidden" name="time" id="time" value="<%=Integer.parseInt(request.getParameter("time"))%>"/>
									<input type="hidden" name="date" id="date" value="<%=request.getParameter("date")%>"/> 
									<input type="hidden" name="cmd" value="write" />
									<input type="hidden" name="member_pk" id="member_pk" value="" />
								</form>
								<div class="btn">
									<div class="btnLeft">
										<a class="btns" href="<%=param.getTargetURLParam("list", param, 0)%>"><strong>목록</strong></a>
									</div>
									<div class="btnRight">
										<a class="btns" href="javascript:$('#frm').submit();"><strong>저장</strong></a>
									</div>
								</div>
                       			<!--//btn-->
                      	 		<!-- //bread -->
                    		</div>
                    		<!-- //bbs -->
                   			<!-- 내용 : e -->
               			</div>
							<!--//con -->
					</div>
               			<!--//content -->
				</div>
            	<!--//container -->
            	<!-- E N D :: containerArea-->
			</div>
         	<!--//canvas -->
		</div>
		<!--//wrap -->
	</div>
</body>
</html>