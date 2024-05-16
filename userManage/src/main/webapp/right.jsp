<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Right</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .content {
            text-align: center;
        }
    </style>
</head>
<body>
<div class="content">
    <h1>你好${sessionScope.user.name}</h1>
    <a class="btn btn-primary" href="query">Query</a>
</div>
</body>
</html>
