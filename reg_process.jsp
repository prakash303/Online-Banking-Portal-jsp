<%@ page import="java.util.*, java.sql.*"%>

<%Connection con;
	PreparedStatement ps;
	ResultSet rs;
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			String picture = request.getParameter("picture");
			boolean valid=false;
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
		        con=DriverManager.getConnection("jdbc:mysql:///bank","root","admin");
					ps = con.prepareStatement("select username from userinfo");
					rs = ps.executeQuery();
					while(rs.next())
			{
				if(username.equals(rs.getString("username")))
				{
					valid=true;
					break;
				}
			}
			if(valid)
			{
				
				out.print("<html><b>Username already exist</b></html>");
				RequestDispatcher rd=request.getRequestDispatcher("m_register.jsp");
				rd.include(request,response);
			}
			else
			{
			/* Inserting values in main table */
			ps=con.prepareStatement("insert into userinfo values(?,?,?,?,?,?,0)");
			ps.setString(1,"1");
			ps.setString(2,username);
			ps.setString(3,password);
			ps.setString(4,phone);
			ps.setString(5,address);
			ps.setString(6,picture);
			ps.executeUpdate();
			
			/*creating new history table*/
			ps=con.prepareStatement("create table "+username+"(date varchar(20),topayee varchar(20),amount int(50), remarks varchar(20), status varchar(20),time varchar(20));");
			//ps.setString(1,(username));
			ps.executeUpdate();
			
			
			/* Redirecting to Login Page */
			out.print("<html><center><b>Account Registered! Now you can Login</b></center></html>");
			RequestDispatcher rd=request.getRequestDispatcher("m_login.jsp");
			rd.include(request,response);
			}
				
			}
			catch(Exception e)
			{
				out.print(e);
			}
%>