<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="manage.program.*" %>
<%@ page import="util.*" %>
<%
ArrayList<ProgramVO> olist = (ArrayList<ProgramVO>) request.getAttribute("olist");

%>

<select name="time" id="program_time" onchange="getProgram_membCount()">
<option value="">선택</option>
									
<% for(int i=0;i<olist.size(); i++){ %>
	<option value="<%=olist.get(i).getTime()%>"><%=CodeUtil.getP_timeName(Integer.parseInt(String.valueOf(olist.get(i).getTime()))) %></option>
<% } %>
</select>