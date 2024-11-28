<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Create Software</title>
</head>
<body>
<% 
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("Admin")) {
        response.sendRedirect("login.jsp?error=Unauthorized access");
        return;
    }
%>
    <h2>Create Software</h2>
<form action="createSoftware" method="post">
    <label for="name">Software Name:</label>
    <input type="text" name="name" required>
    <br>
    <br>
    <label for="description">Description:</label>
    <textarea name="description" required></textarea>
    <br>
    <br>
    <label>Access Levels:</label><br>
    <input type="checkbox" name="accessLevels" value="Read"> Read<br>
    <input type="checkbox" name="accessLevels" value="Write"> Write<br>
    <input type="checkbox" name="accessLevels" value="Admin"> Admin<br>
    <br>
    <br>
    <button type="submit">Create</button>
</form>
<br>


    
    <a href="dashboard.jsp">Back to Dashboard</a>
</body>
</html>
