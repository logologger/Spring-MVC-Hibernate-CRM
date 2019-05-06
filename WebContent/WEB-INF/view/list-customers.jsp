<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>


<html>

	<head>
		<title> List Customers </title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"/>
	</head>
	<body>
		<div id ="wrapper">
		
			<div id = "header">
				<h2> CRM  Customer Relationship Management </h2>
			</div>
			
			<div id= "container">
			
				<div id = "content">
				
				<input type="button" value="Add Customer"
				onclick = "window.location.href='showFormAdd'";return false;/>
				
					<table>
					
						
						<tr>
							<th> First Name </th>
							<th> Last Name </th>
							<th>Email </th>
							<th>Action</th>
						</tr>
						<c:forEach var="tempCustomer" items= "${customers}">
							<!--  Construct an update link -->
							<c:url var = "updateLink" value="/customer/showFormUpdate">
								<c:param name="customerId" value="${tempCustomer.id}">
								</c:param>
							</c:url>
							<c:url var = "deleteLink" value="/customer/delete">
								<c:param name="customerId" value="${tempCustomer.id}">
								</c:param>
							</c:url>
							<tr>
								<td> ${tempCustomer.firstName} </td>
								<td> ${tempCustomer.lastName} </td>
								<td> ${tempCustomer.email} </td>
								<td> 
								<a href="${updateLink}">
								Update
								</a> |
								<a href="${deleteLink}"
								onclick="if(!(confirm('Sure want to delete ?'))) return false">Delete</a></td>
							</tr>
						
						</c:forEach>
						
					</table>
				</div>
			</div>
		</div>
		
	</body>

</html>