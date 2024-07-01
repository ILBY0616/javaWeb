package userManage.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.*;

public class JdbcUtil {
    static String url = "jdbc:mysql://localhost:3306/javaWeb?serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8";
    static String username = "root";
    static String password = "123456";
    static Connection connection = null;
    static ResultSet rs = null;
    static PreparedStatement ps = null;
    static Logger logger = LoggerFactory.getLogger(JdbcUtil.class);

    public static void open() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(url, username, password);
            logger.info("数据库开启成功");
        } catch (Exception e) {
            logger.error("数据库开启失败", e);
        }
    }

    public static int update(String sql, Object[] args) {
        int row = 0;
        try {
            ps = connection.prepareStatement(sql);
            for (int i = 1; i <= args.length; i++) {
                ps.setObject(i, args[i - 1]);
            }
            row = ps.executeUpdate();
            logger.info("增删改成功");
        } catch (SQLException e) {
            logger.error("增删改失败", e);
        }
        return row;
    }

    public static ResultSet query(String sql, Object[] args) {
        boolean condition = args != null && args.length > 0;
        try {
            ps = connection.prepareStatement(sql);
            if (condition) {
                for (int i = 1; i <= args.length; i++) {
                    ps.setObject(i, args[i - 1]);
                }
            }
            rs = ps.executeQuery();
            if (condition) {
                logger.info("查询成功");
            } else {
                logger.info("查询所有成功");
            }
        } catch (SQLException e) {
            if (condition) {
                logger.error("查询失败", e);
            } else {
                logger.error("查询所有失败", e);
            }
        }
        return rs;
    }

    public static void close() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (connection != null) {
                connection.close();
            }
            logger.info("数据库关闭成功");
        } catch (SQLException e) {
            logger.error("数据库关闭失败", e);
        }
    }
}
