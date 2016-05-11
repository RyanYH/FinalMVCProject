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
	$('.theater_name').click(function(){
		var tname=$(this).text();
		$('#movie_theater').text("�����:"+tname);
		$('#res_theater').val(tname);
		sendMessage("POST", "reserve_date.do", null, dateInfo)
	});
});
function dateInfo()
{
	if(httpRequest.readyState==4)
	{
		if(httpRequest.status==200)
		{
			$('#ri').html(httpRequest.responseText);
		}
	}
}
</script>
</head>
<body>
  <center>
    <table id="table_content" style="width:180px">
      <tr>
        <th>���� ����</th>
      </tr>
      <c:forEach var="vo" items="${list }">
        <tr class="dataTr">
         <td class="theater_name" id="${vo.tno }">(${vo.loc})${vo.theater }</td>
        </tr>
      </c:forEach>
    </table>
  </center>
</body>
</html>