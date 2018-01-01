<%String username=request.getParameter("uname");%>

<script language="javascript">

function getamount() {
	var amount= prompt("Amount to Add: ","");
	document.forms["Form"]["amount"].value = amount;
}
function submit()
{
	document.getElementById("submitbutton").click();
	ducument.Form.submit();
}
</script>
<body onload="submit()">
<form id="Form" onsubmit="return getamount()" action="process_admin_credit.jsp">
<input type="hidden" name="uname" value="<% out.print(username); %>" >
<input type="hidden" name="amount">
<input type="submit" id="submitbutton">
</form>
</body>
<%

								RequestDispatcher rd=request.getRequestDispatcher("m_administator.jsp");
								rd.include(request,response);
%>