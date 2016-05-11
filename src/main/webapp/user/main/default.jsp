<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="prew_img">

		<ul class="round">
			<c:forEach var="vo" items="${list }">
				<li><img src="${vo.image }" alt="" /></li>
			</c:forEach>
		</ul>
		<script type="text/javascript" src="user/lib/jquery.js"></script>
		<script type="text/javascript" src="user/lib/jquery.roundabout.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$('.round').roundabout();
			});
		</script>

	</div>
	<div id="content_top"></div>

	<div id="content_bg_repeat">
		<div class="inside">
			<div class="row-1 outdent">
				<div class="wrapper">
					<div class="metam1">
						<!-- .box1 -->
						<div class="box1">
							<h2>영화 랭킹</h2>
							<c:forEach var="vo" items="${rankList }">
								<h4>${vo }</h4>
							</c:forEach>
						</div>
						<!-- /.box1 -->
					</div>
					<div class="metam2">
						<!-- .box1 -->
						<div class="box1">
							<h2>실시간 영화 예매 순위</h2>
							<c:forEach var="vo" items="${reserveList }">
								<h4>${vo }</h4>
							</c:forEach>
						</div>
						<!-- /.box1 -->
					</div>
					<div class="metam3">
						<!-- .box1 -->
						<div class="box1">
							<h2>실시간 영화 박스오피스</h2>
							<c:forEach var="vo" items="${boxList }">
								<h4>${vo }</h4>
							</c:forEach>
						</div>
						<!-- /.box1 -->
					</div>
				</div>
			</div>
			</div>
			</div>
</body>
</html>