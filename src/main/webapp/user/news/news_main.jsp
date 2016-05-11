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
     <h3>Naver News Search</h3>
     <table id="table_content">
      <tr>
       <td class="tdcenter">
        검색:<input type=text name=ss size=15>
       <input type=button value="검색">
       </td>
      </tr>
      <c:forEach var="vo" items="${list }">
       <tr>
        <td>
        <b>${vo.title }</b>
        </td>
       </tr>
       <tr>
        <td>
        ${vo.description }
        </td>
       </tr>
      </c:forEach>
     </table>
   </center>
</body>
</html>





