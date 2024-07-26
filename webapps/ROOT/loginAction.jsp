<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.util.Properties, javax.servlet.http.*" %>
<%@ page import="java.io.InputStream" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login Action</title>
</head>
<body>
    <%
            String userID = request.getParameter("userID");
        String userPassword = request.getParameter("userPassword");

        Properties props = new Properties();
        InputStream inputStream = application.getResourceAsStream("/WEB-INF/database.properties");
        props.load(inputStream);
        String dbURL = props.getProperty("dbURL");
        String dbUser = props.getProperty("dbUser");
        String dbPassword = props.getProperty("dbPassword");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        boolean loginSuccessful = false;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            String sql = "SELECT * FROM user WHERE userID=? AND userPassword=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userID);
            pstmt.setString(2, userPassword);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                loginSuccessful = true;
                session.setAttribute("userID", userID);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }

        if (loginSuccessful) {
            response.sendRedirect("main.jsp"); 
        } else {
            response.sendRedirect("login.jsp?error=1"); 
        }
    %>
</body>
</html>

