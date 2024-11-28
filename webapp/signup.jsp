<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
</head>
<body>
    <h2>Sign Up</h2>
    <form action="signup" method="post">
        <label for="username">Username:</label>
        <input type="text" name="username" required><br>
        <br>
        <label for="password">Password:</label>
        <input type="password" name="password" required>
        <br>
        <br>
        <button type="submit">Sign Up</button>
        
    </form>
    <br>
    <a href="login.jsp">Already have an account? Log in here.</a>
</body>
</html>
