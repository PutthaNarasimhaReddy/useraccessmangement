<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Log In</title>
</head>
<body>
    <h2>Log In</h2>
    <form action="login" method="post">
        <label for="username">Username:</label>
        <input type="text" name="username" required>
        <br>
        <br>
        <label for="password">Password:</label>
        <input type="password" name="password" required>
        <br>
        <br>
        <button type="submit">Log In</button>
    </form>
</body>
</html>
