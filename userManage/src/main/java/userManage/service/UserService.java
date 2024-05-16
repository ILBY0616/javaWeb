package userManage.service;

import userManage.dao.Impl.UserDaoImpl;
import userManage.dao.UserDao;
import userManage.pojo.User;

import java.sql.SQLException;
import java.util.List;

public class UserService {
    static String sql = null;
    static boolean flag = false;
    UserDao userDao = new UserDaoImpl();

    public User login(String name, String password) throws SQLException {
        sql = "select * from user where name= ? and password = ?";
        Object[] args = {name, password};
        User user = userDao.findUser(sql, args);
        if (user.getName().equals(name) && user.getPassword().equals(password)) {
            return user;
        } else {
            return null;
        }
    }

    public boolean register(User user) {
        sql = "insert into user(name,password,role)" + "values(?,?,?)";
        Object[] args = {user.getName(), user.getPassword(), user.getRole()};
        int row = userDao.addUser(sql, args);
        if (row > 0) {
            flag = true;
        }
        return flag;
    }

    public boolean upgrade(int uid, String name, String password, String role, String status) {
        sql = "update user set name=?,password=?,role=?,status=? where uid=?";
        Object[] args = {name, password, role, status, uid};
        int row = userDao.updateUser(sql, args);
        if (row > 0) {
            flag = true;
        }
        return flag;
    }

    public boolean logout(int uid) {
        sql = "delete from user where uid = ?";
        Object[] args = {uid};
        int row = userDao.deleteUser(sql, args);
        if (row > 0) {
            flag = true;
        }
        return flag;
    }

    public List<User> queryUserByUid(int uid) throws SQLException {
        sql = "select * from user where uid = ?";
        Object[] args = {uid};
        return userDao.findAllUser(sql, args);
    }

    public List<User> queryUserByName(String name) throws SQLException {
        sql = "select * from user where name = ?";
        Object[] args = {name};
        return userDao.findAllUser(sql, args);
    }

    public List<User> queryAllUser() throws SQLException {
        sql = "select * from user";
        return userDao.findAllUser(sql, null);
    }
}
