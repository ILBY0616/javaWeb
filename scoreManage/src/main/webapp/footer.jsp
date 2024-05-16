<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.net.InetAddress" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        h2 {
            font: 20px bold 仿宋;
            color: chocolate;
            text-align: center;
        }

        footer {
            margin-top: 20px;
            border-top: 3px solid chocolate;
            height: 100px;
            line-height: 100px;
        }
    </style>
</head>
<body>
<footer>
    <% InetAddress add = InetAddress.getLocalHost(); %>
    <h2>
        主机名称：<%=add.getHostName() %>
    </h2>
    <h2>
        主机地址：<%=add.getHostAddress() %>
    </h2>
    <h2>
        软工21101班 202114060108号 邱鹏 &copy;版权所有
    </h2>
</footer>
</body>
</html>