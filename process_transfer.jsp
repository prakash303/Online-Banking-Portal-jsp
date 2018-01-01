<%@ page import="java.util.*, java.sql.*,java.text.*"%>

<%
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
		String username=request.getParameter("uname");
		String samount=request.getParameter("amount");
		String remarks=request.getParameter("remarks");
		String username2=request.getParameter("username2");
		boolean valid=false;
		try{
			
					Class.forName("com.mysql.jdbc.Driver");
					con=DriverManager.getConnection("jdbc:mysql:///bank","root","admin");
							ps = con.prepareStatement("select username from userinfo");
							rs = ps.executeQuery();
							while(rs.next())
					{
						if(username2.equals(rs.getString("username")))
						{
							valid=true;
							break;
						}
					}
					if(valid){ 
					
					try{
			int amount= Integer.parseInt(samount);
											
											/*Getting date over here*/
											java.util.Date dNow = new java.util.Date();
											SimpleDateFormat day = new SimpleDateFormat ("dd.MM.yyyy");
											SimpleDateFormat time = new SimpleDateFormat ("hh:mm:ss a");
					
					try{
							
								ps = con.prepareStatement("select balance from userinfo where username=?");
								ps.setString(1,username);
								rs = ps.executeQuery();
								if(amount > 90000)
								{	
												ps = con.prepareStatement("insert into "+username+" values(?,?,?,?,'Failed',?)");
												ps.setString(1, day.format(dNow));
												ps.setString(2, username2);
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
												ps.setString(2, username2);
												ps.setString(3, samount);
												ps.setString(4, remarks);
												ps.setString(5, time.format(dNow));
												ps.executeUpdate();
												out.print("<html><br>Insufficient Funds!!<br>Transaction failed!!</html>");
												RequestDispatcher rd=request.getRequestDispatcher("t_transfer.jsp");
												rd.include(request,response);
											}
											
											else{
														try{
															/*updating user1 balance*/
															int total= balance-amount;
															ps = con.prepareStatement("update userinfo set balance=? where username=?");
															ps.setString(1,Integer.toString(total));
															ps.setString(2,username);
															ps.executeUpdate();
															
															
															/*Updating the user1 transaction Table*/
															ps = con.prepareStatement("insert into "+username+" values(?,?,?,?,'Success',?)");
															ps.setString(1, day.format(dNow));
															ps.setString(2, username2);
															ps.setString(3, samount);
															ps.setString(4, remarks);
															ps.setString(5, time.format(dNow));
															ps.executeUpdate();	
																
															/*updating user2 balance*/
															ps = con.prepareStatement("select balance from userinfo where username=?");
															ps.setString(1,username2);
															rs = ps.executeQuery();
															if(rs.next()){
																	sbal= rs.getString("balance");										
																	balance= Integer.parseInt(sbal);
																	
																	total= amount + balance;
																	ps = con.prepareStatement("update userinfo set balance=? where username=?");
																	ps.setString(1,Integer.toString(total));
																	ps.setString(2,username2);
																	ps.executeUpdate();
																	
																	
																	/*Updating user2 transaction Table*/
																	ps = con.prepareStatement("insert into "+username2+" values(?,'(Recieved) ',?,?,'Success',?)");
																	ps.setString(1, day.format(dNow));
																	ps.setString(2, "+"+samount);
																	ps.setString(3, username);
																	ps.setString(4, time.format(dNow));
																	ps.executeUpdate();
															}
															
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
											out.print("<html><div><br>Transaction unsuccessful..<br>Transfers above Rs 90,000 forbidden..<br>Please try again!</html>");
											RequestDispatcher rd=request.getRequestDispatcher("t_transfer.jsp");
											rd.include(request,response);	
											
						}
		
		
		}
		catch(Exception e)
		{
								out.print("<html><div><br><br>The bank cannot handle that kind of money!!!</html>");
								RequestDispatcher rd=request.getRequestDispatcher("t_transfer.jsp");
								rd.include(request,response);
		}					
						
						
						
						
					}
					else
					{
				
					out.print("<html><center><b>Error 404: The Recievers account not found in the database..</b></center></html>");
					RequestDispatcher rd=request.getRequestDispatcher("t_transfer.jsp");
					rd.include(request,response);
					}
		
		
		}
		catch(Exception e)
		{
								out.print(e);
								RequestDispatcher rd=request.getRequestDispatcher("blankscreen.jsp");
								rd.include(request,response);
		}
		
%>

		