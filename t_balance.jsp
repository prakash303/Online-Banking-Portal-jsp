<%@ page import="java.util.*, java.sql.*"%>

<head>
<title>Balance</title>
<jsp:include page="css/cssinfo.jsp" />
</head>
<body>
	<div class="container">
	<span>We will wash your dirty money.....</span>
	<jsp:include page="header.jsp" />
	<jsp:include page="rip/t_bar.jsp" />
	<div class="forms"><center>
	<p style="font-size:25px;">Total Money in your account is</p>
	<p style="font-size:50px;">Rs<jsp:include page="transactions/balance.jsp" />
	</p></div>
	</center>
	
	
</body>