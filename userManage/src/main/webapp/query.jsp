<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Query</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .divHead {
            display: flex;
        }

        .left {
            flex: 1;
            text-align: left;
        }

        .left a:hover {
            text-decoration: none;
        }

        .right {
            flex: 1;
            text-align: right;
        }

        .right a:hover {
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="divHead">
        <h2 class="left">
            <a href="login.jsp">Index</a>
        </h2>
        <h2 class="right">
            <a href="query">Query</a>
        </h2>
    </div>
    <table class="table" style="text-align: center;">
        <thead class="thead-dark">
        <tr>
            <th scope="col">UID</th>
            <th scope="col">Name</th>
            <th scope="col">Password</th>
            <th scope="col">Role</th>
            <th scope="col">Status</th>
            <th scope="col" colspan="2">Action</th>
        </tr>
        </thead>
    </table>
    <c:forEach var="user" items="${requestScope.allUser}">
        <form action="upgrade" method="post">
            <table>
                <tbody>
                <tr>
                    <td>
                        <label>
                            <input type="text" value="${user.uid}" name="uid" class="form-control" readonly>
                        </label>
                    </td>
                    <td>
                        <label>
                            <input type="text" value="${user.name}" name="name" class="form-control">
                        </label>
                    </td>
                    <td>
                        <label>
                            <input type="text" value="${user.password}" name="password" class="form-control">
                        </label>
                    </td>
                    <td>
                        <label>
                            <input type="text" value="${user.role}" name="role" class="form-control">
                        </label>
                    </td>
                    <td>
                        <label>
                            <input type="text" value="${user.status}" name="status" class="form-control">
                        </label>
                    </td>
                    <td>
                        <label>
                            <a href="logout?uid=${user.uid}" class="btn btn-danger">Delete</a>
                        </label>
                    </td>
                    <td>
                        <label>
                            <button type="submit" class="btn btn-primary">Update</button>
                        </label>
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
    </c:forEach>
</div>
</body>
</html>
