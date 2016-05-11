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
<script type="text/javascript">
$(function(){
	$('#inwon_select').change(function(){
		var inwon=$('#inwon_select').val();
		//alert(inwon+"명");
		$('#movie_inwon').text("예약인원:"+inwon+"명");
		$('#movie_price').text("금액:"+(inwon*9000)+"원");
		$('#res_inwon').val(inwon);
		$('#res_price').val(inwon*9000);
		$('#reserveBtn').css("cursor","pointer");
		$('#reserveBtn').attr("src","user/movie/re_e.png");
	});
});

</script>
</head>
<body>
  <center>
    <table id="table_content" style="width:180px">
     <tr>
       <th>인원</th>
     </tr>
     <tr>
       <td>
                   인원<select id="inwon_select">
             <c:forEach var="i" begin="1" end="5">
               <option>${i }</option>
             </c:forEach>
          </select>
       </td>
     </tr>
    </table>
  </center>
</body>
</html>




