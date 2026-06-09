package com.ems.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {

        Connection con = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                    "jdbc:mysql://mysql-37fdb8ad-arpitasaha-2004.h.aivencloud.com:21383/employee_management?sslMode=REQUIRED",
                    "avnadmin",
                    "AVNS_Bss4p_FbWAa6xb9X8Ik"//here use your local mysql password
            );

            System.out.println("Database Connected");

        } catch (Exception e) {

            e.printStackTrace();
        }

        return con;
    }
}