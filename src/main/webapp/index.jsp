<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	response.sendRedirect("main.do");
%>	

<%--
	$.ajax({
		method:POST,
		content:URL,
		data:PARAM,
		dataType:JSON,
		function(response)
		{
			$('#mi').html(httpRequest.responseText);
		}
	});
	
--%>