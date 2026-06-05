package com.ems.servlet;

import com.ems.util.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/SaveEmployeeServlet")
public class SaveEmployeeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String fname = request.getParameter("fname");

        String lname = request.getParameter("lname");

        String email = request.getParameter("email");

        String address = request.getParameter("address");

        String dob = request.getParameter("dob");

        String phone = request.getParameter("phone");

        String username =
                request.getParameter("username");

        String password =
                request.getParameter("password");

        String department = request.getParameter("department");

        String position = request.getParameter("position");

        double salary = Double.parseDouble(
                request.getParameter("salary")
        );

        String role = request.getParameter("role");

        try{

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(

                    "INSERT INTO employees\n" +
                            "(fname,lname,email,address,dob,phone,department,position,salary,role,username,password)\n" +
                            "VALUES(?,?,?,?,?,?,?,?,?,?,?,?)"

            );

            ps.setString(1,fname);

            ps.setString(2,lname);

            ps.setString(3,email);

            ps.setString(4,address);

            ps.setString(5,dob);

            ps.setString(6,phone);

            ps.setString(7,department);

            ps.setString(8,position);

            ps.setDouble(9,salary);

            ps.setString(10,role);

            ps.setString(11, username);

            ps.setString(12, password);

            ps.executeUpdate();

            response.sendRedirect("employees.jsp");

        }catch(Exception e){

            e.printStackTrace();

        }

    }
}