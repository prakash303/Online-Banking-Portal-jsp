

 <% 
 String username=(String)session.getAttribute("username");
 String picture=(String)session.getAttribute("picture");
 if(username!=null){  
        String name=(String)session.getAttribute("username");  
  %>
<a href="inbox.jsp"><img src="images/profile/<% out.print(picture);%>" style="height:50px; width:auto; border-radius: 25px; float:left; margin: 0 25 0 0;"></a>
<%  
        out.print("Hello, "+ username+ " | "); 
%>
<a href="p_logout.jsp" style="text-decoration:none; color:#c43235; "> Logout</a>
<%		
        }  
		
        else{
			%>
			<a href="m_login.jsp" style="text-decoration:none; color:#c43235; ">Login</a> 
			<% 
        } 
		
%>