<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>deleteResponse</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        form {
            width: 400px;
            padding: 20px;
            background-color: #ddd;
            border-radius: 10px;
            margin: 20px auto;
        }

        form h2 {
            text-align: center;
        }

        form p {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        label {
            flex-grow: 1;
        }

        select, input[type="text"], input[type="submit"] {
            width: 100%;
            padding: 8px;
            margin-right: 10px;
        }

        input[type="submit"] {
            background-color: chocolate;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        input[type="submit"]:hover {
            background-color: #8b4513;
        }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
    String message = "";
    try {
        String key = request.getParameter("deleteKey");
        String value = request.getParameter("deleteValue");
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/javaWeb";
        Connection connection = DriverManager.getConnection(url, "root", "123456");
        String sql = "delete from score where " + key + " = ?";
        System.out.println(sql);
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, value);
        int row = preparedStatement.executeUpdate();
        if (row > 0) {
            message = "信息删除成功";
        } else {
            message = "信息删除失败";
        }
        preparedStatement.close();
        connection.close();
    } catch (Exception e) {
        System.out.println("Error: " + e.getMessage());
    }
%>
<div>
    <h2><%= message %></h2>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
