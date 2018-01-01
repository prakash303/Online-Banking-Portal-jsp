<style>
body {
    margin: 0;
}

.sidem {
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 15%;
    background-color: #f1f1f1;
	position: absolute;
    z-index: 1;	
    height: 85%;
    overflow: auto;
	
}

.sidem li a {
    display: block;
    color: #000;
    padding: 8px 16px;
    text-decoration: none;
	width: 555px;
	
}

.sidem li a.active {
    background-color: #4CAF50;
    color: white;
}

.sidem li a:hover:not(.active) {
    background-color: #555;
    color: white;
}
</style>
</head>
<body>

<ul class="sidem">
	<li class="sli"><a class="sa" href="inbox.jsp">Inbox</a></li>
	<li class="sli"><a class="sa" href="t_transfer.jsp">Transfer</a></li>
	<li class="sli"><a class="sa" href="t_statement.jsp">Statement</a></li>

	<li class="sli"><a class="sa" href="t_billpay.jsp">Billpay</a></li>
	<li class="sli"><a class="sa" href="t_balance.jsp">Balance</a></li>
	
</ul>
<div style="margin-left:20%;padding:1px 16px;height:1000px;">

</body>





