<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
</head>
<body>
    <h2>Welcome, <%= session.getAttribute("username") %>!</h2>
    <ul>
        <li><a href="createSoftware.jsp">Create Software (Admin Only)</a></li>
        <li><a href="requestAccess.jsp">Request Software Access</a></li>
        <li><a href="pendingRequests.jsp">Pending Access Requests (Manager Only)</a></li>
    </ul>
    <form action="logout" method="post">
        <button type="submit">Log Out</button>
    </form>
</body>
</html>
