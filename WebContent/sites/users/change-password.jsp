<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="offset-3 col-6 mt-4">
	<form action="ChangePasswordServlet" method="post" >
		<div class="card mt-5">
			<div class="card-header">Change Password</div>
			<div class="card-body">
				<jsp:include page="/common/inform.jsp"></jsp:include>
				<div class="row">
					<div class="col">
						<div class="form-group">
							<label for="username">Username</label> <input type="text"
								class="form-control" name="username" id="username"
								value="${username }" aria-describedby="usernameHid"
								placeholder="Username"> <small id="usernameHid"
								class="form-text text-muted">Username is required</small>
						</div>
						<div class="form-group">
							<label for="password">New Password</label> <input type="password"
								class="form-control" name="password" id="password"
								placeholder="Password"><small id="passwordHid"
								class="form-text text-muted">Password new is required</small>
						</div>
					</div>
					<div class="col">
						<div class="form-group">
							<label for="inputPassword">Current Password</label>
							<input type="password" name="currentPassword" id="inputPassword"
								class="form-control" placeholder="Password" required><small id="currentpasswordHid"
								class="form-text text-muted">Password current is required</small>
						</div>
						<div class="form-group">
							<label for="confirmPassword">Confirm Password</label> <input
								type="password" name="confirmPassword" id="confirmPassword"
								class="form-control" placeholder="Confirm Password"
								aria-describedby="confirmPaswordHid">

						</div>
					</div>

				</div>
			</div>
			<div class="card-footer text-muted">
				<button class="btn btn-outline-success">Change Password</button>
			</div>
		</div>
	</form>
</div>