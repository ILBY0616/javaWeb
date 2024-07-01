<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <style>
        .divForm {
            width: 500px;
            height: 400px;
            margin: 200px auto;
            padding: 50px;
            background: gainsboro;
            border-radius: 10px;
        }
    </style>
</head>
<body>
<div class="divForm">
    <h1>Login</h1>
    <form action="login" method="post">
        <div class="form-group">
            <label for="name">账号：</label>
            <input type="text" class="form-control" id="name" name="name">
        </div>
        <div class="form-group">
            <label for="password">密码：</label>
            <input type="password" class="form-control" id="password" name="password">
        </div>
        <button type="submit" class="btn btn-primary">登录</button>
        <a href="register.jsp" class="btn btn-secondary">注册</a>
        <button type="reset" class="btn btn-secondary">重置</button>
    </form>
</div>
</body>
</html>
