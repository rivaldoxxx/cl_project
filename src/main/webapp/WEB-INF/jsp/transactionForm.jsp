<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Transaction</title>
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
        form {
            width: 50%;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }
        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #428bca;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #3071a9;
        }
    </style>
</head>
<body>
<h1>Add Transaction</h1>
<form action="${pageContext.request.contextPath}/transactions/save" method="post">
    <label for="expense">Expense</label>
    <select id="expense" name="expense.id" required>
        <c:forEach var="expense" items="${expenses}">
            <option value="${expense.id}">${expense.description} - ${expense.amount}</option>
        </c:forEach>
    </select>

    <label for="amount">Amount</label>
    <input type="number" id="amount" name="amount" step="0.01" required>

    <button type="submit">Save Transaction</button>
</form>
</body>
</html>
