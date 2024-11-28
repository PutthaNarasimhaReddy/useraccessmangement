package user.utils;

import java.sql.*;

public class DataBaseConnection {
	private static final String URL = "jdbc:postgresql://localhost:5432/user_access_db";
    private static final String USER = "postgres";
    private static final String PASSWORD = "123456789";

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
    	 Class.forName("org.postgresql.Driver");
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}
