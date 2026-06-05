<%@ page import="java.sql.*" %>
<%@ page import="com.ems.util.DBConnection" %>

<%

    int totalEmployees = 0;
    int totalDepartments = 0;
    double averageSalary = 0;

    try{

        Connection con = DBConnection.getConnection();

        Statement st = con.createStatement();

        ResultSet rs1 = st.executeQuery(
                "SELECT COUNT(*) FROM employees"
        );

        if(rs1.next()){
            totalEmployees = rs1.getInt(1);
        }

        ResultSet rs2 = st.executeQuery(
                "SELECT COUNT(DISTINCT department) FROM employees"
        );

        if(rs2.next()){
            totalDepartments = rs2.getInt(1);
        }

        ResultSet rs3 = st.executeQuery(
                "SELECT AVG(salary) FROM employees"
        );

        if(rs3.next()){
            averageSalary = rs3.getDouble(1);
        }

    }catch(Exception e){
        e.printStackTrace();
    }

%>

<!DOCTYPE html>
<html>
<head>

    <title>Admin Dashboard</title>

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:Segoe UI,sans-serif;
        }

        body{
            background:#020817;
            color:white;
        }

        .navbar{

            width:100%;
            height:80px;

            background:#081028;

            border-bottom:1px solid #1e293b;

            display:flex;

            align-items:center;

            justify-content:space-between;

            padding:0 50px;

        }

        .logo{

            font-size:32px;

            font-weight:bold;

            color:#60a5fa;

        }

        .nav-links{

            display:flex;

            gap:30px;

            align-items:center;

        }

        .nav-links a{

            text-decoration:none;

            color:#cbd5e1;

            font-size:16px;

            transition:0.3s;

        }

        .nav-links a:hover{

            color:#60a5fa;

        }

        .logout-btn{

            background:#2563eb;

            color:white;

            border:none;

            padding:12px 18px;

            border-radius:10px;

            cursor:pointer;

            font-weight:600;

        }

        .container{

            width:92%;

            margin:auto;

            margin-top:40px;

        }

        .heading{

            margin-bottom:40px;

        }

        .heading h1{

            font-size:48px;

            margin-bottom:10px;

        }

        .heading p{

            color:#94a3b8;

            font-size:18px;

        }

        .cards{

            display:grid;

            grid-template-columns:repeat(3,1fr);

            gap:25px;

        }

        .card{

            background:#081028;

            border:1px solid #1e293b;

            border-radius:22px;

            padding:35px;

            transition:0.3s;

        }

        .card:hover{

            transform:translateY(-5px);

            border-color:#2563eb;

        }

        .card h3{

            color:#94a3b8;

            margin-bottom:18px;

            font-size:17px;

        }

        .card h1{

            font-size:50px;

        }

        .salary{

            color:#22c55e;

        }

        .bottom-section{

            margin-top:60px;

            display:flex;

            justify-content:space-between;

            align-items:center;

        }

        .back-btn{

            text-decoration:none;

            background:#111c44;

            color:white;

            padding:14px 22px;

            border-radius:12px;

            transition:0.3s;

        }

        .back-btn:hover{

            background:#1e3a8a;

        }

    </style>

</head>

<body>

<div class="navbar">

    <div class="logo">

        EMS

    </div>

    <div class="nav-links">

        <a href="dashboard.jsp">

            Dashboard

        </a>

        <a href="employees.jsp">

            Employees

        </a>

        <form action="login.jsp">

            <button class="logout-btn">

                Logout

            </button>

        </form>

    </div>

</div>

<div class="container">

    <div class="heading">

        <h1>

            Admin Dashboard

        </h1>

        <p>

            Overview of your employee management system

        </p>

    </div>

    <div class="cards">

        <div class="card">

            <h3>

                Total Employees

            </h3>

            <h1>

                <%= totalEmployees %>

            </h1>

        </div>

        <div class="card">

            <h3>

                Total Departments

            </h3>

            <h1>

                <%= totalDepartments %>

            </h1>

        </div>

        <div class="card">

            <h3>

                Average Salary

            </h3>

            <h1 class="salary">

                 <%= (int)averageSalary %>

            </h1>

        </div>

    </div>

    <div class="bottom-section">

        <a href="login.jsp"
           class="back-btn">

            Back

        </a>

    </div>

</div>

</body>
</html>