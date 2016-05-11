<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
     <table id="table_content" style="width:700px">
       <tr>
         <th>번호</th>
         <th>영화명</th>
         <th>극장명</th>
         <th>예약일</th>
         <th>인원</th>
         <th>가격</th>
         <th>예약현황</th>
       </tr>
       <c:forEach var="vo" items="${list }">
         <tr class="dataTr">
             <td class="tdcenter">${vo.no }</td>
	         <td class="tdcenter">${vo.title }</td>
	         <td class="tdcenter">${vo.theater }</td>
	         <td class="tdcenter">${vo.day }(${vo.time })</td>
	         <td class="tdcenter">${vo.inwon }</td>
	         <td class="tdcenter">${vo.price }</td>
	         <td class="tdcenter">
	           <c:if test="${vo.reserve_check==0 }">
	             <font color="blue">
	             	<a href="admin_ok.do?no=${vo.no }">승인대기</a>
	             </font>
	           </c:if>
	           <c:if test="${vo.reserve_check==1 }">
	             <font color="red">승인완료</font>
	           </c:if>
	         </td>
         </tr>
       </c:forEach>
     </table>
   </center>
</body>
</html>




