<%@ page import="java.util.*, java.sql.*"%>

 <% 
 String username=(String)session.getAttribute("username");
 
if(username!=null)
 {
					if(username.equals("admin")){ %>  
						<li><a href="index.jsp">HOME</a></li>	
						<li class="dropdown"><a href="" class="dropbutton">ACCOUNT v</a>
								<div class="dropdowncontent">
									<a href="t_balance.jsp">BALANCE</a>
									<a href="t_statement.jsp">STATEMENT</a>
									<a href="t_transfer.jsp">TRANSFER</a>
									<a href="t_billpay.jsp">BILLPAY</a>
									<a href="t_deposit.jsp">DEPOSIT</a>
								</div>
						</li>
						<li><a href="p_loans.jsp">LOANS</a></li>
						<li><a href="p_corp.jsp">CORPORATE</a></li>
						<li><a href="p_market.jsp">MARTKET</a></li>
						<li><a href="m_administator.jsp">Admin Panel</a></li>
						<li class="dropdown"><a href="" class="dropbutton">ABOUT v</a>
								<div class="dropdowncontent">
									<a href="m_about.jsp"> > ICICI BANK </a>
									<a href="m_dev.jsp"> > DEVELOPER </a>
									<a href="p_logout.jsp"> > LOGOUT</a>
								</div>
						</li>
						 
					<% }
					
				else { %>  
						<li><a href="index.jsp">HOME</a></li>	
						<li class="dropdown"><a href="" class="dropbutton">ACCOUNT v</a>
								<div class="dropdowncontent">
									<a href="t_balance.jsp">BALANCE</a>
									<a href="t_statement.jsp">STATEMENT</a>
									<a href="t_transfer.jsp">TRANSFER</a>
									<a href="t_billpay.jsp">BILLPAY</a>
									<a href="t_deposit.jsp">DEPOSIT</a>
								</div>
						</li>
						<li><a href="p_loans.jsp">LOANS</a></li>
						<li><a href="p_corp.jsp">CORPORATE</a></li>
						<li><a href="p_market.jsp">MARTKET</a></li>
						<li class="dropdown"><a href="" class="dropbutton">ABOUT v</a>
								<div class="dropdowncontent">
									<a href="m_about.jsp"> > ICICIBANK </a>
									<a href="m_dev.jsp"> > DEVELOPER </a>
									<a href="p_logout.jsp"> > LOGOUT</a>
								</div>
						</li>
						 
					<% } 
 }
		
  else{
			%>
				<li><a href="m_login.jsp">LOGIN</a></li>
				<li><a href="m_register.jsp">REGISTER</a></li>
				<li class="dropdown"><a href="" class="dropbutton">ABOUT v</a>
								<div class="dropdowncontent">
									<a href="m_about.jsp"> > ICICIBANK </a>
									<a href="m_dev.jsp"> > DEVELOPER </a>
									<a href="p_logout.jsp"> > LOGOUT</a>
								</div>
				</li>
			 
			<% 
        } 
		
%>