<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="col mt-4">
	<jsp:include page="/common/inform.jsp"></jsp:include>
	<ul class="nav nav-tabs" id="myTab" role="tablist">
		<li class="nav-item" role="presentation"><a
			class="nav-link active" id="videoEdition-tab" data-toggle="tab"
			href="#videoEdition" role="tab" aria-controls="videoEdition"
			aria-selected="true">VIDEO EDITION</a></li>
		<li class="nav-item" role="presentation"><a class="nav-link"
			id="videoList-tab" data-toggle="tab" href="#videoList" role="tab"
			aria-controls="videoList" aria-selected="false">VIDEO LIST</a></li>
	</ul>
	<div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active" id="videoEdition"
			role="tabpanel" aria-labelledby="videoEdition-tab">
			<form action="" method="post" enctype="multipart/form-data">
				<div class="card col-100">
					<div class="card-body">
						<div class="row">
							<div class="col-3">
								<div class="border p-3">
									<!-- <img alt="" src="/PolyAssignment/images/desktop.jgp" class="img-fluid"> -->
									<!-- <img alt="" src="${video.poster !=null ?video.poster: 'images/desktop.jpg' }" class="img-fluid"> -->
									<img src="${video.poster !=null ?video.poster: 'images/Doraemon.png' }" alt="" 
									class="img-thumbnail">
									<!-- <img src="images/desktop.jpg" alt="" 
									class="img-fluid"> -->
									<div class="input-group mb-3 mt-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Upload</span>
										</div>
										<div class="custom-file">
											<input type="file" class="custom-file-input" id="cover" name="cover"/>
											<label for="cover">Choose File</label>
										</div>
									</div>
								</div>
							</div>
							<div class="col-9">
								<div class="form-group">
									<label for="youtubeId">Youtube ID</label> 
									<input type="text"
										class="form-control" name="videoId" id="youtubeId" value="${video.videoId }"
										aria-describedby="youtubeIdHid" placeholder="Youtube ID">
									<small id="youtubeIdHid" class="form-text text-muted">Youtube
										id is required</small>
								</div>
								<div class="form-group">
									<label for="videoTitle">Video Title</label> 
									<input type="text"
										class="form-control" name="title" id="videoTitle" value="${video.title }"
										aria-describedby="videoTitleHid" placeholder="Video Title">
									<small id="videoTitleHid" class="form-text text-muted">Video
										title is required</small>
								</div>
								<div class="form-group">
									<label for="viewCount">View Count</label> 
									<input type="text"
										name="views" id="viewCount" value="${video.views }" class="form-control"
										placeholder="View Count" aria-describedby="viewCountHid">
									<small id="viewCountHid" class="text-muted">View count
										is required</small>
								</div>
								<div class="form-check form-check-inline">
									<lable>
									<input type="radio" class="form-check-input" 
									value="true" name="active" id="status" ${video.active? 'checked':''}>Active</lable>
									<lable>
									<input type="radio" class="form-check-input" value="false"
										name="active" id="status"  ${! video.active? 'checked':''}>Inactive</lable>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<label for="description">Description</label>
								<textarea name="discription" id="description" cols="30" rows="5"
									class="form-control">${video.discription }</textarea>
							</div>
							<div class="col">
								<label for="description">Code</label>
								<input name="code" id="code" value="${video.code }"
									class="form-control"></input>
							</div>
						</div>
					</div>
					<div class="card-footer text-muted">
						<button class="btn btn-outline-primary" formaction="Admin/VideoManagermentServlet/create">Create</button>
						<button class="btn btn-outline-success" formaction="Admin/VideoManagermentServlet/update">Update</button>
						<button class="btn btn-outline-danger" formaction="Admin/VideoManagermentServlet/delete">Delete</button>
						<button class="btn btn-outline-dark" formaction="Admin/VideoManagermentServlet/reset">Reset</button>
					</div>
				</div>
			</form>
		</div>
		<div class="tab-pane fade" id="videoList" role="tabpanel"
			aria-labelledby="videoList-tab">
			<table class="table table-stripe">
				<tr style="color: blue; font-weight: bold;">
					<td>Youtube ID</td>
					<td>Video Title</td>
					<td>View Count</td>
					<td>Status</td>
					<td>&nbsp;</td>
				</tr>
				<c:forEach var="item" items="${videos }">
				<tr style="color: white;">
					<td>${item.videoId }</td>
					<td>${item.title }</td>
					<td>${item.views }</td>
					<td>${item.active? 'Active': 'Deactive' }</td>
					<td>
						<a href="Admin/VideoManagermentServlet/edit?videoId=${item.videoId }"><i class="fa fa-edit" aria-hidden="true"></i>
							Edit</a> 
						<a href="Admin/VideoManagermentServlet/delete?videoId=${item.videoId }"><i class="fa fa-trash" aria-hidden="true"></i>
							Delete</a>
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>