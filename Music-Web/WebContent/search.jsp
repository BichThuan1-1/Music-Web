<%@page import="music.Constant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String contextPath = request.getContextPath();
request.setAttribute("login_success", Constant.LOGIN_SUCCESS);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title><c:out value="${requestScope.singerInfo.singer.singerName }"></c:out></title>
		<link rel="stylesheet" type="text/css" href="<%=contextPath %>/css/font-awesome.min.css"/>
		<link rel="stylesheet" type="text/css" href="<%=contextPath %>/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="<%=contextPath %>/css/common.css"/>
		<link rel="stylesheet" type="text/css" href="<%=contextPath %>/css/search.css"/>
	</head>
	<body>
		<c:if test="${requestScope.flag==true }">
			<script type="text/javascript">
				alert('${requestScope.message}');
			</script>
		</c:if>
		<header class="theme-bg-color">
			<nav class="navbar navbar-default">
				<div class="container theme-bg-color">
					<!-- responsive cho mobile -->
					<!-- kiểu responsive mobile -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<a href="#" class="navbar-brand"><img src="img/logo_2.png" alt="music"/></a>
					</div><!-- /.navbar-header -->
					<!-- kiểu web -->
					<div class="collapse navbar-collapse" id="navbar-collapse">
						<ul class="nav navbar-nav">
							<li><a href="index.jsp"><span class="fa fa-home"></span>&nbsp;Trang Chủ</a></li>
							<li><a href="<%=contextPath %>/SingerServlet?info=list"><span class="fa fa-microphone"></span>&nbsp;Ca sĩ</a></li>
							<li><a href="<%=contextPath %>/AlbumServlet?info=list"><span class="fa fa-th-list"></span>&nbsp;Album</a></li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<c:if test="${sessionScope.user==null || sessionScope.user=='' }">
								<li><a href="login.jsp">Đăng Nhập</a></li>
							</c:if>
							<c:if test="${sessionScope.user!=null && sessionScope.user!='' }">
	 							<li><a href="#"><span class="fa fa-user"></span>&nbsp;<c:out value="${sessionScope.user.userNickname }"></c:out> </a></li>
	 							<li><a href="<%=contextPath %>/NormalUserServlet?info=logout">Đăng Xuất</a></li>
							</c:if>
						</ul>
					</div><!-- /.navbar-collapse -->
				</div><!-- /.container -->
			</nav>
			<div class="container text-center">
				<h1>Nền Nghe nhạc số</h1>
				<div class="row">
					<div class="col-sm-offset-3 col-sm-6 col-md-offset-3 col-md-6">
						<form action="<%=contextPath %>/SongServlet?info=search" method="post">
							<div class="form-group input-group">
								<input type="search" class="form-control" placeholder="Bạn muốn tìm bài hát ..." name="songTitle"/>
								<span class="input-group-btn">
									<button class="btn btn-default" type="submit"><span class="fa fa-search"></span></button>
								</span>
							</div>
						</form>	
					</div>
				</div>
			</div>
		</header>
		<section class="main">
			<div class="container">
				<h2 class="theme-color">Kết quả tìm kiếm</h2>
				<table class="table table-striped">
					<tr>
						<th class="list-icon"></th>
						<th class="list-title">Tên Bài Hát</th>
						<th class="list-singer">Ca sĩ</th>
					</tr>
					<c:forEach items="${requestScope.songList }" var="song" varStatus="status">
						<tr>
							<td><a href="<%=contextPath %>/SongServlet?info=play&playId=${song.songId}"><span class="fa fa-play-circle-o"></span></a></td>
							<td><a href="<%=contextPath %>/SongServlet?info=play&playId=${song.songId}"><c:out value="${song.songTitle }"></c:out> </a></td>
							<td><a href="<%=contextPath %>/SingerServlet?info=play&playId=${song.singer.singerId}"><c:out value="${song.singer.singerName }"></c:out> </a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</section>
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
	<script src="<%=contextPath %>/js/jquery-3.1.1.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="<%=contextPath %>/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
</html>