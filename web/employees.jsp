<%@ page import="java.util.ArrayList" %>
<%@ page import="com.ems.dao.EmployeeDAO" %>
<%@ page import="com.ems.model.Employee" %>

<%

    EmployeeDAO dao =
            new EmployeeDAO();

    String sort =
            request.getParameter("sort");

    String search =
            request.getParameter("search");

    int currentPage = 1;

    int recordsPerPage = 5;

    if(request.getParameter("page") != null){

        currentPage = Integer.parseInt(
        request.getParameter("page").trim()
        );

    }

    int start =
    (currentPage - 1) * recordsPerPage;

    ArrayList<Employee> list =
            dao.getEmployeesByPage(
            start,
            recordsPerPage,
            sort,
            search
            );
    int totalEmployees =
            dao.getTotalEmployeeCount();

    int totalPages =
            (int)Math.ceil(
            totalEmployees * 1.0
            / recordsPerPage
            );

    int randomId =
            (int)(Math.random() * 9000) + 1000;

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

        }

        .logout-btn{

            background:#2563eb;

            color:white;

            border:none;

            padding:12px 20px;

            border-radius:12px;

            cursor:pointer;

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

            font-size:55px;

        }

        .heading p{

            color:#94a3b8;

            margin-top:8px;

        }

        .add-btn{

            background:#2563eb;

            color:white;

            border:none;

            padding:14px 24px;

            border-radius:14px;

            font-size:16px;

            cursor:pointer;

        }

        .employee-card{

            background:#081028;

            border-radius:24px;

            overflow:hidden;

            border:1px solid #1e293b;

        }

        .table-top{

            display:flex;

            justify-content:space-between;

            align-items:center;

            padding:28px;

            border-bottom:1px solid #1e293b;

        }

        .table-title{

            font-size:24px;

            font-weight:bold;

        }

        .search-box input{

            width:320px;

            background:#111c44;

            border:none;

            padding:14px;

            border-radius:12px;

            color:white;

            outline:none;

        }

        .sort-section{

            display:flex;

            gap:15px;

            padding:20px 30px;

            border-bottom:1px solid #1e293b;

        }

        .sort-section a{

            text-decoration:none;

        }

        .sort-btn{

            background:#111c44;

            color:white;

            border:none;

            padding:10px 16px;

            border-radius:20px;

            cursor:pointer;

        }

        .sort-btn:hover{

            background:#2563eb;

        }

        table{

            width:100%;

            border-collapse:collapse;

        }

        th{

            padding:22px;

            text-align:left;

            color:#94a3b8;

            border-bottom:1px solid #1e293b;

        }

        td{

            padding:24px 22px;

            border-bottom:1px solid #1e293b;

        }

        tr:hover{

            background:#0f172a;

        }

        .employee-name{

            font-size:18px;

            font-weight:bold;

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

            font-size:13px;

        }

        .salary{

            color:#22c55e;

            font-weight:bold;

        }

        .role{

            color:#facc15;

            font-weight:bold;

        }

        .action-buttons{

            display:flex;

            gap:10px;

        }

        .icon-btn{

            border:none;

            padding:10px 14px;

            border-radius:10px;

            color:white;

            cursor:pointer;

        }

        .edit-btn{

            background:#2563eb;

        }

        .delete-btn{

            background:#dc2626;

        }

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

        .employee-id{

            background:#2563eb;

            padding:10px 18px;

            border-radius:12px;

            font-weight:bold;

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

        }

        .pagination{

            display:flex;

            justify-content:center;

            gap:12px;

            padding:30px;

        }

        .page-btn{

            width:42px;

            height:42px;

            border:none;

            border-radius:10px;

            background:#111c44;

            color:white;

            cursor:pointer;

            font-weight:bold;

        }

        .page-btn:hover{

            background:#2563eb;

        }

        .active{

            background:#2563eb;

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
                Manage all employee records
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

        <form method="get"
              action="employees.jsp"
              style="display:flex;
              gap:12px;">

            <input type="text"
                   name="search"
                   placeholder="Search employee..."
                   value="<%= search != null ? search : "" %>"

                   style="
                   width:260px;
                   background:#111c44;
                   border:none;
                   padding:14px;
                   border-radius:12px;
                   color:white;
                   outline:none;">

            <button type="submit"
                    class="add-btn">

                Search

            </button>

        </form>

    </div>


        </div>

        <div class="sort-section">

            <a href="employees.jsp?sort=name">

                <button class="sort-btn">

                    Sort by Name

                </button>

            </a>

            <a href="employees.jsp?sort=department">

                <button class="sort-btn">

                    Sort by Department

                </button>

            </a>

            <a href="employees.jsp?sort=salary">

                <button class="sort-btn">

                    Sort by Salary

                </button>

            </a>

            <a href="employees.jsp?sort=position">

                <button class="sort-btn">

                    Sort by Position

                </button>

            </a>

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

                    Rs. <%= e.getSalary() %>

                </td>

                <td class="role">

                    <%= e.getRole() %>

                </td>

                <td>

                    <div class="action-buttons">

                        <button class="icon-btn edit-btn"

                                onclick="openEditModal(
                                '<%= e.getId() %>',
                                '<%= e.getFname() %>',
                                '<%= e.getLname() %>',
                                '<%= e.getEmail() %>',
                                '<%= e.getDepartment() %>',
                                '<%= e.getPosition() %>',
                                '<%= e.getSalary() %>',
                                '<%= e.getPhone() %>',
                                '<%= e.getRole() %>'
                                )">

                            Edit

                        </button>

                        <button class="icon-btn delete-btn"

                                onclick="openDeleteModal(
                                '<%= e.getId() %>',
                                '<%= e.getFname() %> <%= e.getLname() %>'
                                )">

                            Delete

                        </button>

                    </div>

                </td>

            </tr>

            <%

                }

            %>

        </table>

        </table>

   <div class="pagination">

       <% if(currentPage > 1){ %>

           <a href="employees.jsp?page=<%= currentPage - 1 %>
           <% if(sort != null){ %>
           &sort=<%= sort %>
           <% } %>">

               <button class="page-btn">

                   Prev

               </button>

           </a>

       <% } %>

       <%

           for(int i=1;i<=totalPages;i++){

       %>

       <a href="employees.jsp?page=<%= i %>
       <% if(sort != null){ %>
       &sort=<%= sort %>
       <% } %>">

           <button class="page-btn
           <%= (currentPage == i)
           ? "active"
           : "" %>">

               <%= i %>

           </button>

       </a>

       <%

           }

       %>

       <% if(currentPage < totalPages){ %>

           <a href="employees.jsp?page=<%= currentPage + 1 %>
           <% if(sort != null){ %>
           &sort=<%= sort %>
           <% } %>">

               <button class="page-btn">

                   Next

               </button>

           </a>

       <% } %>

   </div>


