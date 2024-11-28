<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*" %>
<%
    HttpSession se = request.getSession();
    se.invalidate();
    response.sendRedirect("login.jsp");
%>
