<% 
 String username=(String)session.getAttribute("username");
 String picture=(String)session.getAttribute("picture");
 if(username!=null){  
        String name=(String)session.getAttribute("username");
		
		RequestDispatcher rd=request.getRequestDispatcher("/inbox.jsp");
		rd.forward(request,response);
		}
 else{
	 
%>
	 
<div class="horizontal" style="background-color:white; margin-bottom:0;">
			<span class="images"><a href="m_login.jsp"><p STYLE="FLOAT: left; color: purple;" >LOGIN</p></a></span>
			<div class="images"><img style="height:60px; width:auto;" src="images/i.png"></div>
			<span class="images"><A href="m_register.jsp"> <p STYLE="FLOAT:RIGHT; color: purple; ">REGISTER</p></a></span>
</div>
<div style="witdh:100%; height:450px; background-color:red; margin-top:0; background-image:url('images/b.jpg');
background-size: 100% 100%; background-repeat: no-repeat;">
</div>
	 
	 <%
	 
	 }
 %>
  
