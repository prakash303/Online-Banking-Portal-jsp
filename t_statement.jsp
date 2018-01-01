<head>
<title>Statement</title>
<jsp:include page="css/cssinfo.jsp" />
</head>
<body>
	<div class="container">
	<span>I swear its the truth....</span>
	<jsp:include page="header.jsp" />
	<jsp:include page="rip/t_bar.jsp" />
	
	<div style="max-width:800px; margin:auto; margin-top:50px; border:3px solid white; padding:20px">
	
	<center><jsp:include page="transactions/statement.jsp" /><center>
	<p style="font-size:20px; color:White;">Current total Balance: Rs<jsp:include page="transactions/balance.jsp" /></p>
	</div>
	
	
</body>