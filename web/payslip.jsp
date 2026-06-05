<%@ page import="java.sql.*" %>
<%@ page import="com.ems.util.DBConnection" %>

<%

    String username =
    (String)session.getAttribute(
    "username"
    );

    if(username == null){

        response.sendRedirect(
        "index.jsp"
        );

        return;

    }

    String fname = "";
    String lname = "";
    String department = "";
    String position = "";

    int empId = 0;

    double basicSalary = 0;

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

            empId =
            rs.getInt("id");

            fname =
            rs.getString("fname");

            lname =
            rs.getString("lname");

            department =
            rs.getString("department");

            position =
            rs.getString("position");

            basicSalary =
            rs.getDouble("salary");

        }

    }

    catch(Exception e){

        e.printStackTrace();

    }

    double hra =
    basicSalary * 0.10;

    double bonus =
    basicSalary * 0.05;

    double tax =
    basicSalary * 0.08;

    double netSalary =
    basicSalary + hra + bonus - tax;

%>

<!DOCTYPE html>

<html>

<head>

<title>Payslip</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial;
}

body{
    background:#020b24;
    color:white;
}

.container{
    width:75%;
    margin:50px auto;
}

.top-bar{
    display:flex;
    justify-content:space-between;
    align-items:center;
    margin-bottom:30px;
}

.title h1{
    font-size:50px;
}

.title p{
    color:#94a3b8;
    margin-top:10px;
}

.back-btn{
    background:#2563eb;
    color:white;
    padding:12px 20px;
    border-radius:10px;
    text-decoration:none;
    font-weight:bold;
}

.payslip-box{
    background:#08122f;
    padding:40px;
    border-radius:25px;
    border:1px solid #1c2b52;
}

.info-grid{
    display:grid;
    grid-template-columns:1fr 1fr;
    gap:20px;
    margin-bottom:40px;
}

.info-card{
    background:#0c183d;
    padding:20px;
    border-radius:15px;
}

.info-card label{
    color:#9ca3af;
    font-size:14px;
}

.info-card p{
    margin-top:8px;
    font-size:22px;
    font-weight:bold;
}

.salary-table{
    width:100%;
    border-collapse:collapse;
    margin-top:20px;
}

.salary-table th{
    background:#0c183d;
    padding:18px;
    text-align:left;
}

.salary-table td{
    padding:18px;
    border-bottom:1px solid #1c2b52;
}

.net-row{
    color:#22c55e;
    font-weight:bold;
    font-size:22px;
}

.btn-section{
    display:flex;
    gap:20px;
    margin-top:35px;
}

.action-btn{
    background:#2563eb;
    color:white;
    border:none;
    padding:14px 22px;
    border-radius:12px;
    cursor:pointer;
    font-weight:bold;
    text-decoration:none;
}

</style>

</head>

<body>

<div class="container">

    <div class="top-bar">

        <div class="title">

            <h1>
                Employee Payslip
            </h1>

            <p>
                Salary Slip
            </p>

        </div>

        <a href="employeeDashboard.jsp"
           class="back-btn">

           Back

        </a>

    </div>

    <div class="payslip-box">

        <div class="info-grid">

            <div class="info-card">

                <label>Employee Name</label>

                <p>
                    <%= fname %>
                    <%= lname %>
                </p>

            </div>

            <div class="info-card">

                <label>Employee ID</label>

                <p>
                    EMP<%= empId %>
                </p>

            </div>

            <div class="info-card">

                <label>Department</label>

                <p>
                    <%= department %>
                </p>

            </div>

            <div class="info-card">

                <label>Position</label>

                <p>
                    <%= position %>
                </p>

            </div>

        </div>

        <table class="salary-table">

            <tr>

                <th>Salary Component</th>
                <th>Amount</th>

            </tr>

            <tr>

                <td>Basic Salary</td>

                <td>
                     <%= basicSalary %>
                </td>

            </tr>

            <tr>

                <td>HRA (10%)</td>

                <td>
                     <%= hra %>
                </td>

            </tr>

            <tr>

                <td>Bonus (5%)</td>

                <td>
                     <%= bonus %>
                </td>

            </tr>

            <tr>

                <td>Tax Deduction (8%)</td>

                <td>
                     <%= tax %>
                </td>

            </tr>

            <tr class="net-row">

                <td>Net Salary</td>

                <td>
                     <%= netSalary %>
                </td>

            </tr>

        </table>

        <div class="btn-section">

        <a href="SendPayslipServlet"
           class="action-btn">

           Send Email

        </a>
        </div>

    </div>

</div>

</body>

</html>