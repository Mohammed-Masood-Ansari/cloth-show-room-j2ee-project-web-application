<%@page import="java.util.Base64"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.jsp.cloth_show_room.dao.ClothDetailsDao"%>
<%@page import="com.jsp.cloth_show_room.dto.ClothDetails"%>
<%@page import="com.jsp.cloth_show_room.dto.UserCart"%>
<%@page import="java.util.List"%>
<%@page import="com.jsp.cloth_show_room.dao.CartDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
</style>
</head>
<body>
	<jsp:include page="user-cart-navbar.jsp"></jsp:include>
	<%
	CartDao cartDao = new CartDao();
	List<UserCart> userCarts = cartDao.getAllCarts();

	ClothDetailsDao clothDetailsDao = new ClothDetailsDao();

	List<ClothDetails> clothDetails = clothDetailsDao.getAllClothDetails();

	//ClothDetails clothDetails = clothDetailsDao.getClothDetails(clothBarCode);
	int finalPrice = 0;
	%>

	<%
	for (UserCart userCart : userCarts) {
	%>

	<%
	for (ClothDetails clothDetail : clothDetails) {
	%>
		
	<%
	if (userCart.getUserCartId() == clothDetail.getClothBarCode()) {
	%>
	<!-- total cart price calculation -->
	<%
		finalPrice += userCart.getClothPrice();
	%>
	<%
	byte[] image = clothDetail.getImage();

	String base64Image = Base64.getEncoder().encodeToString(image);
	%>
	<section style="margin-top: 80px;">
		
		<article>
			<div class="card"
				style="width: 17rem; height: 27rem; float: left; margin-left: 10px;">
				<div>
					<img src="data:image/png;base64,<%=base64Image%>"
						class="card-img-top" alt="myImage" width="60px;" height="310px;">
				</div>

				<div class="card-body" style="float: left;">
					<h6 class="card-title">
						price =
						<del><%=clothDetail.getClothPrice()%></del>
						discount=<%=clothDetail.getOffer()%>%
					</h6>
					<h6 class="card-text">
						final price=
						<%=clothDetail.getClothPrice() - ((clothDetail.getClothPrice()) * (clothDetail.getOffer())) / 100%>&nbsp;
					</h6>
					<div style="display: flex;">
						<a href="openPlaceOrder?barcode=<%=clothDetail.getClothBarCode()%>"
							class="btn btn-primary">BuyNow</a> <a
							href="delete?barcode=<%=clothDetail.getClothBarCode()%>"
							class="btn btn-primary" style="margin-left: 20px;">DELETE</a>
					</div>
				</div>
			</div>
		</article>
	</section>
	<%
	}
	%>
	<%
	}
	%>

	<%
	}
	%>
	<div>
		
		<a href="place-order?id" class="btn btn-primary">Place-Order</a>
		<h3 class="btn btn-primary"><%=finalPrice%></h3>
	</div>

</body>
</html>