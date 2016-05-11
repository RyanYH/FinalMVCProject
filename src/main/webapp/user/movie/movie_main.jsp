<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="table.css">
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['영화명', '선호도'],
          <c:forEach var="vo" items="${list}">
          ['<c:out value="${vo.title}"/>', <c:out value="${vo.like}"/>],
          </c:forEach>
          
        ]);

        var options = {
          title: '영화선호현황',
          width:450,
          height:450
        };

        var chart1 = new google.visualization.ColumnChart(document.getElementById("columnchart"));
        chart1.draw(data, options);

      }
      $(function () {
    	    $('#container').highcharts({
    	        chart: {
    	            plotBackgroundColor: null,
    	            plotBorderWidth: null,
    	            plotShadow: false,
    	            type: 'pie'
    	        },
    	        title: {
    	            text: '영화예매율 현황'
    	        },
    	        tooltip: {
    	            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    	        },
    	        plotOptions: {
    	            pie: {
    	                allowPointSelect: true,
    	                cursor: 'pointer',
    	                dataLabels: {
    	                    enabled: true,
    	                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
    	                    style: {
    	                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
    	                    }
    	                }
    	            }
    	        },
    	        series: [{
    	            name: '예매율',
    	            colorByPoint: true,
    	            data: [
    	            <c:forEach var="vo" items="${list}">
    	            {
    	                name: '<c:out value="${vo.title}"/>',
    	                y: <c:out value="${vo.like}"/>
    	            },
    	            </c:forEach>
    	            ]
    	        }]
    	    });
    	});
    </script>

</head>
<body>
  <center>
    <table id="table_content">
     <tr>
      <c:forEach var="vo" items="${list }">
       <td class="tdcenter">
       <a href="movie_detail.do?no=${vo.no }">
        <img src="${vo.image }" width=120 height=150></a>
       </td>
      </c:forEach>
     </tr>
     <tr>
      <c:forEach var="vo" items="${list }">
       <td class="tdcenter">
        <b>${vo.title }</b>
       </td>
      </c:forEach>
     </tr>
     <tr>
      <c:forEach var="vo" items="${list }">
       <td class="tdcenter">
        ${vo.regdate }
       </td>
      </c:forEach>
     </tr>
     <tr>
      <c:forEach var="vo" items="${list }">
       <td class="tdcenter">
                   찜:${ vo.like}
       </td>
      </c:forEach>
     </tr>
    </table>
    <table id="table_content">
     <tr>
        <td>
         <div id="container" style="min-width:450px;height:450px;max-width:600px;margin: auto">
        </td>
       <td><div id="columnchart" style="width: 450px; height: 450px;"></div></td>
     </tr>
    </table> 
  </center>
</body>
</html>



