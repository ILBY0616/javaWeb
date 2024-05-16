<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>addResponse</title>
    <style>
        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            border: 1px solid #ddd;
            text-align: center;
            vertical-align: top;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<%@ include file="header.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="score" class="scoreManage.pojo.Score"/>
<table>
    <caption>学生成绩信息增加</caption>
    <tr>
        <th>学号</th>
        <th>姓名</th>
        <th>高等数学</th>
        <th>大学英语</th>
        <th>程序设计</th>
        <th>数据库原理</th>
        <th>总成绩</th>
        <th>平均成绩</th>
    </tr>
    <jsp:setProperty name="score" property="*"/>
    <tr>
        <td>
            <jsp:getProperty name="score" property="id"/>
        </td>
        <td>
            <jsp:getProperty name="score" property="name"/>
        </td>
        <td>
            <jsp:getProperty name="score" property="mathScore"/>
        </td>
        <td>
            <jsp:getProperty name="score" property="englishScore"/>
        </td>
        <td>
            <jsp:getProperty name="score" property="programScore"/>
        </td>
        <td>
            <jsp:getProperty name="score" property="databaseScore"/>
        </td>
        <td>
            <jsp:getProperty name="score" property="sumScore"/>
        </td>
        <td>
            <jsp:getProperty name="score" property="averageScore"/>
        </td>
    </tr>
</table>
<%
    String message;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/javaWeb";
        Connection connection = DriverManager.getConnection(url, "root", "123456");
        String sql = "insert into score values(?, ?, ?, ?, ?, ?)";
        System.out.println(sql);
        PreparedStatement stmt = connection.prepareStatement(sql);
        stmt.setString(1, score.getId());
        stmt.setString(2, score.getName());
        stmt.setInt(3, score.getMathScore());
        stmt.setInt(4, score.getEnglishScore());
        stmt.setInt(5, score.getProgramScore());
        stmt.setInt(6, score.getDatabaseScore());
        int row = stmt.executeUpdate();
        if (row > 0) {
            message = "信息添加成功";
        } else {
            message = "信息添加失败";
        }
        stmt.close();
        connection.close();
    } catch (Exception e) {
        message = "发生错误：" + e.getMessage();
    }
%>
<div>
    <h2><%= message %>
    </h2>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
