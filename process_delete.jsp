<%@ page import="java.util.*, java.sql.*"%>

<% 
		Connection con;
		PreparedStatement ps;
		String username=request.getParameter("uname");
		if(username.equals("admin")){
			out.print("<html>Admin account is undeletable!!</html>");
			RequestDispatcher rd=request.getRequestDispatcher("m_administator.jsp");
			rd.include(request,response);			
		}
		else
		try{
				Class.forName("com.mysql.jdbc.Driver");
		        con=DriverManager.getConnection("jdbc:mysql:///bank","root","admin");
					ps = con.prepareStatement("delete from userinfo where username=?");
					ps.setString(1,username);
					ps.executeUpdate();
					
					ps = con.prepareStatement("drop table "+username);
					ps.executeUpdate();
					out.print("<html>Account "+username+" deleted</html>");
					RequestDispatcher rd=request.getRequestDispatcher("m_administator.jsp");
					rd.include(request,response);
		}
		catch(Exception e)
		{
								out.print(e);
								RequestDispatcher rd=request.getRequestDispatcher("m_administator.jsp");
								rd.include(request,response);
		}

%>

