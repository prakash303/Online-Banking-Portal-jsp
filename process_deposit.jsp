<%@ page import="java.util.*, java.sql.*,java.text.*"%>

<%
		Connection con;
		PreparedStatement ps;
		ResultSet rs;
		String username=request.getParameter("uname");
		try{String samount=request.getParameter("amount");
		
		int amount= Integer.parseInt(samount);
		/*Getting date over here*/
								java.util.Date dNow = new java.util.Date();
								SimpleDateFormat day = new SimpleDateFormat ("dd.MM.yyyy");
								SimpleDateFormat time = new SimpleDateFormat ("hh:mm:ss a");
		
		try{
				Class.forName("com.mysql.jdbc.Driver");
		        con=DriverManager.getConnection("jdbc:mysql:///bank","root","admin");
					ps = con.prepareStatement("select balance from userinfo where username=?");
					ps.setString(1,username);
					rs = ps.executeQuery();
					if(amount > 50000)
					{	
								ps = con.prepareStatement("insert into "+username+" values(?,'(Deposit) ',?,'Bank','Failed',?)");
								ps.setString(1, day.format(dNow));
								ps.setString(2, "+"+samount);
								ps.setString(3, time.format(dNow));
								ps.executeUpdate();
								
								
								
						throw new EmptyStackException();  
					}
				if(rs.next()){
								String sbal= rs.getString("balance");	
							
							int balance= Integer.parseInt(sbal);
							try{
								int total= amount + balance;
								ps = con.prepareStatement("update userinfo set balance=? where username=?");
								ps.setString(1,Integer.toString(total));
								ps.setString(2,username);
								ps.executeUpdate();
								
								
								/*Updating the transaction Table*/
								ps = con.prepareStatement("insert into "+username+" values(?,'(Deposit)',?,'Bank','Success',?)");
								ps.setString(1, day.format(dNow));
								ps.setString(2, "+"+samount);
								ps.setString(3, time.format(dNow));
								ps.executeUpdate();								
								
								out.print("<html><div><br>Money Deposited Successfully!! Thanks for using our Services</html>");
								RequestDispatcher rd=request.getRequestDispatcher("blankscreen.jsp");
								rd.include(request,response);
								
							}
							catch(Exception e){
								out.print(e);
							}
				}
		
		
		}
			catch(Exception e)
			{
								out.print("<html><div><br>Transaction unsuccessful..<br>Transaction above Rs 50,000 forbidden..<br>Please try again!</html>");
								RequestDispatcher rd=request.getRequestDispatcher("blankscreen.jsp");
								rd.include(request,response);	
								
			}
		
		}
		catch(Exception e)
		{
								out.print("<html><div><br><br>Sir kindly open an account in our Swiss Branch!!!</html>");
								RequestDispatcher rd=request.getRequestDispatcher("t_deposit.jsp");
								rd.include(request,response);
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
%>

		