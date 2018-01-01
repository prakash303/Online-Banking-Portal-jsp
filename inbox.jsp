<%@ page import="java.util.*, java.sql.*"%>

<head>
<title>Login into jailbot</title>
<jsp:include page="css/cssinfo.jsp" />
</head>
<body>
	<div class="container">
	<span>Need for speed....</span>
	<jsp:include page="header.jsp" />
	<jsp:include page="rip/t_bar.jsp" />

<%
		
		/*PrintWriter out=res.getWriter();*/
		String username=(String)session.getAttribute("username");
		String address=(String)session.getAttribute("address");
		String phone=(String)session.getAttribute("phone");
		String picture=(String)session.getAttribute("picture");
%>
<center>
</center>




<div>			
			<div style="float:right;"><div class="whitebox"><a href="t_balance.jsp">BALANCE</a></div>
									  <div class="whitebox"><a href="t_statement.jsp">STATEMENT</a></div>
									  <div class="whitebox"><a href="t_transfer.jsp">TRANSFER</a></div>
									  <div class="whitebox"><a href="t_billpay.jsp">BILLPAY</a></div>
			</div>
			<div style="float:left;"><img src="images/profile/<% out.print(picture);%>" style="height:300px; width:auto;"></div>
			<div class="userdetails"><div class="sameline" style="margin:50px;">
										<table style="width: 150px; color:white; font-size:20px;">
												<tr>	<td>Username:</td><td> <% out.print(username); %></td>	</tr>
												<tr>	<td>Phone: </td><td><% out.print(phone); %></td>			</tr>
												<tr>	<td>Address:</td><td><% out.print(address); %></td>		</tr>
										</table>
													<br><br>Bank Balance: Rs<jsp:include page="transactions/balance.jsp" />
										
									</div>
			
			</div>
			
			
</div>
</body>