<!-- ADD EMPLOYEE MODAL -->

<div class="modal-overlay"
     id="employeeModal">

    <div class="modal">

        <div class="modal-top">

            <h2>Add Employee</h2>

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

                    <label>Email</label>

                    <input type="email"
                           name="email"
                           required>

                </div>

                <div class="input-group">

                    <label>Department</label>

                    <input type="text"
                           name="department">

                </div>

                <div class="input-group">

                    <label>Position</label>

                    <input type="text"
                           name="position">

                </div>

                <div class="input-group">

                    <label>Salary</label>

                    <input type="number"
                           name="salary">

                </div>

                <div class="input-group">

                    <label>Phone</label>

                    <input type="text"
                           name="phone">

                </div>

                <div class="input-group">

                    <label>Username</label>

                    <input type="text"
                           name="username"
                           required>

                </div>

                <div class="input-group">

                    <label>Password</label>

                    <input type="password"
                           name="password"
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

<!-- EDIT MODAL -->

<div class="modal-overlay"
     id="editModal">

    <div class="modal">

        <h2 style="margin-bottom:20px;">

            Edit Employee

        </h2>

        <form action="UpdateEmployeeServlet"
              method="post">

              <input type="hidden"
                     name="page"
                     value="<%= currentPage %>">

            <input type="hidden"
                   id="editId"
                   name="id">

            <div class="form-grid">

                <div class="input-group">

                    <label>First Name</label>

                    <input type="text"
                           id="editFname"
                           name="fname">

                </div>

                <div class="input-group">

                    <label>Last Name</label>

                    <input type="text"
                           id="editLname"
                           name="lname">

                </div>

                <div class="input-group full-width">

                    <label>Email</label>

                    <input type="email"
                           id="editEmail"
                           name="email">

                </div>

                <div class="input-group">

                    <label>Department</label>

                    <input type="text"
                           id="editDepartment"
                           name="department">

                </div>

                <div class="input-group">

                    <label>Position</label>

                    <input type="text"
                           id="editPosition"
                           name="position">

                </div>

                <div class="input-group">

                    <label>Salary</label>

                    <input type="number"
                           id="editSalary"
                           name="salary">

                </div>

                <div class="input-group">

                    <label>Phone</label>

                    <input type="text"
                           id="editPhone"
                           name="phone">

                </div>

                <div class="input-group">

                    <label>Role</label>

                    <select id="editRole"
                            name="role">

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
                        onclick="closeEditModal()">

                    Cancel

                </button>

                <button type="submit"
                        class="save-btn">

                    Save Changes

                </button>

            </div>

        </form>

    </div>

