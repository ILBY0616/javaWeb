package userManage.controller;

import userManage.pojo.User;
import userManage.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class LoginController extends HttpServlet {
    UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        try {
            if (!name.isEmpty() && !password.isEmpty()) {
                User user = userService.login(name, password);
                if (user != null && !user.getStatus().equals("封禁")) {
                    request.getSession().setAttribute("user", user);
                    request.getRequestDispatcher("right.jsp").forward(request, response);
                } else {
                    response.sendRedirect("error.jsp");
                }
            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
