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
	$('.reserve_time').click(function(){
		var inwon=$(this).text();
		$('#movie_time').text("예약시간:"+inwon);
		$('#res_time').val(inwon);
		sendMessage("POST", "reserve_inwon.do", null, inwonInfo);
	});
});
function inwonInfo()
{
	if(httpRequest.readyState==4)
	{
		if(httpRequest.status==200)
		{
			$('#inwon').html(httpRequest.responseText);
		}
	}
}
</script>
</head>
<body>
  <center>
    <table id="table_content" style="width:405px">
      <tr>
       <th colspan="${count }">시간정보</th>
      </tr>
      <tr>
        <c:forEach var="vo" items="${list }">
           <td class="reserve_time" id="dataTd">${vo.time }</td>
        </c:forEach>
      </tr>
    </table>
  </center>
</body>
</html>




