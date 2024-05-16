package userManage.controller;

import userManage.pojo.User;
import userManage.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class RegisterController extends HttpServlet {
    UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        User user = new User();
        user.setName(name);
        user.setPassword(password);
        user.setRole(role);
        if (!name.isEmpty() && !password.isEmpty() && !role.isEmpty()) {
            try {
                if (userService.queryUserByName(name) == null) {
                    if (userService.register(user)) {
                        request.setAttribute("msg", "你好" + name);
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
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
