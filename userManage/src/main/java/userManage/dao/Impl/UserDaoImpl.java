package userManage.dao.Impl;

import userManage.dao.UserDao;
import userManage.pojo.User;
import userManage.util.JdbcUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDaoImpl implements UserDao {

    @Override
    public int addUser(String sql, Object[] args) {
        JdbcUtil.open();
        int row = JdbcUtil.update(sql, args);
        JdbcUtil.close();
        return row;
    }

    @Override
    public int deleteUser(String sql, Object[] args) {
        JdbcUtil.open();
        int row = JdbcUtil.update(sql, args);
        JdbcUtil.close();
        return row;
    }

    @Override
    public int updateUser(String sql, Object[] args) {
        JdbcUtil.open();
        int row = JdbcUtil.update(sql, args);
        JdbcUtil.close();
        return row;
    }

    @Override
    public User findUser(String sql, Object[] args) throws SQLException {
        JdbcUtil.open();
        User user = null;
        try (ResultSet rs = JdbcUtil.query(sql, args)) {
            if (rs.next()) {
                user = new User();
                user.setUid(rs.getInt("uid"));
                user.setName(rs.getString("name"));
                user.setPassword(rs.getString("password"));
                user.setRole(rs.getString("role"));
                user.setStatus(rs.getString("status"));
            }
        }
        JdbcUtil.close();
        return user;
    }

    @Override
    public List<User> findAllUser(String sql, Object[] args) throws SQLException {
        JdbcUtil.open();
        List<User> allUser = new ArrayList<>();
        try (ResultSet rs = JdbcUtil.query(sql, args)) {
            while (rs.next()) {
                User user = new User();
                user.setUid(rs.getInt(1));
                user.setName(rs.getString(2));
                user.setPassword(rs.getString(3));
                user.setRole(rs.getString(4));
                user.setStatus(rs.getString(5));
                allUser.add(user);
            }
        }
        JdbcUtil.close();
        return allUser;
    }
}

