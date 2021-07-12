<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="col mt-4">
	<ul class="nav nav-tabs" id="myTab" role="tablist">
		<li class="nav-item" role="presentation"><a
			class="nav-link active" id="videoEdition-tab" data-toggle="tab"
			href="#videoEdition" role="tab" aria-controls="videoEdition"
			aria-selected="true">Favorites</a></li>
		<li class="nav-item" role="presentation"><a class="nav-link"
			id="videoList-tab" data-toggle="tab" href="#videoList" role="tab"
			aria-controls="videoList" aria-selected="false">Favorite User</a></li>
		<li class="nav-item" role="presentation"><a class="nav-link"
			id="shareFriends-tab" data-toggle="tab" href="#shareFriends"
			role="tab" aria-controls="shareFriends" aria-selected="false">Share
				Friends</a></li>
	</ul>
	<div class="tab-content" id="myTabContent" >
		<div class="tab-pane fade show active" id="videoEdition"
			role="tabpanel" aria-labelledby="videoEdition-tab">
			<table class="table table-bordered mt-3" >
				<tr style="color: blue; font-weight: bold;">
					<td>Video Title</td>
					<td>Favorites Count</td>
					<td>Lasted Date</td>
					<td>Oldest Date</td>
				</tr>
				<c:forEach var="item" items="${favList }">
				<tr style="color: white;">
					<td>${item.videoTitle }</td>
					<td>${item.favoriteCount }</td>
					<td>${item.newesDate }</td>
					<td>${item.oldestDate }</td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<div class="tab-pane fade" id="videoList" role="tabpanel"
			aria-labelledby="videoList-tab">
			<form action="" method="get">
				<div class="row mt-3">
					<div class="col">
						<div class="form-inline">
							<div class="form-group" style="color: yellow; font-weight: bold;">
								<lable>Video Title ? 
									<select name="videoUserId" id="videoUserId"
										class="form-control ml-3">
										<c:forEach var="item" items="${vidList }">
											<option value="${item.videoId }" 
												${item.videoId == videoUserId?'selected':'' }>${item.title }</option>
										</c:forEach>
									</select> 
								</lable>
								<button class="btn btn-info ml-2">Report</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col mt-3">
						<table class="table table-bordered">
							<tr style="color: blue; font-weight: bold;">
								<td>UserName</td>
								<td>Fullname</td>
								<td>Email</td>
								<td>Favorite Date</td>
							</tr>
							<c:forEach var="item" items="${favUsers }">
							<tr style="color: white;">
								<td>${item.username }</td>
								<td>${item.fullname }</td>
								<td>${item.email }</td>
								<td>${item.likeDate }</td>
							</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</form>
		</div>
		<div class="tab-pane fade" id="shareFriends" role="tabpanel"
			aria-labelledby="shareFriends-tab">
			<form action="" method="get">
				<div class="row mt-3">
					<div class="col">
						<div class="form-inline">
							<div class="form-group" style="color: yellow; font-weight: bold;">
								<lable>Video Title ? 
									<select name="videoUserId" id="videoUserId"
										class="form-control ml-3">
										<c:forEach var="item" items="${vidList }">
											<option value="${item.videoId }" 
												${item.videoId == videoUserId?'selected':'' }>${item.title }</option>
										</c:forEach>
									</select> 
								</lable>
								<button class="btn btn-info ml-2">Report</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col mt-3">
						<table class="table table-bordered">
							<tr style="color: blue; font-weight: bold;">
								<td>Sender Name</td>
								<td>Sender Email</td>
								<td>Receiver Email</td>
								<td>Send Date</td>
							</tr>
							<c:forEach var="item" items="${Shares }">
							<tr style="color: white;">
								<td>${item.fullname } </td>
								<td>${item.senderMail } </td>
								<td>${item.email } </td>
								<td>${item.shareDate } </td>
							</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>