<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.util.Properties" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Join Action</title>
    <link rel="stylesheet" href="https://test.youngmintest.shop/css/bootstrap.min.css">
</head>
<body>
    <%
        String userID = request.getParameter("userID");
        String userPassword = request.getParameter("userPassword");
        String userName = request.getParameter("userName");
        String userGender = request.getParameter("userGender");
        String userEmail = request.getParameter("userEmail");

        Properties props = new Properties();
        InputStream inputStream = application.getResourceAsStream("/WEB-INF/database.properties");
        props.load(inputStream);
        String dbURL = props.getProperty("dbURL");
        String dbUser = props.getProperty("dbUser");
        String dbPassword = props.getProperty("dbPassword");


        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            String sql = "INSERT INTO user (userID, userPassword, userName, userGender, userEmail) VALUES (?, ?, ?, ?, ?)";
 pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userID);
            pstmt.setString(2, userPassword);
            pstmt.setString(3, userName);
            pstmt.setString(4, userGender);
            pstmt.setString(5, userEmail);
            pstmt.executeUpdate();


                          %>
        <div class="alert alert-success w-70" role="alert">
                        Join Successful
                   </div>

        <%
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
</body>
</html>

