<%@ page import="java.util.*, java.sql.*"%>

<%
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			boolean valid=false;
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
		        con=DriverManager.getConnection("jdbc:mysql:///bank","root","admin");
				ps = con.prepareStatement("select * from userinfo");
				rs = ps.executeQuery();
				while(rs.next())
					{
						if(username.equals(rs.getString("username"))&&password.equals(rs.getString("password")))
						{
							valid=true;
							break;
						}
					}
					if(valid)
						{
							try
							{
							session.setAttribute("username",username);
							session.setAttribute("password",password);
							session.setAttribute("address",rs.getString("address"));
							session.setAttribute("phone",rs.getString("phone"));
							session.setAttribute("picture",rs.getString("picture"));
							RequestDispatcher rd = request.getRequestDispatcher("inbox.jsp");
							rd.forward(request,response);
							}
							catch(Exception e)
							{
								out.print(e);
							}
							
						}
						
					else
						{
							out.print("<html>Wrong Email or Password.<br>Try again!!</html>");
							RequestDispatcher rd = request.getRequestDispatcher("m_login.jsp");
							rd.include(request,response);
							
						}
			}
			catch(Exception e)
			{
				out.print(e);
			}
			
			
%>