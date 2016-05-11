<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<table id="table_content" width="430">
			<c:if test="${count==0 }">
				<tr>
					<td class="tdcenter">검색된 결과가 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${count!=0 }">
				<tr>
					<th width=30%>우편변호</th>
					<th width=70%>주소</th>
				</tr>
				<c:forEach var="vo" items="${list }">
					<tr class="dataTr">
						<td width=30% class="tdcenter">${vo.zipcode }</td>
						<td width=70% class="tdleft" style="color: white;">
					            <a href="javascript:check('${vo.zipcode }','${vo.addr }')">${vo.addr }</a>
					    </td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</center>
</body>
</html>