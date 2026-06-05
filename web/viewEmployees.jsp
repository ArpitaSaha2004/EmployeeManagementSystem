<%@ page import="java.sql.*" %>
<%@ page import="com.ems.util.DBConnection" %>

<!DOCTYPE html>
<html>

<head>

    <title>View Employees</title>

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
            linear-gradient(
                    rgba(255,255,255,0.03) 1px,
                    transparent 1px
            ),

            linear-gradient(
                    90deg,
                    rgba(255,255,255,0.03) 1px,
                    transparent 1px
            );

            background-size:40px 40px;

            z-index:0;
        }

        .container{

            position:relative;

            z-index:1;

            max-width:1400px;

            margin:auto;
        }

        .title{

            font-size:52px;

            margin-bottom:15px;
        }

        .subtitle{

            color:#94a3b8;

            margin-bottom:40px;

            font-size:20px;
        }

        .top-bar{

            display:flex;

            justify-content:space-between;

            align-items:center;

            margin-bottom:30px;

            flex-wrap:wrap;

            gap:20px;
        }

        .sort-form{

            display:flex;

            gap:15px;

            align-items:center;
        }

        select{

            padding:14px 20px;

            border:none;

            border-radius:12px;

            background:#111c36;

            color:white;

            border:1px solid #263859;

            font-size:15px;
        }

        .sort-btn{

            padding:14px 22px;

            border:none;

            border-radius:12px;

            background:#5b7cff;

            color:white;

            font-weight:bold;

            cursor:pointer;
        }

        .back-btn{

            padding:14px 24px;

            border:none;

            border-radius:12px;

            background:#64748b;

            color:white;

            font-weight:bold;

            text-decoration:none;
        }

        .table-container{

            overflow-x:auto;

            background:#081126;

            border-radius:24px;

            border:1px solid rgba(255,255,255,0.08);
        }

        table{

            width:100%;

            border-collapse:collapse;
        }

        th{

            background:#111c36;

            padding:20px;

            text-align:left;

            color:#5b7cff;

            font-size:15px;
        }

        td{

            padding:18px 20px;

            border-top:1px solid rgba(255,255,255,0.05);

            color:#e2e8f0;
        }

        tr:hover{

            background:rgba(255,255,255,0.02);
        }

        .pagination{

            margin-top:35px;

            display:flex;

            justify-content:center;

            gap:15px;

            flex-wrap:wrap;
        }

        .page-btn{

            padding:12px 20px;

            background:#111c36;

            border:1px solid #263859;

            border-radius:10px;

            color:white;

            text-decoration:none;

            transition:0.3s;
        }

        .page-btn:hover{

            background:#5b7cff;
        }

        @media(max-width:768px){

            body{

                padding:20px;
            }

            .title{

                font-size:38px;
            }

            .top-bar{

                flex-direction:column;

                align-items:flex-start;
            }
        }

    </style>

</head>

<body>

<%

    int currentPage = 1;

    int recordsPerPage = 5;

    if(request.getParameter("page") != null){

        currentPage =
                Integer.parseInt(
                        request.getParameter("page")
                );
    }

    int start =
            (currentPage - 1) * recordsPerPage;

    String sort =
            request.getParameter("sort");

    if(sort == null){

        sort = "emp_id";
    }

%>

<div class="container">

    <div class="title">

        View Employees

    </div>

    <div class="subtitle">

        Manage and monitor employee records

    </div>

    <div class="top-bar">

        <form class="sort-form"
              method="get">

            <select name="sort">

                <option value="fname">

                    Sort By Name

                </option>

                <option value="department">

                    Sort By Department

                </option>

                <option value="salary">

                    Sort By Salary

                </option>

            </select>

            <button class="sort-btn"
                    type="submit">

                Sort

            </button>

        </form>

        <a class="back-btn"
           href="dashboard.jsp">

            Back

        </a>

    </div>

    <div class="table-container">

        <table>

            <tr>

                <th>ID</th>
                <th>Name</th>
                <th>Department</th>
                <th>Position</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Salary</th>

            </tr>

<%

    try{

        Connection con =
                DBConnection.getConnection();

        String query = "";

        if(sort.equals("salary")){

            query =
            "SELECT * FROM employees ORDER BY salary DESC LIMIT ? OFFSET ?";
        }

        else if(sort.equals("fname")){

            query =
            "SELECT * FROM employees ORDER BY fname ASC LIMIT ? OFFSET ?";
        }

        else if(sort.equals("department")){

            query =
            "SELECT * FROM employees ORDER BY department ASC LIMIT ? OFFSET ?";
        }

        else{

            query =
            "SELECT * FROM employees ORDER BY emp_id ASC LIMIT ? OFFSET ?";
        }

        PreparedStatement ps =
                con.prepareStatement(query);

        ps.setInt(1, recordsPerPage);

        ps.setInt(2, start);

        ResultSet rs =
                ps.executeQuery();

        while(rs.next()){

%>

<tr>

    <td>

        <%= rs.getInt("emp_id") %>

    </td>

    <td>

        <%= rs.getString("fname") %>
        <%= rs.getString("lname") %>

    </td>

    <td>

        <%= rs.getString("department") %>

    </td>

    <td>

        <%= rs.getString("position") %>

    </td>

    <td>

        <%= rs.getString("email") %>

    </td>

    <td>

        <%= rs.getString("phone") %>

    </td>

    <td>

        <%= rs.getDouble("salary") %>

    </td>

</tr>

<%
        }

    }

    catch(Exception e){

        out.println(e);
    }

%>

        </table>

    </div>

    <div class="pagination">

<%

    try{

        Connection con =
                DBConnection.getConnection();

        PreparedStatement ps2 =
                con.prepareStatement(

                        "SELECT COUNT(*) FROM employees"
                );

        ResultSet rs2 =
                ps2.executeQuery();

        int totalRecords = 0;

        if(rs2.next()){

            totalRecords =
                    rs2.getInt(1);
        }

        int totalPages =
                (int)Math.ceil(
                        totalRecords * 1.0
                        / recordsPerPage
                );

        if(currentPage > 1){

%>

<a class="page-btn"
   href="viewEmployees.jsp?page=<%= currentPage-1 %>&sort=<%= sort %>">

    Previous

</a>

<%
        }

        for(int i=1;i<=totalPages;i++){

%>

<a class="page-btn"
   href="viewEmployees.jsp?page=<%= i %>&sort=<%= sort %>">

    <%= i %>

</a>

<%
        }

        if(currentPage < totalPages){

%>

<a class="page-btn"
   href="viewEmployees.jsp?page=<%= currentPage+1 %>&sort=<%= sort %>">

    Next

</a>

<%
        }

    }

    catch(Exception e){

        out.println(e);
    }

%>

    </div>

</div>

</body>
</html>