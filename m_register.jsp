<head>
<title>Register youself</title>
<jsp:include page="css/cssinfo.jsp" />
<script language="javascript">
function changeFunc()
{
	var simages = document.getElementById("simages");
    var selectedValue = simages.options[simages.selectedIndex].value
var picture="images/profile/"+ selectedValue
document.imgp.src=picture;
}

function isNumberKey(evt){
	str = document.Form.phone.value;
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
	else if (str.length > 9)
	{alert("Enter only 10 digit phone numbers...");
		return false;
	}
    return true;	
}
function validateForm() {
	var x = document.forms["Form"]["username"].value;
    if (x == "") {
        alert("Username must be filled out");
        return false;
    }
	var x = document.forms["Form"]["password"].value;
    if (x == "") {
        alert("password must be filled out");
        return false;
    }
	
	var x = document.forms["Form"]["phone"].value;
    if (x == "") {
        alert("Phone number must be filled out");
        return false;
    }
	var x = document.forms["Form"]["address"].value;
    if (x == "") {
        alert("Address field is Empty....");
        return false;
    }
	var x = document.forms["Form"]["picture"].value;
    if (x == "dk.jpg") {
        alert("Profile Picture not Selected....");
        return false;
    }
}
</script>
</head>
<body>
	<div class="container">
	<span>Fast server slow user....</span>
	<jsp:include page="header.jsp" />
	
	<div class="forms">
	<form onsubmit="return validateForm()" method="post" action="reg_process.jsp" name="Form">
	
	Username<br> <input type="text" name="username"><br><br>
	Password<br> <input type="text" name="password"><br><br>
	Phone<br> <input type="text" name="phone" onkeypress="return isNumberKey(event)"><br><br>
	Address<br> <input type="text" name="address"><br><br>
	Picture<br> 
		<select name="picture" id="simages" class="icon-menu" onchange="changeFunc();">
				<option value="dk.jpg">Select Profile Picture</option>
				<option value="dk1.jpg">Sword Smith</option>
				<option value="dk2.jpg">HighFall</option>
				<option value="dk3.jpg">Flame Bender</option>
				<option value="dk4.jpg">High Rank</option>
				<option value="dk5.jpg">Skull Armour</option>
				<option value="dk6.jpg">Elite Knight</option>
				<option value="dk7.jpg">Old Knight</option>
		</select><br><br>
		<center><img src="images/profile/dk.jpg" width=150 height=150 name="imgp"></center>
	
	<input type="submit" name="Register">
	</form>
	</div>
	
</body>