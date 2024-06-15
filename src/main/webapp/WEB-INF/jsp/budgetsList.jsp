<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Budget List</title>
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
<h1>Budget List</h1>
<c:choose>
    <c:when test="${empty budgets}">
        <p>No budgets found for the selected user.</p>
    </c:when>
    <c:otherwise>
        <table>
            <tr>
                <th>User</th>
                <th>Amount</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="budget" items="${budgets}">
                <tr>
                    <td>${budget.user.username}</td>
                    <td>${budget.amount}</td>
                    <td>${budget.startDate}</td>
                    <td>${budget.endDate}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/budgets/delete/${budget.id}?userId=${budget.user.id}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:otherwise>
</c:choose>
<a class="add-new" href="${pageContext.request.contextPath}/budgets/new?userId=${param.userId}">Add New Budget</a>
</body>
</html>
