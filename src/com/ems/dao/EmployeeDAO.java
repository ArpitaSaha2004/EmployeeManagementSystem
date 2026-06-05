package com.ems.dao;

import com.ems.model.Employee;
import com.ems.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;

public class EmployeeDAO {

    // ALL EMPLOYEES

    public ArrayList<Employee> getAllEmployees(){

        ArrayList<Employee> list =
                new ArrayList<>();

        try{

            Connection con =
                    DBConnection.getConnection();

            String query =
                    "SELECT * FROM employees";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ResultSet rs =
                    ps.executeQuery();

            while(rs.next()){

                Employee e =
                        new Employee();

                e.setId(
                        rs.getInt("id")
                );

                e.setFname(
                        rs.getString("fname")
                );

                e.setLname(
                        rs.getString("lname")
                );

                e.setEmail(
                        rs.getString("email")
                );

                e.setAddress(
                        rs.getString("address")
                );

                e.setDob(
                        rs.getString("dob")
                );

                e.setPhone(
                        rs.getString("phone")
                );

                e.setDepartment(
                        rs.getString("department")
                );

                e.setPosition(
                        rs.getString("position")
                );

                e.setSalary(
                        rs.getDouble("salary")
                );

                e.setRole(
                        rs.getString("role")
                );

                e.setUsername(
                        rs.getString("username")
                );

                e.setPassword(
                        rs.getString("password")
                );

                list.add(e);

            }

        }

        catch(Exception e){

            e.printStackTrace();

        }

        return list;

    }

    // SORTED EMPLOYEES

    public ArrayList<Employee> getSortedEmployees(
            String sortBy){

        ArrayList<Employee> list =
                new ArrayList<>();

        try{

            Connection con =
                    DBConnection.getConnection();

            String query =
                    "SELECT * FROM employees";

            if(sortBy != null){

                switch(sortBy){

                    case "name":

                        query +=
                                " ORDER BY fname ASC";

                        break;

                    case "department":

                        query +=
                                " ORDER BY department ASC";

                        break;

                    case "salary":

                        query +=
                                " ORDER BY salary DESC";

                        break;

                    case "position":

                        query +=
                                " ORDER BY position ASC";

                        break;

                }

            }

            PreparedStatement ps =
                    con.prepareStatement(query);

            ResultSet rs =
                    ps.executeQuery();

            while(rs.next()){

                Employee e =
                        new Employee();

                e.setId(
                        rs.getInt("id")
                );

                e.setFname(
                        rs.getString("fname")
                );

                e.setLname(
                        rs.getString("lname")
                );

                e.setEmail(
                        rs.getString("email")
                );

                e.setAddress(
                        rs.getString("address")
                );

                e.setDob(
                        rs.getString("dob")
                );

                e.setPhone(
                        rs.getString("phone")
                );

                e.setDepartment(
                        rs.getString("department")
                );

                e.setPosition(
                        rs.getString("position")
                );

                e.setSalary(
                        rs.getDouble("salary")
                );

                e.setRole(
                        rs.getString("role")
                );

                e.setUsername(
                        rs.getString("username")
                );

                e.setPassword(
                        rs.getString("password")
                );

                list.add(e);

            }

        }

        catch(Exception e){

            e.printStackTrace();

        }

        return list;

    }

    // PAGINATION

    public ArrayList<Employee> getEmployeesByPage(
            int start,
            int total,
            String sortBy,
            String search){

        ArrayList<Employee> list =
                new ArrayList<>();

        try{

            Connection con =
                    DBConnection.getConnection();

            String query =
                    "SELECT * FROM employees WHERE fname LIKE ?";

            if(search == null){

                search = "";

            }

            if(sortBy != null){

                switch(sortBy){

                    case "name":

                        query +=
                                " ORDER BY fname ASC";

                        break;

                    case "department":

                        query +=
                                " ORDER BY department ASC";

                        break;

                    case "salary":

                        query +=
                                " ORDER BY salary DESC";

                        break;

                    case "position":

                        query +=
                                " ORDER BY position ASC";

                        break;

                }

            }

            query += " LIMIT ?, ?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(
                    1,
                    "%" + search + "%"
            );

            ps.setString(
                    1,
                    "%" + search + "%"
            );

            ps.setInt(2,start);

            ps.setInt(3,total);

            ResultSet rs =
                    ps.executeQuery();

            while(rs.next()){

                Employee e =
                        new Employee();

                e.setId(
                        rs.getInt("id")
                );

                e.setFname(
                        rs.getString("fname")
                );

                e.setLname(
                        rs.getString("lname")
                );

                e.setEmail(
                        rs.getString("email")
                );

                e.setDepartment(
                        rs.getString("department")
                );

                e.setPosition(
                        rs.getString("position")
                );

                e.setSalary(
                        rs.getDouble("salary")
                );

                e.setPhone(
                        rs.getString("phone")
                );

                e.setRole(
                        rs.getString("role")
                );

                e.setUsername(
                        rs.getString("username")
                );

                e.setPassword(
                        rs.getString("password")
                );

                list.add(e);

            }

        }

        catch(Exception e){

            e.printStackTrace();

        }

        return list;

    }

    // TOTAL EMPLOYEE COUNT

    public int getTotalEmployeeCount(){

        int count = 0;

        try{

            Connection con =
                    DBConnection.getConnection();

            String query =
                    "SELECT COUNT(*) FROM employees";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()){

                count = rs.getInt(1);

            }

        }

        catch(Exception e){

            e.printStackTrace();

        }

        return count;

    }

}