<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Expense Management Application</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            text-align: center;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
        }
        .btn {
            display: block;
            width: 200px;
            margin: 10px auto;
            padding: 10px;
            text-align: center;
            background-color: #428bca;
            color: #fff;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #3071a9;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Expense Management</h1>
    <a class="btn" href="${pageContext.request.contextPath}/categories/new">Add New Category</a>
    <a class="btn" href="${pageContext.request.contextPath}/expenses/selectUser">View Expenses</a>
    <a class="btn" href="${pageContext.request.contextPath}/budgets/selectUser">Manage Budgets</a>
</div>
</body>
</html>
