<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="table.css">
</head>
<body>
	<center>
		<h3>${vo.title }상세보기</h3>
		<c:if test="${sessionScope.id!=null and sessionScope.id != 'hong' }">
			<table id="table_content">
				<tr>
					<td align="right"><a href="movie_reserve.do"> <img
							src="user/movie/btn_buy3.gif" border="0" alt=""></a></td>
				</tr>
			</table>
		</c:if>
		<table id="table_content">
			<tr>
				<td width="30%" class="tdcenter" rowspan="5"><img
					src="${vo.image }" alt=""></td>
				<th colspan="2">${vo.title }</th>
				<td></td>
			</tr>
			<tr>
				<td width="20%" class="tdcenter">개봉일</td>
				<td width="50%">${vo.regdate }</td>
			</tr>
			<tr>
				<td width="20%" class="tdcenter">별점</td>
				<td width="50%">${vo.like }</td>
				<th></th>
			</tr>
			<tr>
				<td width="20%" class="tdcenter">찜</td>
				<td width="50%">${vo.like }</td>
				<th></th>
			</tr>
			<tr>
				<td width="20%" class="tdcenter">예매율</td>
				<td width="50%">${vo.reserve }</td>
				<th></th>
			</tr>
		</table>
		<table id="table_content">
			<tr>

				<td width="50%">
					<div
						style="overflow: scroll; width: 450px; height: 450px; padding: 10px;">
						<table border="0" width="450" height="450">
							<c:forEach var="rv" items="${list }">
								<tr>
									<td>${rv }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</td>

				<td width="50%"><img src="user/movie/reviews.png" alt=""></td>
			</tr>
		</table>
	</center>
</body>
</html>






