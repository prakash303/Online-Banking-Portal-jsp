<head>
<title>Login into icicbank</title>
<jsp:include page="css/cssinfo.jsp" />
<script language="javascript">
function isNumberKey(evt){
	str = document.Form.amount.value;
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
	
    return true;	
}

function validateForm() {
	var x = document.forms["Form"]["amount"].value;
    if (x == "") {
        alert("Amount to be deposited isn't mentioned...");
        return false;
    }
}
</script>
</head>
<body>
	<div class="container">
	<span>Prem ratan dhan payo....</span>
	<jsp:include page="header.jsp" />
	<jsp:include page="rip/t_bar.jsp" />
	<center>
	<div class="forms">
	<form  onsubmit="return validateForm()" action="process_deposit.jsp" name="Form" >
	Enter the amount to deposit:<br><br> <input type="Text" name="amount" onkeypress="return isNumberKey(event)"><br><br>
	<input type="hidden" name="uname" value="<%= (String)session.getAttribute("username") %>">
	<input type="submit" name="Deposit">
	</form>
	</div>
	</center>
	
	
	
</body>