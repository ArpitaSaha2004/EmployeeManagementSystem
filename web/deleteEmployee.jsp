<%@ page import="java.sql.*" %>
<%@ page import="com.ems.util.DBConnection" %>

<!DOCTYPE html>
<html>

<head>

    <title>Delete Employee</title>

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

            top:0;
            left:0;

            width:100%;
            height:100%;

            background:
            linear-gradient(rgba(255,255,255,0.03) 1px, transparent 1px),
            linear-gradient(90deg, rgba(255,255,255,0.03) 1px, transparent 1px);

            background-size:40px 40px;

            z-index:0;
        }

        .container{

            position:relative;

            z-index:1;

            max-width:750px;

            margin:auto;

            background:#081126;

            padding:40px;

            border-radius:25px;

            border:1px solid rgba(255,255,255,0.08);
        }

        .title{

            font-size:42px;

            margin-bottom:10px;
        }

        .subtitle{

            color:#94a3b8;

            margin-bottom:35px;
        }

        .input-group{

            margin-bottom:25px;
        }

        .input-group label{

            display:block;

            margin-bottom:10px;

            color:#94a3b8;

            font-size:15px;
        }

        .input-group input{

            width:100%;

            padding:16px;

            border:none;

            outline:none;

            border-radius:12px;

            background:#111c36;

            border:1px solid #263859;

            color:white;

            font-size:16px;
        }

        .input-group input:focus{

            border-color:#5b7cff;
        }

        .buttons{

            display:flex;

            gap:20px;

            margin-top:25px;
        }

        .search-btn{

            flex:1;

            padding:16px;

            border:none;

            border-radius:12px;

            background:#4f7cff;

            color:white;

            font-size:17px;

            font-weight:bold;

            cursor:pointer;
        }

        .back-btn{

            flex:1;

            padding:16px;

            border:none;

            border-radius:12px;

            background:#64748b;

            color:white;

            font-size:17px;

            font-weight:bold;

            cursor:pointer;
        }

        .employee-box{

            margin-top:40px;

            background:#111c36;

            padding:30px;

            border-radius:20px;

            border:1px solid rgba(255,255,255,0.05);
        }

        .employee-box h2{

            margin-bottom:25px;

            color:#ff4d6d;

            font-size:28px;
        }

        .employee-detail{

            margin-bottom:18px;

            font-size:18px;
        }

        .employee-detail span{

            color:#94a3b8;
        }

        .delete-btn{

            width:100%;

            margin-top:25px;

            padding:16px;

            border:none;

            border-radius:12px;

            background:#ff4d6d;

            color:white;

            font-size:17px;

            font-weight:bold;

            cursor:pointer;
        }

    </style>

</head>

<body>

<%

    String deleted =
            request.getParameter("deleted");

%>

<%
    if(deleted != null){
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
            color:#ff4d6d;
            margin-bottom:20px;
            ">

            Deleted

        </h2>

        <p style="
           color:white;
           margin-bottom:25px;
           ">

            Employee Deleted Successfully!

        </p>

        <button onclick="window.location='dashboard.jsp'"

                style="
                padding:14px 30px;
                border:none;
                border-radius:10px;
                background:#ff4d6d;
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

    <div class="title">

        Delete Employee

    </div>

    <div class="subtitle">

        Search employee using employee number

    </div>

    <form method="get">

        <div class="input-group">

            <label>

                Employee Number

            </label>

            <input type="text"
                   name="emp_id"
                   placeholder="Enter Employee ID"
                   required>

        </div>

        <div class="buttons">

            <button class="search-btn"
                    type="submit">

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

<div class="employee-box">

    <h2>

        Employee Details

    </h2>

    <div class="employee-detail">

        <span>Employee ID :</span>

        <%= rs.getInt("emp_id") %>

    </div>

    <div class="employee-detail">

        <span>Employee Name :</span>

        <%= rs.getString("fname") %>
        <%= rs.getString("lname") %>

    </div>

    <div class="employee-detail">

        <span>Phone Number :</span>

        <%= rs.getString("phone") %>

    </div>

    <div class="employee-detail">

        <span>Email Address :</span>

        <%= rs.getString("email") %>

    </div>

    <form action="deleteEmployee"
          method="post">

        <input type="hidden"
               name="emp_id"
               value="<%= rs.getInt("emp_id") %>">

        <button class="delete-btn"
                type="submit">

            Delete Employee

        </button>

    </form>

</div>

<%
            }
            else{

%>

<div style="
     margin-top:30px;
     background:#111c36;
     padding:20px;
     border-radius:15px;
     text-align:center;
     color:#ff4d6d;
     ">

    Employee Not Found!

</div>

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