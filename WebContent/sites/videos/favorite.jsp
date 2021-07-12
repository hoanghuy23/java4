<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="col">
	<form action="MyFavoriteServlet" method="post">
	<div class="row p-2">
		<c:forEach var="item" items="${listVideo }">
		<input type="hidden" name="videoId" value="${item.videoId}">
		<div class="col-3 mt-2">
			<div class="card">
				<div class="card-body">
					<img src="${ empty item.poster ? 'images/laptop.jpg' : item.poster }" width="90%" alt=""
						class="img-fluid">
					<div class="row mt-2">
						<!-- <b>${item.title }</b> -->
						<a href="DetailVideoServlet?videoId=${item.videoId }">${item.title }</a>
					</div>
				</div>
				<div class="card-footer text-muted" style="text-align: right;">
					<button	formaction="MyFavoriteServlet/unlike?videoId=${item.videoId }"
								class="btn btn-dark">Unlike
					</button>
					<button
						formaction="MyFavoriteServlet/share?videoId=${item.videoId }"
							class="btn btn-success">Share
					</button>
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
	</form>
</div>