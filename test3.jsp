<%@ page import="java.util.*, java.sql.*"%>

<%
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
			
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
		        con=DriverManager.getConnection("jdbc:mysql:///book","root","admin");
					ps = con.prepareStatement("select * from books");
					rs = ps.executeQuery();
					%>
					 
					<%
					while( rs.next() ){
					%><table style=" background-color: white; "><tr>
					<td><%= rs.getString("bookname") %></td>
					<td><%= rs.getString("price") %></td>
					</tr></table>
					<%
					
					}
				
			}
			catch(Exception e)
			{
				out.print(e);
			}
%>