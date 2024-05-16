<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .registerDiv {
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
<div class="registerDiv">
    <h2>Register</h2>
    <form action="register" method="post">
        <div class="form-group">
            <label>账号:</label>
            <label>
                <input name="name" type="text" class="form-control">
            </label>
        </div>
        <div class="form-group">
            <label>密码:</label>
            <label>
                <input name="password" type="password" class="form-control">
            </label>
        </div>
        <div class="form-group">
            <label>选择角色:</label><br>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="role" id="role1" value="商家" checked>
                <label class="form-check-label" for="role1">商家</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="role" id="role2" value="消费者">
                <label class="form-check-label" for="role2">消费者</label>
            </div>
        </div>
        <button type="submit" class="btn btn-primary">注册</button>
        <a href="login.jsp" class="btn btn-secondary">登录</a>
        <button type="reset" class="btn btn-secondary">重置</button>
    </form>
</div>
</body>
</html>
