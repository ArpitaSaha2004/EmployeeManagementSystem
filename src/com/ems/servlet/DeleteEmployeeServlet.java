package com.ems.servlet;

import com.ems.util.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/DeleteEmployeeServlet")

public class DeleteEmployeeServlet
        extends HttpServlet {

    protected void doGet(

            HttpServletRequest request,

            HttpServletResponse response)

            throws ServletException,
            IOException {

        try{

            int id =
                    Integer.parseInt(
                            request.getParameter("id")
                    );

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(

                            "DELETE FROM employees WHERE id=?"

                    );

            ps.setInt(1,id);

            int row =
                    ps.executeUpdate();

            if(row > 0){

                response.sendRedirect(
                        "employees.jsp?deleted=1"
                );

            }

            else{

                response.sendRedirect(
                        "employees.jsp?deleted=0"
                );

            }

        }

        catch(Exception e){

            e.printStackTrace();

            response.getWriter().println(e);

        }
    }
}