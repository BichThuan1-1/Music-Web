<%@page import="music.Constant"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<link rel="stylesheet" type="text/css" href="<%=contextPath %>/css/singer.css"/>
	</head>
	<body>
		<c:if test="${requestScope.flag==true }">
			<script type="text/javascript">
				alert('${requestScope.message}');
			</script>
		</c:if>
		<jsp:include page="header.jsp"></jsp:include>
		<section class="main">
			<div class="container">
				<div class="row">
					<div class="col-md-offset-2 col-md-8">
						<!-- Mô tả ca sĩ -->
						<section class="description">
							<div class="media">
								<div class="media-left media-middle">
									<img class="media-object img-circle" src="<%=Constant.SINGER_PATH%>${requestScope.singerInfo.singer.singerThumbnail}" style="width:150px" />
								</div>
								<div class="media-body">
									<h1 class="theme-color"><span class="fa fa-music"></span>&nbsp;<c:out value="${requestScope.singerInfo.singer.singerName }"></c:out> </h1>
									<div class="singer-info">Giới tính：
										<span class="sex">
											<c:if test="${requestScope.singerInfo.singer.singerSex==1 }">
												<span class="fa fa-mars"></span>&nbsp;Nam										
											</c:if>
											<c:if test="${requestScope.singerInfo.singer.singerSex==2 }">
												<span class="fa fa-venus"></span>&nbsp;Nữ										
											</c:if>
											<c:if test="${requestScope.singerInfo.singer.singerSex==0 }">
												Khác										
											</c:if>
										</span>
									</div>
								</div>
							</div>
						</section>
						<!-- mô tả ca sĩ kết thúc -->
						<!-- thanh công cụ -->
						<section class="toolbar">
							<div class="btn-group" role="group">
								<c:if test="${sessionScope.login_flag==login_success}">
									<a href="SingerServlet?info=follow&singerId=${requestScope.singerInfo.singer.singerId }&userId=${sessionScope.user.userId }" type="button" class="btn btn-default"><span class="fa fa-heart-o"></span>&nbsp;Thích</a>
								</c:if>
							</div>
						</section>
						<!-- thanh công cụ kết thúc -->
						<!-- giới thiệu ca sĩ -->
						<section class="singer-desc">
							<h3><strong>Giới Thiệu Ca Sĩ：</strong></h3>
							<p><c:out value="${requestScope.singerInfo.singer.singerIntroduction }"></c:out> </p>
						</section>
						<!-- Giới thiệu ca sĩ kết thúc-->
						<!-- bài hát thịnh hành （sắp xếp theo số lượt nghe） -->
						<section class="hot">
							<h2 class="theme-color">Bài Hát Thịnh hành</h2>
							<table class="table table-striped">
								<tr>
									<th class="hot-num"></th>
									<th class="hot-icon"></th>
									<th class="hot-title">Tên bài hát</th>
									<th class="hot-singer">Ca sĩ</th>
								</tr>
								<c:forEach items="${requestScope.singerInfo.songs }" var="song" varStatus="status">
									<tr>
										<td><c:out value="${status.count }"></c:out></td>
										<td><a href="<%=contextPath %>/SongServlet?info=play&playId=${song.songId}"><span class="fa fa-play-circle-o"></span></a></td>
										<td><a href="<%=contextPath %>/SongServlet?info=play&playId=${song.songId}"><c:out value="${song.songTitle }"></c:out></a></td>
										<td><a href="#"><c:out value="${requestScope.singerInfo.singer.singerName }"></c:out></a></td>
									</tr>
								</c:forEach>
							</table>
						</section>
						<!-- bài hát thịnh hành kết thúc -->
						<!-- tất cả album -->
						<section class="albumlist">
							<h2 class="theme-color">Tất cả các Album</h2>
							<div class="row">
								<c:forEach items="${requestScope.singerInfo.albums }" var="album" varStatus="status">
									<div class="col-sm-6 col-md-4 col-lg-3">
										<a href="<%=contextPath %>/AlbumServlet?info=play&playId=${album.albumId}" class="thumbnail">
											<img src="<%=Constant.ALBUM_PATH %>/${album.albumPic}"/>
											<div class="caption text-center">
												<h4><c:out value="${album.albumTitle }"></c:out> </h4>
												<h5><c:out value="${album.albumPubDate }"></c:out> </h5>
											</div>
										</a>
									</div>
								</c:forEach>
							</div>
						</section>
						<!-- Tất cả các album kết thúc -->
					</div>
				</div>
			</div>
		</section><!-- /.main -->
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
	<script src="<%=contextPath %>/js/jquery-3.1.1.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="<%=contextPath %>/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
</html>