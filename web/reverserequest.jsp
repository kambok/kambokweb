<%-- 
    Document   : reverserequest
    Created on : Jul 23, 2022, 6:51:25 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        
        String pin =request.getParameter("pin");
        session.setAttribute("resersecode", pin);
        response.sendRedirect("reversedetails.jsp");
        %>
    </body>
</html>
