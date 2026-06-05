package com.ems.servlet;

import com.ems.util.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String username =
                request.getParameter("username");

        String password =
                request.getParameter("password");

        String role =
                request.getParameter("role");

        try {

            Connection con =
                    DBConnection.getConnection();

            // ADMIN LOGIN

            if(role.equals("admin")){

                PreparedStatement ps =
                        con.prepareStatement(

                                "SELECT * FROM admin WHERE username=? AND password=? AND role=?"

                        );

                ps.setString(1, username);

                ps.setString(2, password);

                ps.setString(3, role);

                ResultSet rs =
                        ps.executeQuery();

                if(rs.next()) {

                    response.sendRedirect(
                            "dashboard.jsp"
                    );

                }

                else {

                    response.sendRedirect(
                            "index.jsp?error=1"
                    );

                }

            }

            // EMPLOYEE LOGIN

            else if(role.equals("employee")){

                PreparedStatement ps =
                        con.prepareStatement(

                                "SELECT * FROM employees WHERE username=? AND password=?"

                        );

                ps.setString(1, username);

                ps.setString(2, password);

                ResultSet rs =
                        ps.executeQuery();

                if(rs.next()) {

                    HttpSession session =
                            request.getSession();

                    session.setAttribute(
                            "username",
                            username
                    );

                    response.sendRedirect(
                            "employeeDashboard.jsp"
                    );

                }

                else {

                    response.sendRedirect(
                            "index.jsp?error=1"
                    );

                }

            }

        }

        catch(Exception e) {

            e.printStackTrace();

        }

    }

}