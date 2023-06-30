<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form action="/hello-servlet" method="get">
    <label for="first_operand">First Operand</label>
    <input type="text" name="operand1" id="first_operand"><br>
    <label>Operator</label>
    <select name="operator">
        <option value="add">Additional</option>
        <option value="sub">Subtract</option>
        <option value="multi">Multiplication</option>
        <option value="div">Division</option>
    </select><br>
    <label for="second_operand">Second Operand</label>
    <input type="text" name="operand2" id="second_operand"><br>
    <input type="submit">
</form>
<span>
        <c:catch var="ex">
            ${result}
        </c:catch>
        <c:if test="${ex!=null}">
            ${ex.message}
        </c:if>
</span>
</body>
</html>