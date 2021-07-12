<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="col">
	<div class="row p-2">
		<!--1-->
		<c:forEach var="item" items="${videos }">
		<div class="col-4 mt-2">
		<input type = "hidden" name = "videoId" value = "${item.videoId}">
			<div class="card text-center">
				<div class="card-body">
					<img src="${ empty item.poster ? 'images/laptop.jpg' : item.poster }" width="90%" alt=""
						class="img-fluid"><!-- uploads/${item.poster} -->
					<div class="row border-top mt-2">
						<a href="Admin/DetailManagementVideoServlet?videoId=${item.videoId }">${item.title }</a>
					</div>
				</div>
				<div class="card-footer" style="text-align: right;">
					<c:choose>
						<c:when test="${favlist != null }">
							<c:set var="init" value="0" />								
								<c:forEach var="videoFav" items="${favlist }">
									<c:if test="${item.videoId == videoFav.videoId }">
										<c:set var="init" value="${init+1 }"/>										
									</c:if>
								</c:forEach>
								<c:choose>
									<c:when test="${init == '1' }">
										<a href="Admin/UnLikeManagementServlet?videoId=${item.videoId }" class="btn btn-success">Unlike</a> 
										<a href="Admin/ShareVideoManagementServlet?videoId=${item.videoId }" class="btn btn-info">Share</a>
									</c:when>
									<c:otherwise>
										<a href="Admin/LikeVideoManagementServlet?videoId=${item.videoId }" class="btn btn-success">Like</a> 
										<a href="Admin/ShareVideoManagementServlet?videoId=${item.videoId }" class="btn btn-info">Share</a>
									</c:otherwise>
								</c:choose>							
						</c:when>
						<c:otherwise>
							<a href="Admin/LikeVideoManagementServlet?videoId=${item.videoId }" class="btn btn-success">Like</a> 
							<a href="Admin/ShareVideoManagementServlet?videoId=${item.videoId }" class="btn btn-info">Share</a>
							
						</c:otherwise>
					</c:choose>					
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
	<div class="row pt-5">
		<div class="col">
			<nav aria-label="Page navigation">
				<ul class="pagination justify-content-center">
					<li class="page-item ${indexPage>1?'':'disabled' }"><a class="page-link" href="Admin/HomeManagementServlet?index=${indexPage-1 }"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							<span class="sr-only">Previous</span>
					</a></li>
					<c:forEach begin="1" end="${numberPage }" var="i" >
					<li class="page-item ${indexPage==i?'active':'' }"><a class="page-link" href="Admin/HomeManagementServlet?index=${i }">${i }</a></li>
					</c:forEach>
					
					
					<li class="page-item ${indexPage == numberPage?'disabled':'' }"><a class="page-link" href="Admin/HomeManagementServlet?index=${indexPage+1 }"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
							class="sr-only">Next</span>
					</a></li>
				</ul>
			</nav>
		</div>
	</div>
</div>
