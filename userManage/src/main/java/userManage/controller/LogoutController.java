package userManage.controller;

import userManage.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LogoutController extends HttpServlet {
    UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uid = request.getParameter("uid");
        if (userService.logout(Integer.parseInt(uid))) {
            request.getRequestDispatcher("query").forward(request, response);
        } else {
            /*站外转发：重定向到首页*/
            response.sendRedirect("error.jsp");
        }
    }
}
