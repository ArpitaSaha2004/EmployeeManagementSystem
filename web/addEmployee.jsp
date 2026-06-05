<%@ page import="java.util.ArrayList" %>
<%@ page import="com.ems.dao.EmployeeDAO" %>
<%@ page import="com.ems.model.Employee" %>

<%

    EmployeeDAO dao = new EmployeeDAO();

    ArrayList<Employee> list = dao.getAllEmployees();

    int randomId = (int)(Math.random() * 9000) + 1000;

%>

<!DOCTYPE html>
<html>
<head>

    <title>Employees</title>

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

            font-size:30px;

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

        .top-section{

            display:flex;

            justify-content:space-between;

            align-items:center;

            margin-bottom:30px;

        }

        .heading h1{

            font-size:48px;

            margin-bottom:10px;

        }

        .heading p{

            color:#94a3b8;

            font-size:17px;

        }

        .add-btn{

            background:#2563eb;

            color:white;

            padding:14px 22px;

            border-radius:12px;

            font-weight:600;

            border:none;

            cursor:pointer;

            transition:0.3s;

        }

        .add-btn:hover{

            background:#1d4ed8;

        }

        .employee-card{

            background:#081028;

            border:1px solid #1e293b;

            border-radius:20px;

            overflow:hidden;

        }

        .table-top{

            display:flex;

            justify-content:space-between;

            align-items:center;

            padding:25px;

            border-bottom:1px solid #1e293b;

        }

        .table-title{

            font-size:26px;

            font-weight:600;

        }

        .search-box input{

            width:320px;

            padding:12px;

            border:none;

            border-radius:10px;

            background:#111c44;

            color:white;

            outline:none;

        }

        .search-box input::placeholder{

            color:#94a3b8;

        }

        .sort-section{

            padding:20px 25px;

            display:flex;

            gap:15px;

            border-bottom:1px solid #1e293b;

        }

        .sort-btn{

            padding:10px 18px;

            border:none;

            border-radius:20px;

            background:#111c44;

            color:#cbd5e1;

            cursor:pointer;

            transition:0.3s;

        }

        .sort-btn:hover{

            background:#2563eb;

        }

        table{

            width:100%;

            border-collapse:collapse;

        }

        th{

            padding:20px;

            text-align:left;

            color:#94a3b8;

            border-bottom:1px solid #1e293b;

            font-size:14px;

        }

        td{

            padding:22px 20px;

            border-bottom:1px solid #1e293b;

        }

        tr:hover{

            background:#0f172a;

        }

        .employee-name{

            font-size:18px;

            font-weight:600;

            margin-bottom:5px;

        }

        .employee-email{

            color:#94a3b8;

            font-size:14px;

        }

        .dept{

            background:#1d4ed8;

            padding:8px 14px;

            border-radius:20px;

            display:inline-block;

            font-size:13px;

        }

        .salary{

            color:#22c55e;

            font-weight:bold;

        }

        .role{

            color:#facc15;

            font-weight:600;

        }

        .action-buttons{

            display:flex;

            gap:10px;

        }

        .icon-btn{

            width:42px;

            height:42px;

            border:none;

            border-radius:10px;

            cursor:pointer;

            font-size:16px;

            color:white;

        }

        .edit-btn{

            background:#2563eb;

        }

        .delete-btn{

            background:#dc2626;

        }

        .pagination{

            display:flex;

            justify-content:center;

            gap:10px;

            padding:30px;

        }

        .page-btn{

            width:40px;

            height:40px;

            border:none;

            border-radius:10px;

            background:#111c44;

            color:white;

            cursor:pointer;

        }

        .active{

            background:#2563eb;

        }

        .bottom-section{

            margin-top:40px;

            margin-bottom:40px;

        }

        .back-btn{

            text-decoration:none;

            background:#111c44;

            color:white;

            padding:14px 22px;

            border-radius:12px;

        }

        /* MODAL */

        .modal-overlay{

            position:fixed;

            top:0;

            left:0;

            width:100%;

            height:100%;

            background:rgba(0,0,0,0.7);

            display:none;

            justify-content:center;

            align-items:center;

            z-index:999;

        }

        .modal{

            width:700px;

            max-height:90vh;

            overflow-y:auto;

            background:#081028;

            border-radius:22px;

            padding:28px;

            border:1px solid #1e293b;

        }

        .modal-top{

            display:flex;

            justify-content:space-between;

            align-items:center;

            margin-bottom:20px;

        }

        .modal-title h2{

            font-size:28px;

            margin-bottom:5px;

        }

        .modal-title p{

            color:#94a3b8;

            font-size:14px;

        }

        .employee-id{

            background:#2563eb;

            padding:10px 18px;

            border-radius:14px;

            font-weight:bold;

            font-size:16px;

        }

        .form-grid{

            display:grid;

            grid-template-columns:1fr 1fr;

            gap:16px;

        }

        .full-width{

            grid-column:1/3;

        }

        .input-group{

            display:flex;

            flex-direction:column;

        }

        .input-group label{

            margin-bottom:8px;

            color:#cbd5e1;

            font-size:14px;

        }

        .input-group input,
        .input-group textarea,
        .input-group select{

            background:#111c44;

            border:1px solid #1e293b;

            padding:12px;

            border-radius:10px;

            color:white;

            outline:none;

        }

        textarea{

            resize:none;

            height:70px;

        }

        .modal-buttons{

            display:flex;

            justify-content:flex-end;

            gap:12px;

            margin-top:20px;

        }

        .cancel-btn{

            background:#1e293b;

            color:white;

            border:none;

            padding:12px 18px;

            border-radius:10px;

            cursor:pointer;

        }

        .save-btn{

            background:#2563eb;

            color:white;

            border:none;

            padding:12px 18px;

            border-radius:10px;

            cursor:pointer;

            font-weight:600;

        }

    </style>

