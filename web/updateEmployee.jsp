<%@ page import="java.sql.*" %>
<%@ page import="com.ems.util.DBConnection" %>

<!DOCTYPE html>
<html>

<head>

    <title>Update Employee</title>

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
            font-family:'Segoe UI',sans-serif;
        }

        body{

            background:#020817;

            color:white;

            min-height:100vh;

            padding:40px;
        }

        body::before{

            content:"";

            position:fixed;

            width:100%;
            height:100%;

            top:0;
            left:0;

            background:
            linear-gradient(rgba(255,255,255,0.03) 1px, transparent 1px),
            linear-gradient(90deg, rgba(255,255,255,0.03) 1px, transparent 1px);

            background-size:40px 40px;

            z-index:0;
        }

        .container{

            position:relative;

            z-index:1;

            max-width:900px;

            margin:auto;

            background:#081126;

            padding:40px;

            border-radius:25px;

            border:1px solid rgba(255,255,255,0.08);
        }

        h1{

            font-size:42px;

            margin-bottom:10px;
        }

        .subtitle{

            color:#94a3b8;

            margin-bottom:35px;
        }

        input{

            width:100%;

            padding:16px;

            border:none;

            outline:none;

            border-radius:12px;

            background:#111c36;

            border:1px solid #263859;

            color:white;

            font-size:16px;

            margin-bottom:20px;
        }

        input:focus{

            border-color:#5b7cff;
        }

        .search-btn,
        .update-btn,
        .back-btn{

            padding:16px;

            border:none;

            border-radius:12px;

            color:white;

            font-size:17px;

            font-weight:bold;

            cursor:pointer;
        }

        .search-btn{

            background:#4f7cff;
        }

        .update-btn{

            background:#22c55e;

            width:100%;

            margin-top:20px;
        }

        .back-btn{

            background:#64748b;
        }

        .form-box{

            margin-top:40px;
        }

    </style>

</head>

<body>

<%

    String updated =
            request.getParameter("updated");

%>

<%
    if(updated != null){
%>

<div id="successPopup"
     style="
     position:fixed;
     top:0;
     left:0;
     width:100%;
     height:100%;
     background:rgba(0,0,0,0.6);
     display:flex;
     justify-content:center;
     align-items:center;
     z-index:9999;
     ">

    <div style="
         background:#081126;
         padding:40px;
         border-radius:20px;
         text-align:center;
         width:350px;
         border:1px solid rgba(255,255,255,0.08);
         ">

        <h2 style="
            color:#5b7cff;
            margin-bottom:20px;
            ">

            Success

        </h2>

        <p style="
           color:white;
           margin-bottom:25px;
           ">

            Employee Updated Successfully!

        </p>

        <button onclick="window.location='dashboard.jsp'"

                style="
                padding:14px 30px;
                border:none;
                border-radius:10px;
                background:#4f7cff;
                color:white;
                font-size:16px;
                cursor:pointer;
                ">

            OK

        </button>

    </div>

</div>

<%
    }
%>

<div class="container">

    <h1>Update Employee</h1>

    <div class="subtitle">

        Search employee using employee ID

    </div>

    <form method="get">

        <input type="text"
               name="emp_id"
               placeholder="Enter Employee ID"
               required>

        <div style="display:flex; gap:20px;">

            <button class="search-btn"
                    type="submit"
                    style="flex:1;">

                Search Employee

            </button>

            <a href="dashboard.jsp"
               style="flex:1;">

                <button type="button"
                        class="back-btn"
                        style="width:100%;">

                    Back

                </button>

            </a>

        </div>

    </form>

<%

    String empId =
            request.getParameter("emp_id");

    if(empId != null){

        try{

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(

            "SELECT * FROM employees WHERE emp_id=?"
                    );

            ps.setInt(1,
                    Integer.parseInt(empId));

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()){

%>

<div class="form-box">

<form action="updateEmployee"
      method="post">

    <input type="hidden"
           name="emp_id"
           value="<%= rs.getInt("emp_id") %>">

    <input type="text"
           name="fname"
           value="<%= rs.getString("fname") %>"
           required>

    <input type="text"
           name="lname"
           value="<%= rs.getString("lname") %>"
           required>

    <input type="text"
           name="phone"
           value="<%= rs.getString("phone") %>"
           required>

    <input type="email"
           name="email"
           value="<%= rs.getString("email") %>"
           required>

    <input type="text"
           name="department"
           value="<%= rs.getString("department") %>"
           required>

    <input type="text"
           name="position"
           value="<%= rs.getString("position") %>"
           required>

    <input type="text"
           name="salary"
           value="<%= rs.getDouble("salary") %>"
           required>

    <button class="update-btn"
            type="submit">

        Update Employee

    </button>

</form>

</div>

<%
            }
            else{

%>

<script>

    alert("Employee Not Found!");

</script>

<%
            }

        }

        catch(Exception e){

            e.printStackTrace();
        }
    }

%>

</div>

</body>
</html>