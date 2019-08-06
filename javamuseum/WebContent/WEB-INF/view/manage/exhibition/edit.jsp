<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="manage.exhibition.*" %>
<%@ page import="util.*" %>
<%@ page import="property.*" %>
<%
ExhibitionVO param = (ExhibitionVO)request.getAttribute("param");
ExhibitionVO data = (ExhibitionVO)request.getAttribute("data");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>
<script>
	var oEditors; // 에디터 객체 담을 곳
	jQuery(window).load(function(){
		oEditors = setEditor("contents"); // 에디터 셋팅
		
		// 달력
		initCal({id:"startdate",type:"day",today:"y",timeYN:"y"});
		initCal({id:"enddate",type:"day",today:"y",timeYN:"y"});
	});
	
	function goSave() {
		
		if ($("#title").val() == "") {
			alert('제목을 입력하세요.');
			$("#title").focus();
			return false;
		}
		var sHTML = oEditors.getById["contents"].getIR();
		if (sHTML == "" || sHTML == "<p><br></p>") {
			alert('내용을 입력하세요.');
			$("#contents").focus();
			return false;
		} else {
			oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
		}
		
		return true;
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
					<h2>전시 작품 - [수정]</h2>
				</div>
				<!-- //con_tit -->
				<div class="con">
					<!-- 내용 : s -->
					<div id="bbs">
						<div id="bread">
							<form method="post" name="frm" id="frm" action="process" enctype="multipart/form-data" onsubmit="return goSave();">
							<table width="100%" border="0" cellspacing="0" cellpadding="0" summary="전시 관리 기본내용입니다.">
								<colgroup>
									<col width="15%" />
									<col width="35%" />
									<col width="15%" />
									<col width="35%" />
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="">전시관</label></th>
										<td colspan="3">
											<select name="hallnumber">
												<%=CodeUtil.getHallnum(data.getHallnumber())%>
											</select>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">작가</label></th>
										<td colspan="3">
											<input type="text" id="artist" name="artist" value="<%=data.getArtist()%>" />
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">제목</label></th>
										<td colspan="3">
											<input type="text" id="title" name="title" value="<%=data.getTitle()%>" />
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">첨부파일</label></th>
										<td colspan="3">
											<% if (data.getImagename() == null || "".equals(data.getImagename())) { %>
											<input type="file" name="imagename_tmp" id="imagename_tmp" title="첨부파일" />
											<% } else { %>
												<div class="weidtFile">
													<p>기존파일 : <a href="<%= Function.downloadUrl(SiteProperty.EXHIBITION_UPLOAD_PATH, data.getImagename()) %>" target="_blank"><%=data.getImagename()%></a><br />
														<input type="checkbox" id="imagename_chk" name="imagename_chk" value="1" title="첨부파일을 삭제하시려면 체크해주세요" />
														<label for="imagename_chk">기존파일삭제</label>
													</p>
													<input type="file" name="imagename_tmp" id="imagename_tmp" title="첨부파일을 업로드 해주세요." />
												</div>
											<% } %>											
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">프리뷰</label></th>
										<td colspan="3">
											<textarea id="preview" name="preview" style="width:100%; height:100px;"><%=data.getPreview()%></textarea>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="">시작일</label></th>
										<td>
											<input type="text" id="startdate" name="startdate" class="inputTitle" value="<%=data.getStartdate()%>" />&nbsp;
											<span id="CalstartdateIcon">
												<img src="/manage/img/calendar_icon.png" id="CalstartdateIconImg" style="cursor:pointer;"/>
											</span>
										</td>
										<th scope="row"><label for="">종료일</label></th>
										<td>
											<input type="text" id="enddate" name="enddate" class="inputTitle" value="<%=data.getEnddate()%>" />&nbsp;
											<span id="CalenddateIcon">
												<img src="/manage/img/calendar_icon.png" id="CalenddateIconImg" style="cursor:pointer;"/>
											</span>
										</td>
									</tr>
									<tr>
										<td colspan="4">
											<textarea id="contents" name="contents" title="내용을 입력해주세요" style="width:100%;"><%=Function.checkNull(data.getContents())%></textarea>	
										</td>
									</tr>
								</tbody>
							</table>
								<input type="hidden" name="stype" id="stype" value="<%=param.getStype()%>"/>
								<input type="hidden" name="sval" id="sval" value="<%=param.getSval()%>"/>
								<input type="hidden" name="cmd" id="cmd" value="edit"/>
								<input type="hidden" name="no" id="no" value="<%=data.getNo()%>"/>
							</form>
							<div class="btn">
								<div class="btnLeft">
									<a class="btns" href="<%=param.getTargetURLParam("index", param, 0)%>"><strong>목록</strong></a>
								</div>
								<div class="btnRight">
									<a class="btns" style="cursor:pointer;" onclick="$('#frm').submit();"><strong>저장</strong></a>
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