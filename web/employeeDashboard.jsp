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
    String email = "";
    String phone = "";
    String department = "";
    String position = "";
    String role = "";
    String password = "";

    double salary = 0;
    int empId = 0;

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

            fname =
            rs.getString("fname");

            lname =
            rs.getString("lname");

            email =
            rs.getString("email");

            phone =
            rs.getString("phone");

            department =
            rs.getString("department");

            position =
            rs.getString("position");

            role =
            rs.getString("role");

            password =
            rs.getString("password");

            salary =
            rs.getDouble("salary");

            empId =
            rs.getInt("id");

        }

    }

    catch(Exception e){

        e.printStackTrace();

    }

%>

<!DOCTYPE html>

<html>

<head>

<title>Employee Dashboard</title>

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

.navbar{
    width:100%;
    padding:20px 60px;
    background:#08122f;
    display:flex;
    justify-content:space-between;
    align-items:center;
    border-bottom:1px solid #1c2b52;
}

.logo{
    font-size:38px;
    font-weight:bold;
    color:#4d8dff;
}

.logout-btn{
    background:#2563eb;
    color:white;
    border:none;
    padding:12px 22px;
    border-radius:10px;
    cursor:pointer;
    text-decoration:none;
    font-weight:bold;
}

.container{
    width:90%;
    margin:auto;
    padding:50px 0;
}

.heading{
    margin-bottom:40px;
}

.heading h1{
    font-size:55px;
}

.heading p{
    color:#9ca3af;
    margin-top:10px;
    font-size:18px;
}

.card-section{
    display:grid;
    grid-template-columns:repeat(3,1fr);
    gap:25px;
    margin-bottom:40px;
}

.card{
    background:#08122f;
    padding:30px;
    border-radius:20px;
    border:1px solid #1c2b52;
}

.card h3{
    color:#9ca3af;
    margin-bottom:15px;
}

.card p{
    font-size:35px;
    font-weight:bold;
    color:#22c55e;
}

.profile-box{
    background:#08122f;
    padding:40px;
    border-radius:20px;
    border:1px solid #1c2b52;
}

.profile-box h2{
    margin-bottom:30px;
}

.profile-grid{
    display:grid;
    grid-template-columns:repeat(2,1fr);
    gap:25px;
}

.info-box{
    background:#0c183d;
    padding:20px;
    border-radius:15px;
}

.info-box label{
    color:#9ca3af;
    font-size:14px;
}

.info-box p{
    margin-top:8px;
    font-size:20px;
    font-weight:bold;
}

</style>

</head>

<body>

<div class="navbar">

    <div class="logo">
        EMS
    </div>

    <a href="index.jsp"
       class="logout-btn">

       Logout

    </a>

</div>

<div class="container">

    <div class="heading">

        <h1>
            Welcome,
            <%= fname %>
        </h1>

        <p>
            Employee Dashboard
        </p>

    </div>

    <div class="card-section">
        <div class="card">
            <h3>Salary</h3>
            <p>
                <%= salary %>
            </p>
        </div>
        <div class="card">
            <h3>Department</h3>
            <p>
                <%= department %>
            </p>
        </div>
        <div class="card">
            <h3>Position</h3>
            <p>
                <%= position %>
            </p>
        </div>
        <div class="card">
            <h3>Employee ID</h3>
            <p>
                EMP<%= empId %>
            </p>
        </div>

    </div>

    <a href="payslip.jsp"
       class="logout-btn"
       style="display:inline-block;
       margin-bottom:30px;">

       View Payslip

    </a>

    <div class="profile-box">

        <h2>
            My Profile
        </h2>

        <div class="profile-grid">

            <div class="info-box">

                <label>Full Name</label>

                <p>
                    <%= fname %>
                    <%= lname %>
                </p>

            </div>

            <div class="info-box">

                <label>Email</label>

                <p>
                    <%= email %>
                </p>

            </div>

            <div class="info-box">

                <label>Phone</label>

                <p>
                    <%= phone %>
                </p>

            </div>

            <div class="info-box">

                <label>Role</label>

                <p>
                    <%= role %>
                </p>

            </div>

            <div class="info-box">

                <label>Username</label>

                <p>
                    <%= username %>
                </p>

            </div>

            <div class="info-box">

                <label>Password</label>

                <p>
                    <%= password %>
                </p>

            </div>

        </div>

    </div>

</div>

</body>

</html>