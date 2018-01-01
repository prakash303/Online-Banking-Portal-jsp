<STYLE>
table { 
	width: 640px; 
    border-collapse: collapse; 
    border-spacing: 0;
	color: #333;
	font-family: Helvetica, Arial, sans-serif;
	} 
td, th { 
	border: 1px solid transparent;
	height: 30px;
	transition: all 0.3s;	
	} 
th {  
    background: #DFDFDF;; 
    font-weight: bold; 
}

td {  
    background: #FAFAFA;
    text-align: center; 
}

tr:nth-child(even) td { background: #F1F1F1; }   
       
tr:nth-child(odd) td { background: #FEFEFE; }  

tr td:hover { background: #666; color: #FFF; } 
</STYLE>

<script language="javascript">

function promt()
{
	var a=confirm("Wanna delete this account??");
	if(a==true)
	 return true;
	else{
	return false;
	}
}
</script>

<%@ page import="java.util.*, java.sql.*"%>
<table>
					<tr>
							<th> ACCOUNTS </th>
							<th> PHONE </th>
							<th> ADDRESS </th>
							<th> BALANCE </th>
							<th> REMOVE </th>
							<th> ADD MONEY </th>
							<th> WITHDARW </th>
					</tr>
<%
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	String username=(String)session.getAttribute("username");
			
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
		        con=DriverManager.getConnection("jdbc:mysql:///bank","root","admin");
					ps = con.prepareStatement("select * from userinfo");
					rs = ps.executeQuery();
					
					while( rs.next() ){ %>
					<tr>
							<td> <%= rs.getString("username")%> </td>
							<td> <%= rs.getString("phone") %></td>							
							<td> <%= rs.getString("address") %></td>
							<td> <%= rs.getString("balance") %></td>
							<td> <form onsubmit="return promt()" method="post" action="process_delete.jsp">
										<input type="hidden" name="uname" value="<%= rs.getString("username")%>">
										<input type="submit" value="DELETE"></form>
								</td>
							<td> <form action="process_admin_getamount.jsp">
										<input type="hidden" name="uname" value="<%= rs.getString("username")%>">
										<input type="hidden" name="amount">
										<input type="submit" value="DEPOSIT"></form>
								</td>
							<td> <form action="process_admin_getamount2.jsp">
										<input type="hidden" name="uname" value="<%= rs.getString("username")%>">
										<input type="hidden" name="amount">
										<input type="submit" value="CREDIT"></form>
								</td>
					</tr>											
					<%}
				
			}
			catch(Exception e)
			{
				out.print(e);
			}
%>
</table>

