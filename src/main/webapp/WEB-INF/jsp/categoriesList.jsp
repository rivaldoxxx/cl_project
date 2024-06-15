<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Categories List</title>
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
<h1>Categories List</h1>
<c:choose>
    <c:when test="${empty categories}">
        <p>No categories found.</p>
    </c:when>
    <c:otherwise>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
            </tr>
            <c:forEach var="category" items="${categories}">
                <tr>
                    <td>${category.id}</td>
                    <td>${category.name}</td>
                </tr>
            </c:forEach>
        </table>
    </c:otherwise>
</c:choose>
<a class="add-new" href="${pageContext.request.contextPath}/categories/new">Add New Category</a>
</body>
</html>
