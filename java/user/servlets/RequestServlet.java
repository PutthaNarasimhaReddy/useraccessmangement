package user.servlets;



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.utils.DataBaseConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class RequestServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if (userId == null) {
            response.sendRedirect("login.jsp?error=Please log in first");
            return;
        }

        String softwareIdStr = request.getParameter("software_id");
       
 
        String accessType = request.getParameter("accessType");
        String reason = request.getParameter("reason");
        if (softwareIdStr == null || softwareIdStr.isEmpty() || accessType == null || accessType.isEmpty() || reason == null || reason.isEmpty()) {
            request.setAttribute("error", "All fields must be filled out.");
            request.getRequestDispatcher("requestAccess.jsp").forward(request, response);
            return;
        }
        int softwareId = Integer.parseInt(softwareIdStr);

        try (Connection connection = DataBaseConnection.getConnection()) {
            String query = "INSERT INTO requests (user_id, software_id, access_type, reason, status) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, userId);
            statement.setInt(2, softwareId);
            statement.setString(3, accessType);
            statement.setString(4, reason);
            statement.setString(5, "Pending");
            statement.executeUpdate();
            response.sendRedirect("requestAccess.jsp?success=Request submitted successfully");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("requestAccess.jsp?error=Unable to submit request");
        }
    }
}
