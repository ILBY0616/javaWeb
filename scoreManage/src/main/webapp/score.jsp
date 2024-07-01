<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>score</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }

        table {
            margin: 50px auto;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>
<jsp:useBean id="score" class="scoreManage.pojo.Score"/>
<h2>全部成绩</h2>
<table>
    <tr>
        <th>学号</th>
        <th>姓名</th>
        <th>高等数学</th>
        <th>大学英语</th>
        <th>程序设计原理</th>
        <th>数据库原理</th>
        <th>总成绩</th>
        <th>平均成绩</th>
    </tr>
    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/javaWeb";
            Connection connection = DriverManager.getConnection(url, "root", "123456");
            Statement statement = connection.createStatement();
            String sql = "select * from score";
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                score.setId(rs.getString("id"));
                score.setName(rs.getString("name"));
                score.setMathScore(rs.getInt("mathScore"));
                score.setEnglishScore(rs.getInt("englishScore"));
                score.setProgramScore(rs.getInt("programScore"));
                score.setDatabaseScore(rs.getInt("databaseScore"));
    %>
    <tr>
        <td><%= score.getId() %>
        </td>
        <td><%= score.getName() %>
        </td>
        <td><%= score.getMathScore() %>
        </td>
        <td><%= score.getEnglishScore() %>
        </td>
        <td><%= score.getProgramScore() %>
        </td>
        <td><%= score.getDatabaseScore() %>
        </td>
        <td><%= score.getSumScore() %>
        </td>
        <td><%= String.format("%.2f", score.getAverageScore()) %>
        </td>
    </tr>
    <%
            }
            rs.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
    %>
</table>
<%@ include file="footer.jsp" %>
</body>
</html>