</div>

<!-- DELETE MODAL -->

<div class="modal-overlay"
     id="deleteModal">

    <div class="modal"
         style="width:450px;">

        <h2 style="margin-bottom:15px;">

            Delete Employee

        </h2>

        <p style="color:#94a3b8;">

            This action cannot be undone.

        </p>

        <div style="
             margin-top:20px;
             color:#fca5a5;
             ">

            Are you sure you want to permanently
            delete this employee?

        </div>

        <div class="modal-buttons">

            <button class="cancel-btn"
                    onclick="closeDeleteModal()">

                Cancel

            </button>

            <button class="save-btn"
                    style="background:#dc2626;"
                    onclick="deleteEmployee()">

                Delete

            </button>

        </div>

    </div>

</div>

<script>

    let deleteEmployeeId = 0;

    function openModal(){

        document.getElementById(
        "employeeModal"
        ).style.display = "flex";

    }

    function closeModal(){

        document.getElementById(
        "employeeModal"
        ).style.display = "none";

    }

    function openEditModal(
    id,
    fname,
    lname,
    email,
    department,
    position,
    salary,
    phone,
    role
    ){

        document.getElementById(
        "editModal"
        ).style.display = "flex";

        document.getElementById(
        "editId"
        ).value = id;

        document.getElementById(
        "editFname"
        ).value = fname;

        document.getElementById(
        "editLname"
        ).value = lname;

        document.getElementById(
        "editEmail"
        ).value = email;

        document.getElementById(
        "editDepartment"
        ).value = department;

        document.getElementById(
        "editPosition"
        ).value = position;

        document.getElementById(
        "editSalary"
        ).value = salary;

        document.getElementById(
        "editPhone"
        ).value = phone;

        document.getElementById(
        "editRole"
        ).value = role;

    }

    function closeEditModal(){

        document.getElementById(
        "editModal"
        ).style.display = "none";

    }

    function openDeleteModal(id){

        deleteEmployeeId = id;

        document.getElementById(
        "deleteModal"
        ).style.display = "flex";

    }

    function closeDeleteModal(){

        document.getElementById(
        "deleteModal"
        ).style.display = "none";

    }

    function deleteEmployee(){

        window.location.href =
        "DeleteEmployeeServlet?id="
        + deleteEmployeeId;

    }

    if(window.location.href.includes("page=")){

        window.onload = function(){

            document.querySelector(
            ".employee-card"
            ).scrollIntoView({

                behavior:"smooth"

            });

        }

    }

</script>

</body>
</html>