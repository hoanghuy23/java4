<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="aside-content-detail mt-5"
	style="margin-left: 70px;">
	<div class="detail-video">
		<form method="post" class="detail-video-card">
			<input type="hidden" name="videoId" value="${video.videoId}">
			<div class="card-header">
				<iframe width="560" height="315" src="${video.code}" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
			</div>
			<div class="card-body" >
				<div class="card-body-title">
					<a style="font-weight: bolder; color: white;">${video.title}</a>
				</div>
			</div>
			<div class="card-footer" style="text-align: right;">
				<div class="card-footer-btn">
					<c:choose>
						<c:when test="${favorite != null }">
							<button
								formaction="Admin/DetailManagementVideoServlet/delete?videoId=${video.videoId }"
								class="btn-unlike">Unlike</button>
						</c:when>
						<c:otherwise>
							<button
								formaction="Admin/DetailManagementVideoServlet/insert?videoId=${video.videoId }"
								class="btn-like">Like
							</button>
						</c:otherwise>
					</c:choose>
					<button
						formaction="Admin/DetailManagementVideoServlet/share?videoId=${video.videoId }"
						class="btn-share">Share
					</button>
				</div>
			</div>
		</form>

	</div>
</div>
<div class="col-3 mt-5">
	
		<div class="card-body-title" style="color: white;">
			<a>Views: ${video.views}</a>
		</div>
	
	<div class="row mt-3 mb-3">
		<div class="col">
			<div class="card">
				<div class="card-body-description">
					<p>${video.discription}</p>
				</div>
			</div>
		</div>
	</div>
</div>