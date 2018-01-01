<div class="forms">
<form action="process_billpay.jsp">
Enter the Payee:<br>
<input type="text" name="topayee"><br><br>
Enter the amount to pay:<br>
<input type="text" name="amount"><br><br>
Enter remarks:<br>
<input type="text" name="remarks"><br><br>
<input type="hidden" name="uname" value="<%= (String)session.getAttribute("username") %>">
<input type="submit" value="PAY">
</form>
</div>