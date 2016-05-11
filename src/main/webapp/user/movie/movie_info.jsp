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
	$('.movie_name').click(function(){
		var p=$(this).attr("img");
		//alert(p);
		$('#poster').attr("src",p);
		// 제목
		var title=$(this).text();
		$('#movie_title').text(title);
		$('#res_title').val(title);
		var param="mno="+$(this).attr("id");
		sendMessage("POST", "theater_info.do", param, theaterInfo)
	});
});
function theaterInfo()
{
	if(httpRequest.readyState==4)
	{
		if(httpRequest.status==200)
		{
			$('#ti').html(httpRequest.responseText);
		}
	}
}
</script>
</head>
<body>
  <center>
    <table id="table_content" style="width:135px">
      <tr>
        <th>영화 정보</th>
      </tr>
      <c:forEach var="vo" items="${list }">
        <tr class="dataTr">
         <td class="movie_name" img="${vo.poster }" id="${vo.mno }">${vo.title }</td>
        </tr>
      </c:forEach>
    </table>
  </center>
</body>
</html>




