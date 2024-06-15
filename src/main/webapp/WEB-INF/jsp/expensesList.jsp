<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Expense List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
            color: #333;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        a {
            text-decoration: none;
            color: #428bca;
        }
        a:hover {
            text-decoration: underline;
        }
        .add-new {
            display: block;
            width: 200px;
            margin: 20px auto;
            padding: 10px;
            text-align: center;
            background-color: #428bca;
            color: #fff;
            border-radius: 5px;
            text-decoration: none;
        }
        .add-new:hover {
            background-color: #3071a9;
        }
    </style>
</head>
<body>
<h1>Expense List</h1>
<c:choose>
    <c:when test="${empty expenses}">
        <p>No expenses found for the selected user.</p>
    </c:when>
    <c:otherwise>
        <table>
            <tr>
                <th>User</th>
                <th>Category</th>
                <th>Amount</th>
                <th>Date</th>
                <th>Description</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="expense" items="${expenses}">
                <tr>
                    <td>${expense.user.username}</td>
                    <td>${expense.category.name}</td>
                    <td>${expense.amount}</td>
                    <td>${expense.date}</td>
                    <td>${expense.description}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/expenses/delete/${expense.id}?userId=${expense.user.id}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:otherwise>
</c:choose>
<a class="add-new" href="${pageContext.request.contextPath}/expenses/new?userId=${param.userId}">Add New Expense</a>
</body>
</html>
