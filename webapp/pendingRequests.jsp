<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pending Requests</title>
</head>

<body>
<% 
    String role = (String) session.getAttribute("role");
    if (role == null || !role.equals("Manager")) {
        response.sendRedirect("login.jsp?error=Unauthorized access");
        return;
    }
%>
<h2>Pending Access Requests</h2>
<table border="1">
    <tr>
        <th>Employee Name</th>
        <th>Software Name</th>
        <th>Access Type</th>
        <th>Reason</th>
        <th>Actions</th>
    </tr>
    <% 
        java.sql.Connection conn = user.utils.DataBaseConnection.getConnection();
        java.sql.Statement stmt = conn.createStatement();
        java.sql.ResultSet rs = stmt.executeQuery(
            "SELECT r.id, u.username, s.name AS softwareName, r.access_type, r.reason " +
            "FROM requests r JOIN users u ON r.user_id = u.id JOIN software s ON r.software_id = s.id " +
            "WHERE r.status = 'Pending'");
        while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getString("username") %></td>
        <td><%= rs.getString("softwareName") %></td>
        <td><%= rs.getString("access_type") %></td>
        <td><%= rs.getString("reason") %></td>
        <td>
            <form action="pendingRequest" method="post" style="display: inline;">
                <input type="hidden" name="requestId" value="<%= rs.getInt("id") %>">
                <input type="hidden" name="status" value="approved">
                <button type="submit">Approve</button>
            </form>
            <form action="pendingRequest" method="post" style="display: inline;">
                <input type="hidden" name="requestId" value="<%= rs.getInt("id") %>">
                <input type="hidden" name="status" value="Rejected">
                <button type="submit">Reject</button>
            </form>
        </td>
    </tr>
    <% 
        }
        rs.close();
        stmt.close();
        conn.close();
    %>
</table>

   
    <a href="dashboard.jsp">Back to Dashboard</a>
</body>
</html>
