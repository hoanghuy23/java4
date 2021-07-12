<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="col mt-4">
	<jsp:include page="/common/inform.jsp"></jsp:include>
	<ul class="nav nav-tabs" id="myTab" role="tablist">
		<li class="nav-item" role="presentation"><a
			class="nav-link active" id="videoEdition-tab" data-toggle="tab"
			href="#videoEdition" role="tab" aria-controls="videoEdition"
			aria-selected="true">User edition</a></li>
		<li class="nav-item" role="presentation"><a class="nav-link"
			id="videoList-tab" data-toggle="tab" href="#videoList" role="tab"
			aria-controls="videoList" aria-selected="false">User list</a></li>
	</ul>
	<div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active" id="videoEdition"
			role="tabpanel" aria-labelledby="videoEdition-tab">
			<form action="" method="post">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col">
								<div class="form-group">
									<label for="username">Username</label> 
									<input type="text"
										class="form-control" name="username" id="username" value="${user.username }"
										aria-describedby="usernameHid" placeholder="Username">
									<small id="usernameHid" class="form-text text-muted">Username
										is required</small>
								</div>
								<div class="form-group">
									<label for="fullname">Fullname</label> 
									<input type="text"
										class="form-control" name="fullname" id="fullname" value="${user.fullname }"
										aria-describedby="fullnameHid" placeholder="Fullname">
									<small id="fullnameHid" class="form-text text-muted">Fullname
										is required</small>
								</div>
							</div>
							<div class="col">
								<div class="form-group">
									<label for="password">Password</label> 
									<input type="text"
										class="form-control" name="password" id="password" value="${user.password }"
										aria-describedby="passwordHid" placeholder="Password">
									<small id="passwordHid" class="form-text text-muted">Password
										is required</small>
								</div>
								<div class="form-group">
									<label for="email">Email</label> 
									<input type="email"
										class="form-control" name="email" id="email" value="${user.email }"
										aria-describedby="emailHid" placeholder="Email"> <small
										id="emailHid" class="form-text text-muted">Email is
										required</small>
								</div>
							</div>
						</div>
					</div>
					<div class="card-footer text-muted">
						<button class="btn btn-primary" formaction="Admin/UsersManagementServlet/create">Create</button>
						<button class="btn btn-warning" formaction="Admin/UsersManagementServlet/update">Update</button>
						<button class="btn btn-danger" formaction="Admin/UsersManagementServlet/delete">Delete</button>
						<button class="btn btn-info" formaction="Admin/UsersManagementServlet/reset">Reset</button>
					</div>
				</div>
			</form>
		</div>
		<div class="tab-pane fade" id="videoList" role="tabpanel"
			aria-labelledby="videoList-tab">
			<table class="table table-stripe">
				<tr style="color: blue; font-weight: bold;">
					<td>Username</td>
					<td>Fullname</td>
					<td>Email</td>
					<td>Role</td>
					<td>&nbsp;</td>
				</tr>
				<c:forEach var="item" items="${users }">
				<tr style="color: white;">
					<td>${item.username }</td>
					<td>${item.fullname }</td>
					<td>${item.email }</td>
					<td>${item.admin? 'Admin' : 'User' }</td>
					<td><a href="Admin/UsersManagementServlet/edit?username=${item.username }">
						<i class="fa fa-edit" aria-hidden="true"></i>
							Edit</a> <a href="Admin/UsersManagementServlet/delete?username=${item.username }">
						<i class="fa fa-trash" aria-hidden="true">
							Delete</i></a>
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>