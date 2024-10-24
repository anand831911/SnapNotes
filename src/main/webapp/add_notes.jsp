<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Notes</title>
<%@include file='all_js_css.jsp'%> <!-- Include common CSS and JS files -->
</head>
<body>
	<div class="container">
		<%@include file='navbar.jsp'%> <!-- Include navigation bar -->
		<br>
		<h1>Please Fill Your Note Details</h1>

		<br>
		<!-- This is the form for adding a note -->
		<form action="SaveNoteServlet" method="post">
			
			<div class="form-group">
				<label for="title">Note Title</label>
				<input type="text" required class="form-control" name="title" id="title" placeholder="Enter here">
			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea id="content" name="content" placeholder="Enter your content here" required class="form-control" style="height: 250px;"></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Add</button>
			</div>
		</form>
	</div>
</body>
</html>
