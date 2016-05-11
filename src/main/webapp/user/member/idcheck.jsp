<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="table.css">
<script type="text/javascript" src="ajax.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){ // window.onload , $(document).ready(function(){})
	$('#checkBtn').click(function(){
		var id=$('#id').val();
		/*
		     val() ==> input,select,textarea getter
		     val("value") setter
		     attr("속성명") ==> getter
		     attr("속성명",값) ==> setter
		     text("")
		     html("") ==> 태그를 제어하는 프로그램 (DOM)
		*/
		if(id.trim()=="")
		{
			$('#id').focus();
			return;
		}
		var param="id="+id;
		sendMessage("POST", "../../idcheck_ok.do", param, idcheck);
		alert("1");
	});
});
function idcheck()
{
	
	if(httpRequest.readyState==4)
	{
		if(httpRequest.status==200)
		{
			var res=httpRequest.responseText;
			alert(res);
			if(res.trim()=="0")
			{
				$('#result').text("");
				var r=$('#id').val()+"는(은) 사용 가능한 ID입니다<br>"
				     +"<center>"
			         +"<input type=button onclick=ok('"+$('#id').val()+"') value=확인>"
			         +"</center>";
				$('#result').append(r);
			}
			else
			{
				$('#result').text("");
				var r=$('#id').val()+"는(은) 이미 사용중인 ID입니다<br> 다른 ID를 입력하세요";
				$('#result').append(r);
			}
			
		}
	}
}
function ok(id)
{
	parent.frm.id.value=id;
	parent.Shadowbox.close();
}
</script>
</head>
<body>
   <center>
     <table id="table_content" style="margin-top: 20px" width=250>
       <tr>
        <td>
          ID:<input type=text name=id size=12 id="id">
          <input type=button value="아이디체크" id="checkBtn">
        </td>
       </tr>
       <tr>
         <td id="result">v</td>
       </tr>
     </table>
   </center>
 </body>
</html>







