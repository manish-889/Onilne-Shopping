<%@page import="project.ConnectionProvider"%>  
<%@page import="java.sql.*"%>  
<%  
String email = (String) session.getAttribute("email");  
String mobileNumber = request.getParameter("mobileNumber");  
String password = request.getParameter("password");  

if (email == null || mobileNumber == null || password == null) {  
    response.sendRedirect("changeMobileNumber.jsp?msg=missing");  
    return;  
}  

try (Connection con = ConnectionProvider.getCon();  
     PreparedStatement psCheck = con.prepareStatement("SELECT * FROM userss WHERE email = ? AND password = ?");  
     PreparedStatement psUpdate = con.prepareStatement("UPDATE userss SET mobileNumber = ? WHERE email = ?")) {  

    psCheck.setString(1, email);  
    psCheck.setString(2, password);  

    ResultSet rs = psCheck.executeQuery();  

    if (rs.next()) {  
        psUpdate.setString(1, mobileNumber);  
        psUpdate.setString(2, email);  
        int rowsUpdated = psUpdate.executeUpdate();  
        
        if (rowsUpdated > 0) {  
            response.sendRedirect("changeMobileNumber.jsp?msg=done");  
        } else {  
        	 response.sendRedirect("changeMobileNumber.jsp?msg=wrong");   
        }  
    } else {  
        response.sendRedirect("changeMobileNumber.jsp?msg=wrong");  
    }  

} catch (Exception e) {  
    e.printStackTrace(); // Consider using a logging framework for production  
    response.sendRedirect("changeMobileNumber.jsp?msg=wrong");  
}  
%>