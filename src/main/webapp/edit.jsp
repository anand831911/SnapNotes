<%@page import="com.entities.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file='all_js_css.jsp'%>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<%@include file='navbar.jsp'%>
		<br>
		<h1>Edit your note </h1>
		<br>
		<%
		int noteId = Integer.parseInt(request.getParameter("note_id").trim());

		Session s = FactoryProvider.getFactory().openSession();
		Note note = s.get(Note.class, noteId);

		s.close();
		%>
		<form action="UpdateServlet" method="post">
		<input value=<%= note.getId() %> name="noteId" type="hidden" />
			<div class="form-group">
				<label for="title">Note Title</label> <input type="text" required
					class="form-control" name="title" id="title"
					placeholder="Enter here" value="<%= note.getTitle() %>">
			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea id="content" name="content"
					placeholder="Enter your content here" required class="form-control"
					style="height: 250px;" ><%= note.getContent() %></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save Your Notes</button>
			</div>
		</form>

	</div>
</body>
</html>