<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="manage.program.*" %>
<%@ page import="util.*" %>
<%
ArrayList<ProgramVO> olist = (ArrayList<ProgramVO>) request.getAttribute("olist");
ArrayList<HashMap> list = (ArrayList<HashMap>) request.getAttribute("list");
Integer max_mem = (Integer)request.getAttribute("max_mem");
%>

<select name="time" id="program_time" onchange="getProgram_membCount()">
<option value="">선택</option>
	<%
	for(int i=0;i<olist.size(); i++){
			if(Integer.parseInt(String.valueOf(list.get(i).get("member_cnt"))) >= max_mem) {
	%>
	<option value="<%=olist.get(i).getTime()%>" disabled><%=CodeUtil.getP_timeName(Integer.parseInt(String.valueOf(olist.get(i).getTime()))) %> (인원마감)</option>
	<% } else { %>
	<option value="<%=olist.get(i).getTime()%>"><%=CodeUtil.getP_timeName(Integer.parseInt(String.valueOf(olist.get(i).getTime()))) %></option>
	<% } } %>
</select>