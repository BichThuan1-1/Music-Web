<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%String contextPath = request.getContextPath();%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>Bài hát đề xuất</title>
		<link rel="stylesheet" type="text/css" href="<%=contextPath %>/css/font-awesome.min.css"/>
		<link rel="stylesheet" type="text/css" href="<%=contextPath %>/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="<%=contextPath %>/css/common.css"/>
		<style type="text/css">
			.table>thead>tr>th, .table>tbody>tr>th, .table>tfoot>tr>th, .table>thead>tr>td, .table>tbody>tr>td, .table>tfoot>tr>td {
			    border-top: none;
			}
			h2 {
				margin-bottom: 25px;
			}
			h3 {
				margin-bottom: 25px;
			}
			
		</style>
	</head>
	<body>
		<c:if test="${requestScope.flag==true }">
			<script type="text/javascript">
				alert('${requestScope.message}');
			</script>
		</c:if>
		<div class="container">
			<div class="form">
				<h2 class="theme-color">Bài hát dành cho bạn</h2>
				<div class="row">
					<div class="col-md-8">
						<h3>Gợi ý cho bạn</h3>
						<form action="<%=contextPath %>/RecommendServlet?info=find" method="post"><button type="submit" class="btn btn-default pull-right"><span class="fa fa-refresh"></span>&nbsp;Làm mới</button></form>
						
						<table class="table table-striped">
							<tr>
								<th>recmdID</th>
								<th>ID bài hát</th>
								<th>Tên bài hát</th>
							</tr>
							<c:forEach items="${recommends }" var="recommend">
								<tr>
									<td><c:out value="${recommend.recmdId }"></c:out> </td>
									<td><c:out value="${recommend.songId }"></c:out> </td>
									<td><c:out value="${recommend.song.songTitle }"></c:out> </td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="col-md-4">
						<h3>Thêm bài hát</h3>
						<form action="<%=contextPath %>/RecommendServlet?info=add" method="post" class="form-horizontal">
							<table class="table">
								<tr>
									<td><label class="control-label">ID bài hát</label></td>
									<td><input type="text" class="form-control" name="songId" required /></td>
								</tr>
								<tr>
									<td colspan="2"><button type="submit" class="btn btn-primary">Thêm</button></td>
								</tr>
							</table>
						</form>
						<h3>Gỡ bỏ bài hát</h3>
						<form action="<%=contextPath %>/RecommendServlet?info=remove" method="post" class="form-horizontal">
							<table class="table">
								<tr>
									<td><label class="control-label">recmdID</label></td>
									<td><input type="text" class="form-control" name="recmdId" required /></td>
								</tr>
								<tr>
									<td colspan="2"><button type="submit" class="btn btn-primary">Gỡ bỏ</button></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
	<script src="<%=contextPath %>/js/jquery-3.1.1.min.js" type="text/javascript" charset="utf-8"></script>
	<script src="<%=contextPath %>/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
</html>