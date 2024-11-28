<%@ page session="true" language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Request Access</title>
</head>
<body>
<% 
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("Employee")) {
        response.sendRedirect("login.jsp?error=Unauthorized access");
        return;
    }
%>
<h2>Request Software Access</h2>
<form action="requestAccess" method="post">
    <label for="softwareId">Software Name:</label>
    <input type="text" name="softwarename">
    <br>
    <br>
    <label for="accessType">Access Type:</label>
    <select name="accessType">
        <option value="Read">Read</option>
        <option value="Write">Write</option>
        <option value="Admin">Admin</option>
    </select>
    <br>
    <br>
    <label for="reason">Reason:</label>
    <textarea name="reason" required></textarea>
    <br>
    <br>
    <button type="submit">Submit Request</button>
    <br>
    <br>
    <a href="dashboard.jsp">Back to Dashboard</a>
</form>
</body>
</html>
