<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="reserve.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
</head>
<body>
	<center>
		<table id="table_content" width="700">
			<tr>
				<td>
					추천 검색 : <select id="re_data" name="re_data">
							 <c:forEach var="feel" items="${list }">
							 <option>${feel }</option>
							 </c:forEach>				
					</select>
				</td>
				<td></td>
			</tr>
		</table>
	</center>
</body>
</html>