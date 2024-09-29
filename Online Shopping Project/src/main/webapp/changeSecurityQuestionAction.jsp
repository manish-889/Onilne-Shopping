<%@page import="project.ConnectionProvider"%>  
<%@page import="java.sql.*"%>  
<%  

String email = (String) session.getAttribute("email");  
String securityQuestion = request.getParameter("securityQuestion");  
String newAnswer = request.getParameter("newAnswer");  
String password = request.getParameter("password");  

try  {  
	Connection con = ConnectionProvider.getCon();   
    PreparedStatement ps = con.prepareStatement("SELECT * FROM userss WHERE email = ? AND password = ?");
    ps.setString(1, email);  
    ps.setString(2, password);  
    
    ResultSet rs = ps.executeQuery();  

    if (rs.next()) {  
        
        try (PreparedStatement updatePs = con.prepareStatement("UPDATE userss SET securityQuestion = ?, answer = ? WHERE email = ?")) {  
            updatePs.setString(1, securityQuestion);  
            updatePs.setString(2, newAnswer);  
            updatePs.setString(3, email);  
            updatePs.executeUpdate();  

            response.sendRedirect("changeSecurityQuestion.jsp?msg=done");  
        }  
    } else {  
        response.sendRedirect("changeSecurityQuestion.jsp?msg=wrong");  
    }  
} catch (Exception e) {  
   System.out.println(e);
}  
%>