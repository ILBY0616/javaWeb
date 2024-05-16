package userManage.controller;

import userManage.pojo.User;
import userManage.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class QueryController extends HttpServlet {
    UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        List<User> allUser;
        try {
            if (user.getRole().equals("管理员")) {
                allUser = userService.queryAllUser();
            } else {
                allUser = userService.queryUserByUid(user.getUid());
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("allUser", allUser);
        request.getRequestDispatcher("/query.jsp").forward(request, response);
    }
}
