<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/WEB-INF/view/manage/include/headHtml.jsp" %>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/fontawesome-stars.css"> 
<script type="text/javascript" src="/js/jquery.barrating.js"></script>

<script>
</script>
</head>
<body> 
<select id="example">
	<option value="1">1</option> 
	<option value="2">2</option> 
	<option value="3">3</option> 
	<option value="4">4</option> 
	<option value="5">5</option> 
</select> 

<script type="text/javascript"> 
	$(function() { $('#example').barrating({ theme: 'fontawesome-stars' }); }); 
</script>

</body>
</html>