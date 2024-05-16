package userManage.util;

import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;

public class DriverListener implements ServletContextListener {

    //解决 Web应用程序注册了JDBC驱动程序，但在Web应用程序停止时无法注销销它。 为防止内存泄漏，JDBC驱动程序已被强制取消注册 的问题
    public void contextDestroyed(ServletContextEvent sce) {
        AbandonedConnectionCleanupThread.uncheckedShutdown();
        Enumeration<Driver> enumeration = DriverManager.getDrivers();
        while (enumeration.hasMoreElements()) {
            try {
                DriverManager.deregisterDriver(enumeration.nextElement());
            } catch (SQLException e) {
                System.out.println("error: " + e.getMessage());
            }
        }
    }
}