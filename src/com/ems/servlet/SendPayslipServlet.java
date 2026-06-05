package com.ems.servlet;

import com.ems.util.DBConnection;

import javax.mail.*;
import javax.mail.internet.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.IOException;

import java.sql.*;

import java.util.Properties;

@WebServlet("/SendPayslipServlet")

public class SendPayslipServlet
        extends HttpServlet {

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)

            throws ServletException,
            IOException {

        HttpSession session =
                request.getSession();

        String username =
                (String)session.getAttribute(
                        "username"
                );

        try{

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(

                            "SELECT * FROM employees WHERE username=?"

                    );

            ps.setString(1, username);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()){

                String fname =
                        rs.getString("fname");

                String lname =
                        rs.getString("lname");

                String email =
                        rs.getString("email");

                String department =
                        rs.getString("department");

                String position =
                        rs.getString("position");

                int empId =
                        rs.getInt("id");

                double basicSalary =
                        rs.getDouble("salary");

                double hra =
                        basicSalary * 0.10;

                double bonus =
                        basicSalary * 0.05;

                double tax =
                        basicSalary * 0.08;

                double netSalary =
                        basicSalary +
                                hra +
                                bonus -
                                tax;

                // YOUR GMAIL

                final String senderEmail =
                        "arpitasaha.april17@gmail.com";

                // APP PASSWORD

                final String senderPassword =
                        "kutogvskgykxdnln";

                Properties props =
                        new Properties();

                props.put(
                        "mail.smtp.host",
                        "smtp.gmail.com"
                );

                props.put(
                        "mail.smtp.port",
                        "587"
                );

                props.put(
                        "mail.smtp.auth",
                        "true"
                );

                props.put(
                        "mail.smtp.starttls.enable",
                        "true"
                );

                Session mailSession =
                        Session.getInstance(
                                props,

                                new Authenticator(){

                                    protected PasswordAuthentication
                                    getPasswordAuthentication(){

                                        return new PasswordAuthentication(

                                                senderEmail,
                                                senderPassword

                                        );

                                    }

                                }

                        );

                Message message =
                        new MimeMessage(
                                mailSession
                        );

                message.setFrom(

                        new InternetAddress(
                                senderEmail
                        )

                );

                message.setRecipients(

                        Message.RecipientType.TO,

                        InternetAddress.parse(
                                email
                        )

                );

                message.setSubject(

                        "Salary Payslip - May 2026"

                );

                String mailText =

                        "Dear " + fname + " " + lname +

                                "\n\nYour salary payslip has been generated.\n\n" +

                                "Employee ID: EMP" + empId +

                                "\nDepartment: " + department +

                                "\nPosition: " + position +

                                "\n\nBasic Salary: ₹" + basicSalary +

                                "\nHRA: ₹" + hra +

                                "\nBonus: ₹" + bonus +

                                "\nTax Deduction: ₹" + tax +

                                "\n\nNet Salary: ₹" + netSalary +

                                "\n\nRegards,\nEMS HR Department";

                message.setText(mailText);

                Transport.send(message);

                response.sendRedirect(

                        "payslip.jsp?success=1"

                );

            }

        }

        catch(Exception e){

            e.printStackTrace();

        }

    }

}