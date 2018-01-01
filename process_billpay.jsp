<%@ page import="java.util.*, java.sql.*,java.text.*"%>

<%
		Connection con;
		PreparedStatement ps;
		ResultSet rs;
		String username=request.getParameter("uname");
		String samount=request.getParameter("amount");
		String remarks=request.getParameter("remarks");
		String topayee=request.getParameter("topayee");
		try{
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
								if(amount > 90000)
								{	
												ps = con.prepareStatement("insert into "+username+" values(?,?,?,?,'Failed',?)");
												ps.setString(1, day.format(dNow));
												ps.setString(2, topayee);
												ps.setString(3, samount);
												ps.setString(4, remarks);
												ps.setString(5, time.format(dNow));
												ps.executeUpdate();
											
											
											
									throw new EmptyStackException();  
								}
							if(rs.next()){
											String sbal= rs.getString("balance");										
											int balance= Integer.parseInt(sbal);
											if(balance < amount)
											{
												ps = con.prepareStatement("insert into "+username+" values(?,?,?,?,'Failed',?)");
												ps.setString(1, day.format(dNow));
												ps.setString(2, topayee);
												ps.setString(3, samount);
												ps.setString(4, remarks);
												ps.setString(5, time.format(dNow));
												ps.executeUpdate();
												out.print("<html><br>Insufficient Funds!!<br>Transaction failed!!</html>");
												RequestDispatcher rd=request.getRequestDispatcher("t_billpay.jsp");
												rd.include(request,response);
											}
											else{
														try{
															int total= balance-amount;
															ps = con.prepareStatement("update userinfo set balance=? where username=?");
															ps.setString(1,Integer.toString(total));
															ps.setString(2,username);
															ps.executeUpdate();
															
															
															/*Updating the transaction Table*/
															ps = con.prepareStatement("insert into "+username+" values(?,?,?,?,'Success',?)");
															ps.setString(1, day.format(dNow));
															ps.setString(2, topayee);
															ps.setString(3, samount);
															ps.setString(4, remarks);
															ps.setString(5, time.format(dNow));
															ps.executeUpdate();								
															
															out.print("<html><br>Funds Transfer Success!!<br> Money will be transferred in 2-3 working days.</html>");
															RequestDispatcher rd=request.getRequestDispatcher("blankscreen.jsp");
															rd.include(request,response);
														
															}
															catch(Exception e){	out.print(e);}
													}
											}
					
					
						}
						catch(Exception e)
						{
											out.print("<html><div><br>Transaction unsuccessful..<br>Billpay above Rs 50,000 forbidden..<br>Please try again!</html>");
											RequestDispatcher rd=request.getRequestDispatcher("t_billpay.jsp");
											rd.include(request,response);	
											
						}
		
		
		}
		catch(Exception e)
		{
								out.print("<html><div><br><br>The bank cannot handle that kind of money!!!</html>");
								RequestDispatcher rd=request.getRequestDispatcher("t_billpay.jsp");
								rd.include(request,response);
		}
		
%>

		