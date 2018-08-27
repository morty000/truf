package com.ggy.truf.test;

import com.ggy.truf.pojo.Category;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator on 2017/8/20.
 */
public class CategoryDaoImpl {

    public int insert(Category category) {
        String sql = "insert into truf_category values(null,?,?,1,?,?)";
        return update(sql, category.getParentId(), category.getName(), new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()), new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()));
    }

    /**
     * 根据不同的数据库修改database值和user、password
     */
    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://localhost:3306/db_electronicmall";
    private static final String USER = "root";
    private static final String PASSWORD = "root";

    /*
     * 将公用部分提出到成员位置，方便调用
     */
    private static Connection con = null;
    private static java.sql.PreparedStatement prest = null;
    public static ResultSet rs = null;

    /**
     * 加载驱动
     */
    static {
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            System.out.println("加載数据库驱动失败");
            e.printStackTrace();
        }
    }

    /**
     * 对数据进行增删改操作
     *
     * @return count 操作数
     */
    private static java.sql.Connection getConnection() {
        try {
            con = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException e) {
            System.out.println("获取数据库链接失败");
            e.printStackTrace();
        }
        return con;
    }

    /**
     * 对数据进行增删改操作
     *
     * @param sql
     * @param obj
     * @return count 操作数
     */
    public static int update(String sql, Object... obj) {
        int count = 0;
        getConnection();
        try {
            prest = con.prepareStatement(sql);
            if (obj != null && obj.length > 0) {
                for (int i = 0; i < obj.length; i++) {
                    prest.setObject(i + 1, obj[i]);
                }
            }
            count = prest.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return count;
    }

    /**
     * 进行查询操作
     *
     * @param sql
     * @return 返回rs集合
     */
    public static ResultSet query(String sql) {
        getConnection();
        try {
            rs = con.prepareStatement(sql).executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    /**
     * 通过给定信息进行查询操作
     *
     * @param sql
     * @param obj
     * @return 返回rs集合
     */
    public static ResultSet query(String sql, Object... obj) {
        getConnection();
        try {
            prest = con.prepareStatement(sql);
            if (obj != null && obj.length > 0) {
                for (int i = 0; i < obj.length; i++) {
                    prest.setObject(i + 1, obj[i]);
                }
            }
            rs = prest.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    /**
     * 关闭资源
     */
    public static void close() {
        if (prest != null) {
            try {
                prest.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
