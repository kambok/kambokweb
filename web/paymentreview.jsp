<%-- 
    Document   : paymentreview
    Created on : Jul 19, 2022, 6:39:41 PM
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
        session.setAttribute("pin", request.getParameter("pin"));
        response.sendRedirect("sendpayment.jsp");
                
        %>
    </body>
</html>
