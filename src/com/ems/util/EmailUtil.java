package com.ems.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtil {

    public static void sendEmail(

            String toEmail,

            String employeeName,

            int employeeId

    ){

        final String fromEmail =
                "arpitasaha.april17@gmail.com";

        final String password =
                "kutogvskgykxdnln";

        Properties props = new Properties();

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

        Session session =
                Session.getInstance(

                        props,

                        new javax.mail.Authenticator(){

                            protected PasswordAuthentication
                            getPasswordAuthentication(){

                                return new PasswordAuthentication(

                                        fromEmail,

                                        password
                                );
                            }
                        }
                );

        try{

            MimeMessage message =
                    new MimeMessage(session);

            message.setFrom(
                    new InternetAddress(fromEmail)
            );

            message.addRecipient(

                    Message.RecipientType.TO,

                    new InternetAddress(toEmail)
            );

            message.setSubject(
                    "Employee Registration Successful"
            );

            message.setText(

                    "Hello " + employeeName +

                            ",\n\nYour employee profile has been created successfully.\n\n"

                            +

                            "Employee ID : " + employeeId +

                            "\n\nWelcome to EMS.\n\nEMS Administration"
            );

            Transport.send(message);

            System.out.println(
                    "EMAIL SENT SUCCESSFULLY"
            );
        }

        catch(Exception e){

            System.out.println(
                    "EMAIL FAILED"
            );

            e.printStackTrace();
        }
    }
}