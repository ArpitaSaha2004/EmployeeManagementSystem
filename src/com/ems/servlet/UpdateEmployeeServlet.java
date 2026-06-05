package com.ems.servlet;

import com.ems.util.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/UpdateEmployeeServlet")

public class UpdateEmployeeServlet
        extends HttpServlet {

    protected void doPost(

            HttpServletRequest request,

            HttpServletResponse response)

            throws ServletException,
            IOException {

        try{

            int id =
                    Integer.parseInt(
                            request.getParameter("id")
                    );

            String fname =
                    request.getParameter("fname");

            String lname =
                    request.getParameter("lname");

            String email =
                    request.getParameter("email");

            String department =
                    request.getParameter("department");

            String position =
                    request.getParameter("position");

            String phone =
                    request.getParameter("phone");

            String role =
                    request.getParameter("role");

            double salary =
                    Double.parseDouble(
                            request.getParameter("salary")
                    );

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(

                            "UPDATE employees SET fname=?, lname=?, email=?, department=?, position=?, salary=?, phone=?, role=? WHERE id=?"

                    );

            ps.setString(1, fname);

            ps.setString(2, lname);

            ps.setString(3, email);

            ps.setString(4, department);

            ps.setString(5, position);

            ps.setDouble(6, salary);

            ps.setString(7, phone);

            ps.setString(8, role);

            ps.setInt(9, id);

            ps.executeUpdate();

            String page =
                    request.getParameter("page");

            response.sendRedirect(
                    "employees.jsp?page=" + page
            );

        }

        catch(Exception e){

            e.printStackTrace();
        }
    }
}