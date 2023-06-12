<%@page import="java.util.Base64"%>
<%@page import="java.io.OutputStream"%>
<%@page import="com.jsp.cloth_show_room.dto.ClothDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.jsp.cloth_show_room.dao.ClothDetailsDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<style type="text/css">
.container {
	padding: 2rem 0rem;
}

h4 {
	margin: 2rem 0rem 1rem;
}

.table-image {td , th { vertical-align:middle;
	
}
}
</style>
</head>
<body>

	<%
		ClothDetailsDao clothDetailsDao = new  ClothDetailsDao();
	
		List<ClothDetails> clothDetails = clothDetailsDao.getAllClothDetails();
	%>

	<jsp:include page="admin-navbar.jsp"></jsp:include>
	<div class="container" style="margin-top: 50px;">
		<div class="row">
			<div class="col-12">
				<table class="table table-image">
					<thead>
						<tr>
							<th scope="col">ClothBarCode</th>
							<th scope="col">ClothImage</th>
							<th scope="col">ClothType</th>
							<th scope="col">WearType</th>
							<th scope="col">ClothPrice</th>
							<th scope="col">Delete</th>
							<th scope="col">Edit</th>
						</tr>
					</thead>
					<tbody>
					<%for(ClothDetails clothDetails2:clothDetails){%>
						<%
							byte[] image = clothDetails2.getImage();
						
							//response.setContentType("image/jpeg");
							
							String base64Image = Base64.getEncoder().encodeToString(image);
							
							String imageUrl = base64Image;
							
							
						%>
						<tr>
							<td><%=clothDetails2.getClothBarCode()%></td>
							<td class="w-25"><img
								src="https://media.istockphoto.com/id/155596905/photo/high-class-female-clothing.jpg?s=612x612&w=0&k=20&c=V1HcqglhOc76MHidrmyPjraiMNXwhAzO-wMHbEMMEqM="
								class="img-fluid img-thumbnail" alt="cloth-image">
							</td>
							<td><%=clothDetails2.getClothType() %></td>
							<td><%=clothDetails2.getWearType() %></td>
							<td><%=clothDetails2.getClothPrice() %></td>
							<td><button>
									<a href="deleteCloth?id=<%=clothDetails2.getClothBarCode()%>"/>DELETE
								</button></td>
							<td><button>
									<a href="edit-cloth.jsp?id=<%=clothDetails2.getClothBarCode()%>"/>EDIT
								</button></td>
						</tr>
					<%}%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>