</head>

<body>

<div class="navbar">

    <div class="logo">

        EMS

    </div>

    <div class="nav-links">

        <a href="dashboard.jsp">Dashboard</a>

        <a href="employees.jsp">Employees</a>

        <form action="login.jsp">

            <button class="logout-btn">

                Logout

            </button>

        </form>

    </div>

</div>

<div class="container">

    <div class="top-section">

        <div class="heading">

            <h1>Employees</h1>

            <p>
                Manage and view all employee records
            </p>

        </div>

        <button class="add-btn"
                onclick="openModal()">

            + Add Employee

        </button>

    </div>

    <div class="employee-card">

        <div class="table-top">

            <div class="table-title">

                All Employees

            </div>

            <div class="search-box">

                <input type="text"
                       placeholder="Search by name or department">

            </div>

        </div>

        <div class="sort-section">

            <button class="sort-btn">
                Sort by Name
            </button>

            <button class="sort-btn">
                Sort by Department
            </button>

            <button class="sort-btn">
                Sort by Salary
            </button>

            <button class="sort-btn">
                Sort by Position
            </button>

        </div>

        <table>

            <tr>

                <th>Employee</th>
                <th>Department</th>
                <th>Position</th>
                <th>Salary</th>
                <th>Role</th>
                <th>Actions</th>

            </tr>

            <%

                for(Employee e : list){

            %>

            <tr>

                <td>

                    <div class="employee-name">

                        <%= e.getFname() %>
                        <%= e.getLname() %>

                    </div>

                    <div class="employee-email">

                        <%= e.getEmail() %>

                    </div>

                </td>

                <td>

                    <span class="dept">

                        <%= e.getDepartment() %>

                    </span>

                </td>

                <td>

                    <%= e.getPosition() %>

                </td>

                <td class="salary">

                    ₹ <%= e.getSalary() %>

                </td>

                <td class="role">

                    <%= e.getRole() %>

                </td>

                <td>

                    <div class="action-buttons">

                        <button class="icon-btn edit-btn">

                            ✏️

                        </button>

                        <button class="icon-btn delete-btn">

                            🗑️

                        </button>

                    </div>

                </td>

            </tr>

            <%

                }

            %>

        </table>

        <div class="pagination">

            <button class="page-btn">←</button>

            <button class="page-btn active">1</button>

            <button class="page-btn">2</button>

            <button class="page-btn">→</button>

        </div>

    </div>

    <div class="bottom-section">

        <a href="dashboard.jsp"
           class="back-btn">

            ← Back to Dashboard

        </a>

    </div>

</div>

<!-- MODAL -->

<div class="modal-overlay"
     id="employeeModal">

    <div class="modal">

        <div class="modal-top">

            <div class="modal-title">

                <h2>Add Employee</h2>

                <p>
                    Fill employee details
                </p>

            </div>

            <div class="employee-id">

                EMP-<%= randomId %>

            </div>

        </div>

        <form action="SaveEmployeeServlet"
              method="post">

            <div class="form-grid">

                <div class="input-group">

                    <label>First Name</label>

                    <input type="text"
                           name="fname"
                           required>

                </div>

                <div class="input-group">

                    <label>Last Name</label>

                    <input type="text"
                           name="lname"
                           required>

                </div>

                <div class="input-group full-width">

                    <label>Email Address</label>

                    <input type="email"
                           name="email"
                           required>

                </div>

                <div class="input-group">

                    <label>Department</label>

                    <input type="text"
                           name="department"
                           required>

                </div>

                <div class="input-group">

                    <label>Position</label>

                    <input type="text"
                           name="position"
                           required>

                </div>

                <div class="input-group">

                    <label>Salary</label>

                    <input type="number"
                           name="salary"
                           required>

                </div>

                <div class="input-group">

                    <label>Date of Birth</label>

                    <input type="date"
                           name="dob"
                           required>

                </div>

                <div class="input-group full-width">

                    <label>Address</label>

                    <textarea name="address"></textarea>

                </div>

                <div class="input-group">

                    <label>Phone Number</label>

                    <input type="text"
                           name="phone"
                           required>

                </div>

                <div class="input-group">

                    <label>Role</label>

                    <select name="role">

                        <option value="Employee">

                            Employee

                        </option>

                        <option value="Admin">

                            Admin

                        </option>

                    </select>

                </div>

            </div>

            <div class="modal-buttons">

                <button type="button"
                        class="cancel-btn"
                        onclick="closeModal()">

                    Cancel

                </button>

                <button type="submit"
                        class="save-btn">

                    Save Employee

                </button>

            </div>

        </form>

    </div>

</div>

<script>

    function openModal(){

        document.getElementById("employeeModal").style.display = "flex";

    }

    function closeModal(){

        document.getElementById("employeeModal").style.display = "none";

    }

</script>

</body>
</html>