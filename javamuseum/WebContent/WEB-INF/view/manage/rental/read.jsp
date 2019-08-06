<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="manage.rental.*" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="property.*" %>
<%
RentalVO param = (RentalVO)request.getAttribute("vo");
Rental_replyVO reparam = (Rental_replyVO)request.getAttribute("revo");
RentalVO data = (RentalVO)request.getAttribute("data");
ArrayList<Rental_replyVO> list = (ArrayList)request.getAttribute("list");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script type="text/javascript">
$(function() {
	$("#replyArea").hide();
});
	function goDelete() {
		var del = confirm ('삭제하시겠습니까?');
		if (del){
			document.location.href = "process?no=<%=data.getNo()%>&cmd=delete";
		} else {
			return false;
		}
	}
	function sendMail() {
		$("#mailfrm").submit();
	}
	
	function reply() {
		$("#replyArea").show();
		$("#reply").focus();
	}
</script>
</head>
<body> 
<%@ include file="/WEB-INF/view/manage/include/common.jsp" %>
<div id="wrap">
	<!-- canvas -->
	<div id="canvas">
		<!-- S T A R T :: headerArea-->
		<%@ include file="/WEB-INF/view/manage/include/top.jsp" %>
		<!-- E N D :: headerArea--> 
		
		<!-- S T A R T :: containerArea-->
		<div id="container">
			<div id="content">
				<div class="con_tit">
					<h2>대관관리 - [상세]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<h3>기본 정보</h3>
							<table width="80%" border="0" cellspacing="0" cellpadding="0" summary="대관 관리 기본내용입니다.">
								<colgroup>
									<col width="15%" />
									<col width="35%" />
									<col width="15%" />
									<col width="35%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">요청자 아이디</th>
										<td>
											<%=data.getMember_id()%>
										</td>
										<th scope="row">문의일자
										</th>
										<td>
											<%=DateUtil.getDateFormat(data.getRegistdate())%>
										</td>
									</tr>
									<tr>
										<th scope="row">요청자 이름</th>
										<td>
											<%=data.getMember_name()%>
										</td>
										<th scope="row">연락처</th>
										<td>
											<%=data.getTel()%>
										</td>
									</tr>
									<tr>
										<th scope="row">대관희망 전시관</th>
										<td>
											<%=data.getHallnumber()%>
										</td>
										<th scope="row">예상요금</th>
										<td>
											<%=data.getPrice()%>
										</td>
									</tr>
									<tr>
										<th scope="row">대관 시작일</th>
										<td>
											<%=data.getStartdate()%>
										</td>
										<th>대관 종료일</th>
										<td>
											<%=data.getStartdate()%>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">첨부파일</label></th>
										<td colspan="3">
											<% if (data.getFilename() == null || "".equals(data.getFilename())) { %>
												등록된 첨부파일이 없습니다.
											<% } else { %>
												<div class="weidtFile">
													<p><a href="<%= Function.downloadUrl(SiteProperty.RENTAL_UPLOAD_PATH, java.net.URLEncoder.encode(data.getFilename_org(), "UTF-8"), data.getFilename()) %>" target="_blank"><%= Function.checkNull(data.getFilename_org()) %> </a><br />
													</p>
												</div>
											<% } %>											
										</td>
									</tr>
									<tr>
										<td colspan="4" style="height:200px"><%=data.getContents()%></td>
									</tr>
								</tbody>
							</table>
							<br/>
							<h3>답변 내역</h3>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="답변내역입니다.">
								<colgroup>
									<col class="w3" />
									<col class="" />
									<col class="w20" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="first"><input type="checkbox" name="allChk" id="allChk" onClick="check(this, document.frm.no)"/></th>
										<th scope="col">답변 내용</th>
										<th scope="col" class="last">작성일</th>
									</tr>
								</thead>
								<tbody>
								<% if (list.size() == 0) { %>
									<tr>
										<td class="first" colspan="11">등록된 답변이 없습니다.</td>
									</tr>
								<%
									 } else {
										String targetUrl = "";
										for (int i=0; i<list.size(); i++) {
											targetUrl = "style='cursor:pointer;' onclick=\"location.href='"+param.getTargetURLParam("read", param, list.get(i).getNo())+"'\"";
								%>
									<tr>
										<td class="first"><input type="checkbox" name="no" id="no" value="<%=list.get(i).getNo()%>"/></td>
										<td <%=targetUrl%>><%=list.get(i).getReply()%></td>
										<td <%=targetUrl%>><%=DateUtil.getDateTimeFormat(list.get(i).getRegistdate())%></td>
									</tr>
								<%
										}
									 }
								%>
								</tbody>
							</table>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="<%=param.getTargetURLParam("index", param, 0)%>"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" onclick="reply()" href="#"><strong>답변쓰기</strong></a>
									<a class="btns" href="#" onClick="goDelete();"><strong>삭제</strong></a>
								</div>
							</div>
							<!--//btn-->
							<br/><br/>
							<div id="replyArea">
							<h3>답변 송신</h3>
							<form name="mailfrm" id="mailfrm" action="/user/rental/process.do" method="post">
							<table width="80%" border="0" cellspacing="0" cellpadding="0">
								<colgroup>
									<col width="25%" />
									<col width="75%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row">회원 이메일</th>
										<td>
											<%=data.getEmail()%>
										</td>
									</tr>
									<tr>
										<th scope="row">답변</th>
										<td>
											<textarea name="reply" id="reply" rows="8" cols="80"></textarea>
										</td>
									</tr>
								</tbody>
								<input type="hidden" name="cmd" value="sendMail"/>
								<input type="hidden" name="no" value="<%=data.getNo() %>"/>
								<input type="hidden" name="rental_pk" value="<%=data.getNo() %>"/>
							</table>
							</form>
							<div class="btnRight">
									<a class="btns" href="#" onclick="sendMail();"><strong>전송하기</strong></a>
								</div>
						</div>
						</div>
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

</body>
</html>