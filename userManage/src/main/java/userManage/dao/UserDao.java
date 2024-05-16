package userManage.dao;

import userManage.pojo.User;

import java.sql.SQLException;
import java.util.List;

public interface UserDao {
    int addUser(String sql, Object[] args);

    int deleteUser(String sql, Object[] args);

    int updateUser(String sql, Object[] args);

    User findUser(String sql, Object[] args) throws SQLException;

    List<User> findAllUser(String sql, Object[] args) throws SQLException;
}
