<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add/Edit Expense</title>
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
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            width: 300px;
        }
        h1 {
            color: #333;
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group input[type="text"],
        .form-group input[type="number"],
        .form-group input[type="date"],
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .form-group input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            background-color: #5cb85c;
            color: #fff;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
        }
        .form-group input[type="submit"]:hover {
            background-color: #4cae4c;
        }
        .form-group button {
            width: 100%;
            padding: 10px;
            border: none;
            background-color: #d9534f;
            color: #fff;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
        }
        .form-group button:hover {
            background-color: #c9302c;
        }
        .error-message {
            color: red;
            font-weight: bold;
            margin-bottom: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Add/Edit Expense</h1>
    <c:if test="${not empty errorMessage}">
        <div class="error-message">${errorMessage}</div>
    </c:if>
    <form:form method="post" action="${pageContext.request.contextPath}/expenses/save?userId=${userId}" modelAttribute="expense">
        <form:hidden path="user.id" value="${userId}" />
        <div class="form-group">
            <form:label path="category.id">Category</form:label>
            <form:select path="category.id">
                <form:options items="${categories}" itemValue="id" itemLabel="name"/>
            </form:select>
        </div>
        <div class="form-group">
            <form:label path="amount">Amount</form:label>
            <form:input path="amount" type="number" step="0.01"/>
        </div>
        <div class="form-group">
            <form:label path="date">Date</form:label>
            <form:input path="date" type="date"/>
        </div>
        <div class="form-group">
            <form:label path="description">Description</form:label>
            <form:textarea path="description" />
        </div>
        <div class="form-group">
            <input type="submit" value="Save" />
        </div>
    </form:form>


    <div class="form-group">
        <button type="button" onclick="window.location.href='${pageContext.request.contextPath}/index'">Back to Main Menu</button>
    </div>
</div>
</body>
</html>
