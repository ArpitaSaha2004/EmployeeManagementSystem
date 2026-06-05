package com.ems.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {

        Connection con = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/employee_management",
                    "root",
                    "YOUR_MYSQL_PASSWORD" //here use your local mysql password
            );

            System.out.println("Database Connected");

        } catch (Exception e) {

            e.printStackTrace();
        }

        return con;
    }
}