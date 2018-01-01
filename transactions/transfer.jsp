<div class="forms">
<form action="process_transfer.jsp">

Amount to Transfer<br>
<input type="text" name="amount"><br><br>
Receivers Account username<br>
<input type="text" name="username2"><br><br>
Remarks<br>
<input type="text" name="remarks"><br><br>
<input type="hidden" name="uname" value="<%= (String)session.getAttribute("username") %>">
<input type="Submit" value="Tranfer Money"><br>
</form>
<span>

</div>