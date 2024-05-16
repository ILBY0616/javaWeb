<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>deleteRequest</title>
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
<form action="deleteResponse.jsp" method="post">
    <h2>请输入删除条件</h2>
    <div>
        <label>
            <select name="deleteKey">
                <option value="id">学号</option>
                <option value="name">姓名</option>
            </select>
        </label>
        <label>
            <input type="text" name="deleteValue">
        </label>
        <input type="submit" value="删除">
    </div>
</form>
<%@ include file="footer.jsp" %>
</body>
</html>
