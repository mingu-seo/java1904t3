<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="manage.review.*" %>
<%@ page import="manage.member.*" %>
<%@ page import="manage.exhibition.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
ReviewVO param = (ReviewVO)request.getAttribute("vo");
ReviewVO data = (ReviewVO) request.getAttribute("data");
ArrayList<ExhibitionVO> list = (ArrayList)request.getAttribute("list");
MemberVO member = (MemberVO)session.getAttribute("memberInfo");
%>	
	
	
	
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>공지사항</title>
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/sub-exhibition3.css">
<link rel="stylesheet" href="/css/footer.css">
<style>
</style>
<script type="text/javascript" src="/js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="/js/slick.js"></script>
<script type="text/javascript" src="/js/aos.js"></script>
<script type="text/javascript" src="/js/gnb.js"></script>
<script>
	

	
function goSave() {
	if ($("#title").val() == "") {
		alert('제목을 입력하세요.');
		$("#title").focus();
		return false;
	}
	if ($("#contents").val() == "") {
		alert('내용을 입력하세요.');
		$("#contents").focus();
		return false;
	}
	

}
	
	
</script>
</head>
<body>
	<%@ include file="/WEB-INF/view/user/include/topmenu.jsp" %>

	<div class="con">
		<!-- 상단 배너 구역 -->
		<div class="con1">
			<div class="con1-box">
				<h3>EXHIBITION</h3>
				<P>모든 리뷰</P>
			</div>
		</div>
		<!-- 상단 배너 구역 -->
		<div class="con2 clear">
			<!-- News란 구역 -->
			<div class="con2-left">
				<div class="con2-left-text">
				</div>
			</div>
			<!-- News란 구역 -->
			<!-- 공지사항 구역 -->
			<div class="con2-right">
				<h5>전체 리뷰</h5>
				<p>모든 리뷰를 한곳에!</p>
				<div class="tbl-box">
				<form method="post" name="frm" id="frm" action="<%=Function.getSslCheckUrl(request.getRequestURL())%>/process.do" enctype="multipart/form-data" onsubmit="return goSave();">
					<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="관리자 관리 기본내용입니다.">
								<colgroup>
									<col width="w3" />
									<col width="w3" />
									<col width="w3" />
									<col width="w3" />
									<col width="w3" />
									<col width="w3" />
								</colgroup>
								
								<tbody>
								<tr>
										
										<th scope="row"><label for="">등록일</label></th>
										<td>
											<input type="text" id="registdate" name="registdate" class="inputTitle" value="<%=DateUtil.getFullToday()%>" title="등록일을 입력해주세요" />&nbsp;
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">첨부파일</label></th>
										<td colspan="3">
											<input type="file" id="imagename_tmp" name="imagename_tmp" value="<%=data.getImagename() %>" width="50" height="50"  />	
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*전시이름</label></th>
										<td colspan="3">
											<select name="display_pk">
												<%for(int i = 0; i < list.size(); i++){ %>
												<option value='<%=list.get(i).getNo()%>'>[<%=i+1%>관] <%=list.get(i).getTitle()%></option>
											<%} %>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*평점</label></th>
										<td colspan="3">
											<select name="review_score">
												<%=CodeUtil.getReviewScore(0) %>
											</select>
										</td>
										<td colspan="3">
											
											 
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">*제목</label></th>
										<td colspan="3">
											<input type="text" id="reviewtitle" name="reviewtitle" class="w50" value="<%=data.getReviewtitle()%>"/>	
										</td>
									</tr>
									<tr>
										<td colspan="4">
											<textarea id="contents" name="contents"  class="w50" value="<%=data.getContents()%>" style="width:100%;"></textarea>	
										</td>
									</tr>
								</tbody>
							</table>
							<input type="hidden" name="cmd" value="edit"/>
							<input type="hidden" name="member_pk" value="<%=member.getNo()%>"/>
							<input type="hidden" name="no" id="no" value="<%=data.getNo()%>"/>
							</form>
				
				
				
							<div class="btn">
							<div class="btnLeft">
										<a class="btns"	href="<%=param.getTargetURLParam("read", param, data.getNo())%>"><strong>목록</strong></a>
									</div>
								<div class="btnRight">
									<a class="btns" href="javascript:$('#frm').submit();"><strong>저장</strong></a>
								</div>
							</div>
					</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/view/user/include/footer.jsp" %>
</body>
</html>   