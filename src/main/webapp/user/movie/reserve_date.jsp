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
<%--
      <a href="">  => $('a').attr("href")
      <td>aaa</td> => $('td').text()  text("aaa")
                              getter   setter
      <td><b>aaa</b></td> $('td').text()  aaa
                          $('td').html()  <b>aaa</b>
      val() val("aaa") ==> <input> <select> <textarea>
 --%>
<script type="text/javascript">
$(function(){
	$('.reserve_date').click(function(){
		var year=$(this).attr("year");
		var month=$(this).attr("month");
		var day=$(this).text();
		$('#movie_date').text("예약일:"+year+"-"+month+"-"+day);
		$('#res_day').val(year+"-"+month+"-"+day);
		var param="day="+day;
		sendMessage("POST", "reserve_time.do", param, timeInfo);
	});
});
function timeInfo()
{
	if(httpRequest.readyState==4)
	{
		if(httpRequest.status==200)
		{
			$('#timei').html(httpRequest.responseText);
		}
	}
}
</script>
</head>
<body>
  <center>
    <table id="table_content" style="width:270px">
      <tr>
        <th>예매일</th>
      </tr>
    </table>
    <table id="table_content" style="width:270px">
      <tr>
        <td colspan="7">
          <select name="year">
            <c:forEach var="i" begin="2016" end="2020">
              <option ${i==year?"selected":"" }>${i  }</option>
            </c:forEach>
          </select>년도&nbsp;
          <select name="month">
            <c:forEach var="i" begin="1" end="12">
              <option ${i==month?"selected":"" }>${i  }</option>
            </c:forEach>월
          </select>
        </td>
      </tr>
      <tr>
        <td class="tdcenter" colspan="7">${year }년도 ${month }월</td>
      </tr>
      <tr>
        <c:forEach var="weekday" items="${weekList }">
          <th>${weekday }</th>
        </c:forEach>
      </tr>
      <c:forEach var="i" begin="1" end="${lastDay }">
         <c:if test="${i==1 }">
           <tr>
           <c:forEach var="j" begin="1" end="${week }">
             <td class="tdcenter">&nbsp;</td>
           </c:forEach>
         </c:if>
         
         <c:if test="${i>=day }">
          <td class="tdcenter" bgcolor="#ccccff">
           <a href="#" year="${year }" month="${month }" class="reserve_date">${i }</a>
          </td>
         </c:if>
         <c:if test="${i<day }">
          <td class="tdcenter">${i }</td>
         </c:if>
         <c:set var="week" value="${week+1 }"/>
         <c:if test="${week>6 }">
           <c:set var="week" value="0"/>
           </tr>
           <tr>
         </c:if>
      </c:forEach>
    </table>
  </center>
</body>
</html>







