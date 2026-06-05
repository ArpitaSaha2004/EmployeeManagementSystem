<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>EMS Login</title>

    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet">

    <style>

        :root {

            --bg: #0b0f1a;
            --surface: #111827;
            --surface2: #1a2235;

            --border: rgba(255,255,255,0.08);

            --accent: #4f8ef7;

            --text: #f1f5f9;

            --text2: #94a3b8;

            --danger: #f87171;

        }

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
        }

        body{

            font-family:'DM Sans',sans-serif;

            background: var(--bg);

            min-height:100vh;

            display:flex;

            align-items:center;

            justify-content:center;

            overflow:hidden;

            color:var(--text);

        }

        .bg{

            position:absolute;
            inset:0;

            background:
                    radial-gradient(circle at top left, rgba(79,142,247,0.18), transparent 35%),
                    radial-gradient(circle at bottom right, rgba(110,231,183,0.12), transparent 35%),
                    var(--bg);

        }

        .login-card{

            position:relative;

            width:420px;

            background:var(--surface);

            border:1px solid var(--border);

            border-radius:20px;

            padding:45px;

            z-index:2;

            box-shadow:0 10px 40px rgba(0,0,0,0.45);

        }

        .logo{

            font-family:'DM Serif Display',serif;

            font-size:32px;

            margin-bottom:8px;

        }

        .subtitle{

            color:var(--text2);

            font-size:14px;

            margin-bottom:30px;

        }

        .role-box{

            display:flex;

            gap:10px;

            margin-bottom:25px;

        }

        .role-btn{

            flex:1;

            padding:12px;

            background:var(--surface2);

            border:1px solid var(--border);

            border-radius:10px;

            color:var(--text2);

            cursor:pointer;

            transition:0.2s;

            font-size:13px;

        }

        .role-btn.active{

            border-color:var(--accent);

            color:var(--accent);

            background:rgba(79,142,247,0.12);

        }

        .field{

            margin-bottom:20px;

        }

        .field label{

            display:block;

            margin-bottom:8px;

            font-size:13px;

            color:var(--text2);

        }

        .field input{

            width:100%;

            padding:14px;

            border-radius:10px;

            border:1px solid var(--border);

            background:var(--surface2);

            color:white;

            outline:none;

            font-size:14px;

        }

        .field input:focus{

            border-color:var(--accent);

        }

        .login-btn{

            width:100%;

            padding:14px;

            border:none;

            border-radius:10px;

            background:linear-gradient(135deg,var(--accent),#818cf8);

            color:white;

            font-size:15px;

            font-weight:600;

            cursor:pointer;

            transition:0.2s;

        }

        .login-btn:hover{

            opacity:0.9;

        }

        .error{

            background:rgba(248,113,113,0.1);

            color:var(--danger);

            border:1px solid rgba(248,113,113,0.2);

            padding:12px;

            border-radius:10px;

            margin-bottom:18px;

            font-size:13px;

        }

        .hint{

            margin-top:20px;

            text-align:center;

            font-size:12px;

            color:var(--text2);

        }

    </style>

</head>

<body>

<div class="bg"></div>

<div class="login-card">

    <div class="logo">EMS</div>

    <div class="subtitle">
        Employee Management System
    </div>

    <% if(request.getParameter("error") != null){ %>

    <div class="error">

        Invalid username or password

    </div>

    <% } %>

    <form action="LoginServlet" method="post">

        <div class="role-box">

            <button type="button" class="role-btn active" id="employeeBtn"
                    onclick="setRole('employee')">

                👤 Employee

            </button>

            <button type="button" class="role-btn" id="adminBtn"
                    onclick="setRole('admin')">

                🛡 Admin

            </button>

        </div>

        <input type="hidden" name="role" id="roleInput" value="employee">

        <div class="field">

            <label>Username</label>

            <input type="text" name="username" required>

        </div>

        <div class="field">

            <label>Password</label>

            <input type="password" name="password" required>

        </div>

        <button type="submit" class="login-btn">

            Sign In →

        </button>

    </form>

    <div class="hint">

        Employee Login &nbsp;|&nbsp; Admin Login

    </div>

</div>

<script>

    function setRole(role){

        document.getElementById("roleInput").value = role;

        const emp = document.getElementById("employeeBtn");

        const admin = document.getElementById("adminBtn");

        emp.classList.remove("active");

        admin.classList.remove("active");

        if(role === "employee"){

            emp.classList.add("active");

        }else{

            admin.classList.add("active");

        }

    }

</script>

</body>

</html>