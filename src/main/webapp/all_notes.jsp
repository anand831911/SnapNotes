<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Query"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file='all_js_css.jsp'%>
<title>All Notes : Note Taker</title>
</head>
<body>

	<div class="container">
		<%@include file='navbar.jsp'%>
		<!-- Include navigation bar -->
		<br>
		<h1 class="text-uppercase">All Notes :</h1>

		<div clas="row">

			<div class="col-12">
				<%
				Session s = FactoryProvider.getFactory().openSession();
				Query q = s.createQuery("from Note");
				List<Note> list = q.list();
				for (Note note : list) {
				%>

				<div class="card mt-3">
					<img class="card-img-top pl-4 pt-4 mx-auto"
						style="max-width: 100px;" src="img/pencil.png"
						alt="Card image cap">
					<div class="card-body px-5">
						<h5 class="card-title"><%=note.getTitle()%></h5>
						<p class="card-text"><%=note.getContent()%></p>
						<%
						String dateStr = note.getAddedDate().toString();

						// Create a DateFormat to parse and format the date and time
						java.text.SimpleDateFormat inputFormat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");

						// Parse the string date into a Date object
						java.util.Date parsedDate = inputFormat.parse(dateStr);

						// Create a SimpleDateFormat for the output formats
						java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd"); // For date
						java.text.SimpleDateFormat timeFormat = new java.text.SimpleDateFormat("hh:mm a"); // For time (12-hour format)

						// Format the date and time
						String formattedDate = dateFormat.format(parsedDate);
						String formattedTime = timeFormat.format(parsedDate);
						%>
						<p class="card-text"><b>
							Date :
							<%=formattedDate%></b></p>
						<p class="card-text"><b>
							Time :
							<%=formattedTime%></b></p>
						<div class="container text-center mt-2">
							<a href="DeleteServlet?note_id=<%=note.getId()%>"
								class="btn btn-dark">Delete</a> <a
								href="edit.jsp?note_id=<%=note.getId()%>"
								class="btn btn-primary">Update</a>
						</div>
					</div>
				</div>

				<%
				}
				s.close();
				%>
			</div>
		</div>


	</div>

</body>
</html>