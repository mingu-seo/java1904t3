<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="manage.review.*" %>
<%@ page import="property.SiteProperty" %>
<%@ page import="util.*" %>
<%@ page import="java.util.*" %>
<%
	ReviewVO param = (ReviewVO) request.getAttribute("vo");
	ReviewVO data = (ReviewVO) request.getAttribute("data");
	ArrayList<ReviewVO> list = (ArrayList)request.getAttribute("list");
	int totCount = (Integer)request.getAttribute("totCount");
	int totPage = (Integer)request.getAttribute("totPage");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp"%>
<script type="text/javascript">
function goDelete() {
	var del = confirm ('삭제하시겠습니까?');
	if (del){
		document.location.href = "process?no=<%=data.getNo()%>&cmd=delete";
	} else {
		return false;
	}
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
						<h2>리뷰관리 - [상세]</h2>
					</div>
					<!-- //con_tit -->

					<div class="con">
						<!-- 내용 : s -->
						<div id="bbs">
							<div id="bread">
								<h3>기본 정보</h3>
								<table width="100%" border="0" cellspacing="0" cellpadding="0"
									summary="리뷰 관리 기본내용입니다.">
									<colgroup>
										<col width="10%" />
										<col width="40%" />
										<col width="10%" />
										<col width="40%" />
									</colgroup>
									<tbody>
										<tr>
											<th scope="row"><label for="">제목</label></th>
											<td><%=data.getReviewtitle()%></td>
											<th scope="row"><label for="">조회수</label></th>
											<td><%=data.getReadno()%></td>
										</tr>
										<tr>
											<th scope="row"><label for="">전시이름</label></th>
											<td colspan="3"><%=data.getTitle()%></td>
										</tr>						
										<tr>
											<th scope="row"><label for="">포토 후기</label></th>
											<td colspan="3"><% if (data.getImagename() == null){ %>
											<img src="/upload/review/noimage.png" width="20%" height="auto" />
											<%} else{ %>
											<img src="/upload/review/<%=data.getImagename()%>" width="20%" height="auto" /></td>
											<%} %>
										</tr>
										<tr>
											<th scope="row"><label for="">내용</label></th>
											<td colspan="3"><%=data.getContents()%></td>
										</tr>
										<tr>
											<th scope="row"><label for="">이름</label></th>
											<td colspan="3"><%=data.getName()%></td>
										</tr>
										<tr>
											<th scope="row"><label for="">평점</label></th>
											<td colspan="3"><%=data.getReview_score()%></td>
										</tr>
										<tr>
											<th scope="row"><label for="">등록일</label></th>
											<td colspan="3"><%=data.getRegistdate()%></td>
										</tr>
									</tbody>
								</table>
								<input type="hidden" name="stype" id="stype"
									value="<%=param.getStype()%>" /> <input type="hidden"
									name="sval" id="sval" value="<%=param.getSval()%>" />

								<div class="btn">
									<div class="btnLeft">
										<a class="btns"
											href="<%=param.getTargetURLParam("index", param, 0)%>"><strong>목록</strong></a>
									</div>
									<div class="btnRight">
										<a class="btns" href="#" onClick="goDelete();"><strong>삭제</strong></a>
									</div>
								</div>
								<!--//btn-->
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