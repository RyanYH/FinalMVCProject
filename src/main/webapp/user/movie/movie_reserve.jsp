<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="reserve.css">
<script type="text/javascript" src="ajax.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	sendMessage("POST", "movie_info.do", null, movieInfoData);
	$('#reserveBtn').click(function(){
		var s=$('#reserveBtn').attr("src");
		if(s=="user/movie/re_d.png")
		{
			return;
		}
		else
		{
			$('#res_frm').submit();
		}
	});
});
function movieInfoData()
{
	if(httpRequest.readyState==4)
	{
		if(httpRequest.status==200)
		{
			$('#mi').html(httpRequest.responseText);
		}
	}
}
</script>
</head>
<body>
  <center>
    <h3>영화 예매</h3>
    <table id="table_content" style="width:900px;height:500px">
      <tr>
        <td width=15% class="tdcenter" height=350 id="mi" valign="top"></td>
        <td width=20% class="tdcenter" height=350 id="ti" valign="top"></td>
        <td width=30% class="tdcenter" height=350 id="ri" valign="top"></td>
        <td width=35% rowspan="2" valign="top">
          <center></center>
          <table id="table_content" style="width:315px">
           <tr>
             <th>예약 정보</th>
           </tr>
           <tr>
             <td class="tdcenter"><img width=180 height=200 id="poster"></td>
           </tr>
           <tr height=30>
             <td class="tdcenter" id="movie_title"></td>
           </tr>
           <tr height=30>
             <td class="tdleft" id="movie_theater">극장명:</td>
           </tr>
           <tr height=30>
             <td class="tdleft" id="movie_date">예약일:</td>
           </tr>
           <tr height=30>
             <td class="tdleft" id="movie_time">예약시간:</td>
           </tr>
           <tr height=30>
             <td class="tdleft" id="movie_inwon">예약인원:</td>
           </tr>
           <tr height=30>
             <td class="tdleft" id="movie_price">금액:</td>
           </tr>
           <tr height=30>
             <td class="tdcenter" id="reserve_btn">
              <form method="post" action="reserve_ok.do" id="res_frm">
                <input type=hidden name="title" id="res_title">
                <input type=hidden name="theater" id="res_theater">
                <input type=hidden name="day" id="res_day">
                <input type=hidden name="time" id="res_time">
                <input type=hidden name="inwon" id="res_inwon">
                <input type=hidden name="price" id="res_price">
              </form>
              <img src="user/movie/re_d.png" id="reserveBtn">
             </td>
           </tr>
          </table>
        </td>
      </tr>
      <tr>
        <td colspan="2" height=150 id="timei" valign="top"></td>
        <td width=20% height=150 id="inwon" valign="top"></td>
      </tr>
    </table>
  </center>
</body>
</html>






