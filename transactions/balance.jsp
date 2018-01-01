<%@ page import="java.util.*, java.sql.*"%>

<%Connection con;
	PreparedStatement ps;
	ResultSet rs;
	String username=(String)session.getAttribute("username");
	
	
	try{
				Class.forName("com.mysql.jdbc.Driver");
		        con=DriverManager.getConnection("jdbc:mysql:///bank","root","admin");
					ps = con.prepareStatement("select balance from userinfo where username=?");
					ps.setString(1,username);
					rs = ps.executeQuery();
					
					if(rs.next()){
					String sbal= rs.getString("balance");
					out.print(sbal);
					}
					
					
					
	}
	catch(Exception e)
	{
		out.print(e);
		RequestDispatcher rd=request.getRequestDispatcher("blankscreen.jsp");
		rd.include(request,response);
	}
	
	
%>