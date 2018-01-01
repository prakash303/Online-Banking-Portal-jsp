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

<%@ page import="java.util.*, java.sql.*"%>
<table>
					<tr>
							<th> DATE  </th>
							<th> TO PAYEE </th>
							<th> AMOUNT </th>
							<th> REMARKS </th>
							<th> STATUS </th>
							<th> TIME</th>
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
					ps = con.prepareStatement("select * from "+username);
					rs = ps.executeQuery();
					
					while( rs.next() ){ %>
					<tr>
							<td> <%= rs.getString("date") %> </td>
							<td> <%= rs.getString("topayee") %></td>
							<td> <%= rs.getString("amount") %></td>
							<td> <%= rs.getString("remarks") %></td>
							<td> <%= rs.getString("status") %></td>
							<td> <%= rs.getString("time") %></td>
					</tr>											
					<%}
				
			}
			catch(Exception e)
			{
				out.print(e);
				RequestDispatcher rd=request.getRequestDispatcher("blankscreen.jsp");
				rd.include(request,response);
			}
%>
</table>

